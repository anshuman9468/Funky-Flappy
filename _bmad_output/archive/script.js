/**
 * Flappy Bird Clone
 * Refactored with Game Dev Best Practices:
 * - Delta Time (Frame-rate independence)
 * - Object Pooling (Performance)
 * - Input Manager (Decoupling)
 */

const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

// UI Elements
const startScreen = document.getElementById('start-screen');
const gameOverScreen = document.getElementById('game-over-screen');
const scoreDisplay = document.getElementById('score-display');
const finalScoreSpan = document.getElementById('final-score');
const bestScoreSpan = document.getElementById('best-score');
const restartBtn = document.getElementById('restart-btn');
const difficultyBtns = document.querySelectorAll('.difficulty-btn');

// --- Configuration ---

// Base values are designed for 60 FPS reference
// We will scale these by dt (delta time)
const TARGET_FPS = 60;
const OPTIMAL_TIME = 1000 / TARGET_FPS;

const DIFFICULTY_SETTINGS = {
    slow: {
        gravity: 1200,      // Was 900
        jumpStrength: -400, // Was -350
        pipeSpeed: 100,
        spawnRate: 2.5,
        gap: 170
    },
    medium: {
        gravity: 1600,      // Was 1200 - Heavier fall
        jumpStrength: -500, // Was -400 - Snappier jump
        pipeSpeed: 150,
        spawnRate: 1.8,
        gap: 150
    },
    fast: {
        gravity: 2000,      // Was 1600
        jumpStrength: -550, // Was -450
        pipeSpeed: 200,
        spawnRate: 1.2,
        gap: 130
    }
};

let currentSettings = DIFFICULTY_SETTINGS.medium;
let currentDifficulty = 'medium';

// --- Input Manager ---

class InputManager {
    constructor() {
        this.jumpPressed = false;
        this.jumpConsumed = false; // Ensure one jump per press

        this.handleKeyDown = this.handleKeyDown.bind(this);
        this.handleTouchStart = this.handleTouchStart.bind(this);
        this.handleMouseDown = this.handleMouseDown.bind(this);
        this.handleTouchEnd = this.handleTouchEnd.bind(this);
        this.handleKeyUp = this.handleKeyUp.bind(this);
        this.handleMouseUp = this.handleMouseUp.bind(this);

        window.addEventListener('keydown', this.handleKeyDown);
        window.addEventListener('keyup', this.handleKeyUp);
        canvas.addEventListener('mousedown', this.handleMouseDown);
        canvas.addEventListener('mouseup', this.handleMouseUp);
        canvas.addEventListener('touchstart', this.handleTouchStart, { passive: false });
        canvas.addEventListener('touchend', this.handleTouchEnd, { passive: false });
    }

    handleKeyDown(e) {
        if (e.code === 'Space') {
            e.preventDefault();
            if (!this.jumpPressed) {
                this.jumpPressed = true;
                this.jumpConsumed = false;
            }
        }
    }

    handleKeyUp(e) {
        if (e.code === 'Space') {
            this.jumpPressed = false;
        }
    }

    handleMouseDown(e) {
        if (!this.jumpPressed) {
            this.jumpPressed = true;
            this.jumpConsumed = false;
        }
    }

    handleMouseUp(e) {
        this.jumpPressed = false;
    }

    handleTouchStart(e) {
        e.preventDefault();
        if (!this.jumpPressed) {
            this.jumpPressed = true;
            this.jumpConsumed = false;
        }
    }

    handleTouchEnd(e) {
        e.preventDefault();
        this.jumpPressed = false;
    }

    isJumpTriggered() {
        if (this.jumpPressed && !this.jumpConsumed) {
            this.jumpConsumed = true;
            return true;
        }
        return false;
    }

    reset() {
        this.jumpPressed = false;
        this.jumpConsumed = false;
    }
}

const input = new InputManager();

// --- Object Pooling ---

class PipePool {
    constructor(size) {
        this.pool = [];
        this.activePipes = [];

        for (let i = 0; i < size; i++) {
            this.pool.push(new Pipe());
        }
    }

    spawn(x) {
        let pipe;
        if (this.pool.length > 0) {
            pipe = this.pool.pop();
        } else {
            // Expand pool if needed (shouldn't happen with good tuning)
            pipe = new Pipe();
        }

        pipe.reset(x);
        this.activePipes.push(pipe);
    }

    recycle(pipe) {
        const index = this.activePipes.indexOf(pipe);
        if (index > -1) {
            this.activePipes.splice(index, 1);
            this.pool.push(pipe);
        }
    }

    reset() {
        // Move all active pipes back to pool
        while (this.activePipes.length > 0) {
            this.pool.push(this.activePipes.pop());
        }
    }
}

// --- Game Classes ---

class Ground {
    constructor() {
        this.height = 100;
        this.y = 0; // Set in resize
        this.x = 0;
    }

    update(dt) {
        this.x -= currentSettings.pipeSpeed * dt;
        if (this.x <= -canvas.width) {
            this.x = 0;
        }
        this.y = canvas.height - this.height;
    }

    draw() {
        ctx.fillStyle = '#DED895';
        ctx.fillRect(this.x, this.y, canvas.width * 2, this.height);

        // Grass top
        ctx.fillStyle = '#73BF2E';
        ctx.fillRect(this.x, this.y, canvas.width * 2, 15);
        ctx.strokeStyle = '#558C22';
        ctx.beginPath();
        ctx.moveTo(this.x, this.y + 15);
        ctx.lineTo(this.x + canvas.width * 2, this.y + 15);
        ctx.stroke();

        // Pattern detail
        ctx.strokeStyle = '#CBB968';
        ctx.beginPath();
        for (let i = 0; i < canvas.width * 2; i += 20) {
            ctx.moveTo(this.x + i, this.y + 20);
            ctx.lineTo(this.x + i + 10, this.y + this.height - 10);
        }
        ctx.stroke();
    }
}

class Bird {
    constructor() {
        this.radius = 15;
        this.reset();
    }

    reset() {
        this.x = 50;
        this.y = canvas.height / 2;
        this.velocity = 0;
        this.rotation = 0;
    }

    update(dt) {
        // Apply gravity
        this.velocity += currentSettings.gravity * dt;
        this.y += this.velocity * dt;

        // Rotation
        if (this.velocity < 0) {
            this.rotation = -25 * Math.PI / 180;
        } else {
            this.rotation += (2 * 60 * dt) * Math.PI / 180; // Rotate faster with dt
            if (this.rotation > 90 * Math.PI / 180) {
                this.rotation = 90 * Math.PI / 180;
            }
        }

        // Floor collision
        if (this.y + this.radius >= canvas.height - ground.height) {
            this.y = canvas.height - ground.height - this.radius;
            gameOver();
        }

        // Ceiling collision
        if (this.y - this.radius <= 0) {
            this.y = this.radius;
            this.velocity = 0;
        }
    }

    jump() {
        this.velocity = currentSettings.jumpStrength;
        this.rotation = -25 * Math.PI / 180;
    }

    draw() {
        ctx.save();
        ctx.translate(this.x, this.y);
        ctx.rotate(this.rotation);

        // Body
        ctx.beginPath();
        ctx.arc(0, 0, this.radius, 0, Math.PI * 2);
        ctx.fillStyle = '#FFD700'; // Gold
        ctx.fill();
        ctx.lineWidth = 2;
        ctx.strokeStyle = '#fff';
        ctx.stroke();
        ctx.closePath();

        // Eye
        ctx.beginPath();
        ctx.arc(6, -6, 4, 0, Math.PI * 2);
        ctx.fillStyle = '#fff';
        ctx.fill();
        ctx.closePath();

        // Pupil
        ctx.beginPath();
        ctx.arc(8, -6, 1.5, 0, Math.PI * 2);
        ctx.fillStyle = '#000';
        ctx.fill();
        ctx.closePath();

        // Beak
        ctx.beginPath();
        ctx.moveTo(8, 2);
        ctx.lineTo(16, 6);
        ctx.lineTo(8, 10);
        ctx.fillStyle = '#F48024';
        ctx.fill();
        ctx.closePath();

        // Wing
        ctx.beginPath();
        ctx.ellipse(-5, 5, 8, 5, 0.2, 0, Math.PI * 2);
        ctx.fillStyle = '#fff';
        ctx.fill();
        ctx.closePath();

        ctx.restore();
    }
}

class Pipe {
    constructor() {
        this.width = 50;
        this.x = 0;
        this.topHeight = 0;
        this.bottomY = 0;
        this.passed = false;
    }

    reset(startX) {
        this.x = startX;
        this.passed = false;

        // Adjust pipe height to account for ground
        let maxPipeHeight = canvas.height - ground.height - currentSettings.gap - 50;
        // Ensure maxPipeHeight is valid (canvas might be small)
        if (maxPipeHeight < 50) maxPipeHeight = 50;

        this.topHeight = Math.random() * (maxPipeHeight - 50) + 50;
        this.bottomY = this.topHeight + currentSettings.gap;
    }

    update(dt) {
        this.x -= currentSettings.pipeSpeed * dt;
    }

    draw() {
        ctx.fillStyle = '#73BF2E';
        ctx.strokeStyle = '#558C22';
        ctx.lineWidth = 2;

        // Top Pipe
        ctx.fillRect(this.x, 0, this.width, this.topHeight);
        ctx.strokeRect(this.x, 0, this.width, this.topHeight);
        // Cap
        ctx.fillRect(this.x - 2, this.topHeight - 20, this.width + 4, 20);
        ctx.strokeRect(this.x - 2, this.topHeight - 20, this.width + 4, 20);

        // Bottom Pipe
        let bottomPipeHeight = canvas.height - ground.height - this.bottomY;
        // Prevent negative height drawing
        if (bottomPipeHeight < 0) bottomPipeHeight = 0;

        ctx.fillRect(this.x, this.bottomY, this.width, bottomPipeHeight);
        ctx.strokeRect(this.x, this.bottomY, this.width, bottomPipeHeight);
        // Cap
        ctx.fillRect(this.x - 2, this.bottomY, this.width + 4, 20);
        ctx.strokeRect(this.x - 2, this.bottomY, this.width + 4, 20);
    }
}

// --- Game State ---

let bird;
let ground;
let pipePool;
let score = 0;
let bestScore = localStorage.getItem('flappy_best_score') || 0;
let gameState = 'START';
let lastTime = 0;
let spawnTimer = 0;

// --- Core Functions ---

function resizeCanvas() {
    canvas.width = canvas.parentElement.clientWidth;
    canvas.height = canvas.parentElement.clientHeight;
    if (ground) ground.y = canvas.height - ground.height;
}
window.addEventListener('resize', resizeCanvas);

function init() {
    ground = new Ground();
    bird = new Bird();
    pipePool = new PipePool(10); // Pool size 10 is enough for screen
    resizeCanvas();

    score = 0;
    spawnTimer = 0;
    scoreDisplay.innerText = score;
    input.reset();
}

function setDifficulty(level) {
    currentSettings = DIFFICULTY_SETTINGS[level];
    currentDifficulty = level;
}

function startGame(level) {
    if (level) setDifficulty(level);
    init();
    gameState = 'PLAYING';

    // UI Updates
    startScreen.classList.add('hidden');
    startScreen.classList.remove('active');
    gameOverScreen.classList.add('hidden');
    gameOverScreen.classList.remove('active');
    scoreDisplay.classList.remove('hidden');

    lastTime = performance.now();
    requestAnimationFrame(gameLoop);
}

function gameOver() {
    gameState = 'GAMEOVER';
    if (score > bestScore) {
        bestScore = score;
        localStorage.setItem('flappy_best_score', bestScore);
    }
    finalScoreSpan.innerText = score;
    bestScoreSpan.innerText = bestScore;

    scoreDisplay.classList.add('hidden');
    gameOverScreen.classList.remove('hidden');
    gameOverScreen.classList.add('active');
}

function gameLoop(timestamp) {
    if (gameState !== 'PLAYING') return;

    // Calculate Delta Time (in seconds)
    const dt = (timestamp - lastTime) / 1000;
    lastTime = timestamp;

    // Cap dt to prevent huge jumps if tab is inactive
    if (dt > 0.1) {
        requestAnimationFrame(gameLoop);
        return;
    }

    update(dt);
    draw();

    requestAnimationFrame(gameLoop);
}

function update(dt) {
    // Input
    if (input.isJumpTriggered()) {
        bird.jump();
    }

    // Bird
    bird.update(dt);

    // Pipes
    spawnTimer += dt;
    if (spawnTimer >= currentSettings.spawnRate) {
        spawnTimer = 0;
        pipePool.spawn(canvas.width);
    }

    // Update active pipes
    for (let i = pipePool.activePipes.length - 1; i >= 0; i--) {
        const p = pipePool.activePipes[i];
        p.update(dt);

        // Collision
        // 1. Horizontal
        if (bird.x + bird.radius > p.x && bird.x - bird.radius < p.x + p.width) {
            // 2. Vertical
            if (bird.y - bird.radius < p.topHeight || bird.y + bird.radius > p.bottomY) {
                gameOver();
            }
        }

        // Score
        if (p.x + p.width < bird.x && !p.passed) {
            score++;
            scoreDisplay.innerText = score;
            p.passed = true;
        }

        // Recycle
        if (p.x + p.width < 0) {
            pipePool.recycle(p);
        }
    }

    // Ground
    ground.update(dt);
}

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    bird.draw();

    for (const p of pipePool.activePipes) {
        p.draw();
    }

    ground.draw();
}

// --- Event Listeners ---

difficultyBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
        e.stopPropagation();
        const level = btn.getAttribute('data-level');
        startGame(level);
    });
});

restartBtn.addEventListener('click', (e) => {
    e.stopPropagation();
    startGame(currentDifficulty);
});

// Initial Setup
init();
bird.y = canvas.height / 2;
bird.draw();
ground.draw();
