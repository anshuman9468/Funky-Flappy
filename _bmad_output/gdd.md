---
stepsCompleted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
inputDocuments: ['_bmad_output/game-brief.md']
documentCounts:
  briefs: 1
  research: 0
  brainstorming: 0
  projectDocs: 0
workflowType: 'gdd'
lastStep: 0
project_name: 'Flappy Bird'
user_name: 'Anshuman'
date: '2025-12-25'
game_type: 'action-platformer'
game_name: 'Funky Flappy'
---

# Funky Flappy - Game Design Document

**Author:** {{user_name}}
**Game Type:** Action Platformer
**Target Platform(s):** Web Browser (WebGL) - Desktop & Mobile

---

## Executive Summary

### Core Concept

A high-fidelity web evolution of Flappy Bird introducing elemental strategy (Ice vs Fire), realistic flight physics, and dynamic environmental effects. Players must master the rhythm of realistic wing flaps while strategically using Ice abilities to extinguish Fire Pipes in a procedurally generated, aesthetically rich world.

### Target Audience

**Primary Audience:** Casual gamers and Arcade Enthusiasts who appreciate "Realistic Arcade" aesthetics.
**Demographics:** Broad appeal, targeting players looking for high-polish web experiences.
**Gaming Experience:** Mid-Core. Players familiar with the genre but seeking higher skill ceilings and deeper mechanics (elemental strategy).
**Session Length:** Short (2-5 minutes), designed for quick, addictive loops.

### Unique Selling Points (USPs)

### Unique Selling Points (USPs)

1. **Elemental Strategy:** Active combat (Ice vs Fire) instead of just passive avoidance.
2. **Game Feel:** Realistic physics (wing modulation, tilt) making the bird feel "alive".
3. **Visual Immersion:** Dynamic Day/Night cycles and particle effects.

### Competitive Positioning

Most web clones are static and flat. Funky Flappy competes on **Game Feel** (physics/animation) and **Visual Fidelity** (particles/lighting), proving that simple mechanics can support premium experiences.

---

## Goals and Context

### Project Goals

### Project Goals

1. **Creative:** Elevate the genre with strategic depth (Elemental mechanics).
2. **Technical:** Achieve smooth 60 FPS on mobile web with high-fidelity visuals.
3. **Player Impact:** Create a premium "flow" state experience.

### Background and Rationale

The market is flooded with low-quality Flappy Bird clones. Funky Flappy aims to stand out by offering "Premium" polish, new mechanics (Ice/Fire), and high-end visual feedback (particles, lighting) usually reserved for native apps.

### Background and Rationale



---

## Core Gameplay

### Game Pillars

1. **Rhythmic Mastery:** Success depends on the rhythm of realistic wing flaps.
2. **Elemental Strategy:** Active combat (Ice vs Fire) is as important as traversal.
3. **Immersive Flow:** Visuals and audio work together to create a hypnotic state.

**Pillar Prioritization:** Elemental Strategy > Rhythmic Mastery > Immersive Flow.

### Core Gameplay Loop

Fly (Flap/Tilt) -> Avoid Obstacles -> Identify Fire Pipe -> Shoot Ice -> Score -> Repeat.

**Loop Timing:** 2-5 minutes per session.

**Loop Variation:** Procedural pipe generation, Day/Night cycle shifts, Fire pipe frequency increases.

### Win/Loss Conditions

#### Victory Conditions
High Score (Endless).

#### Failure Conditions
Collision with Pipe, Ground, or Fire.

#### Failure Recovery
Instant restart to maintain "one more try" loop.

---

## Game Mechanics

### Primary Mechanics

### Primary Mechanics

1. **Flight (Movement):** Gravity-based falling, velocity-based flapping. **Skill:** Timing & Rhythm.
2. **Ice Shot (Combat):** Projectile to extinguish fire. **Skill:** Aim & Reaction.
3. **Day/Night Cycle (Environment):** Visual shift affecting atmosphere.

### Mechanic Interactions

- **Ice vs Fire:** Ice extinguishes Fire Pipes (10s cooldown).
- **Flight vs Combat:** Must maintain flight rhythm while aiming/shooting.

### Mechanic Progression

- **Unlock:** Bird Skins (Classic, Neon, Ice).
- **Difficulty:** Speed increases, Fire Pipes appear more frequently.

### Controls and Input

**Desktop (Mouse/Keyboard):**
- **Flap:** Spacebar or Left Click
- **Ice Projectile:** 'F' Key

**Mobile (Touch):**
- **Flap:** Tap anywhere on screen
- **Ice Projectile:** Dedicated on-screen buttons located at the **Top-Left** and **Top-Right** corners for ergonomic access.

---

## Action Platformer Specific Design

### Movement System

**Core Mechanics:**
- **Variable Flap:** Tap for a standard flap. **Hold** input to extend the flap duration/strength, gaining more height (simulating a strong wing beat).
- **Auto-Runner:** Constant forward speed that increases over time.
- **Physics:** Gravity-based falling with "realistic" tilt and drag.

### Combat System

**Ice Projectile:**
- **Trajectory:** Straight line forward.
- **Fire Rate:** Balanced per bird type.
- **Impact:** Instantly extinguishes Fire Pipes, putting them in a 10s cooldown state.

### Level Design Patterns

**Structure:** Endless procedural generation.
**Hazards:**
- **Standard Pipes:** Static obstacles.
- **Fire Pipes:** Animated hazards that kill on contact unless extinguished.

### Player Abilities and Unlocks

**Unlock System:**
- **Currency:** **Coins** collected during gameplay (floating between pipes).
- **Shop:** Unlock new Bird Skins using Coins.

**Bird Stats:**
- **Classic Bird:** Balanced stats.
- **Neon Bird:** Enhanced visual trails.
- **Ice Bird:** Faster Ice Shot cooldown / Faster projectile speed.

---

## Progression and Balance

### Player Progression

### Player Progression

**Core Loop:** Play -> Collect Coins -> Unlock Birds -> Master Mechanics -> High Score.

#### Progression Types
- **Skill:** Mastering "Variable Flap" and "Ice Shot" timing.
- **Collection:** Gathering **Coins** during runs.
- **Unlocks:** Spending Coins to unlock **Neon Bird** and **Ice Bird**.

#### Progression Pacing
- **Short Term:** Collecting coins in a single run.
- **Medium Term:** Unlocking a new bird (approx. 10-20 good runs).
- **Long Term:** Beating personal High Score.

### Difficulty Curve

**Linear Scaling:** Game starts slow, then speed increases steadily over time.

#### Challenge Scaling
- **Speed:** Background and pipe scroll speed increases.
- **Hazard Density:** Fire Pipes appear more frequently as score increases.
- **Gap Size:** Pipe gaps become slightly smaller (clamped to a minimum).

#### Difficulty Options
- **Self-imposed:** Choosing to engage with Fire Pipes for points vs avoiding them.

### Economy and Resources

**Currency:** Coins.

#### Resources
- **Coins:** Floating collectibles placed between pipes (risk/reward).

#### Economy Flow
- **Earn:** Collect coins during gameplay.
- **Spend:** Buy Bird Skins in the Shop.

### Difficulty Curve



### Economy and Resources



---

## Level Design Framework

### Level Types

### Structure Type
**Endless Procedural:** No discrete levels, just one infinite run that gets progressively harder.

### Level Types (Themes)
- **Day Theme:** Bright, cheerful, standard difficulty.
- **Night Theme:** Dark, glowing neon, higher difficulty (more fire pipes).
- **Transition:** Smooth gradient shift between Day and Night based on score/distance.

#### Special Levels
- **None:** Pure endless runner focus.

### Level Progression

### Level Progression
**Linear:** Distance = Score. No level unlocks, just high score chasing.

#### Replayability
High replayability driven by:
- **Procedural Generation:** No two runs are identical.
- **High Score Competition:** The drive to beat personal bests.
- **Visual Variety:** Day/Night cycles keep the visuals fresh.

### Level Design Principles
- **Fairness:** Every pipe pattern must be passable.
- **Readability:** Fire pipes must be instantly distinguishable from safe pipes.

---

## Art and Audio Direction

### Art Style

### Art Style
**Modern Pixel Art:** High-resolution pixel art blended with modern rendering techniques (dynamic lighting, bloom, particle effects).

#### Visual References
- **Hyper Light Drifter:** For the blend of pixel art and neon lighting.
- **Flappy Bird (Original):** For the core silhouette and readability.
- **Celeste:** For fluid animation and responsive visual feedback.

#### Color Palette
- **Vibrant & High-Contrast:** Saturation is high to match the "Funky" vibe.
- **Day:** Bright blues, greens, and warm yellows.
- **Night:** Deep purples, neon pinks, and cyans.

#### Camera and Perspective
- **2D Side-Scroller:** Classic orthographic view.

### Audio and Music

#### Music Style
- **Funky/Upbeat Electronic:** Catchy, rhythmic loops that drive the flow.
- **Dynamic Tempo:** Music subtly speeds up as the game speed increases, heightening tension.

#### Sound Design
- **Crunchy & Satisfying:** Ice impacts should sound heavy and shattering.
- **Responsive:** Wing flaps should have a realistic "woosh" combined with an arcade "tap".
- **Positive Feedback:** Coin pickups need a rewarding chime.

### Aesthetic Goals
The goal is to make the game feel "juicy" and "premium" - proving that a web game can look and sound as good as a native console indie title.

### Audio and Music



---

## Technical Specifications

### Performance Requirements

{{performance_requirements}}

### Platform-Specific Details

{{platform_details}}

### Asset Requirements

{{asset_requirements}}

---

## Development Epics

### Epic Structure

### Epic Structure

1.  **Core Engine & Physics:**
    *   Project Setup (Godot 4.5).
    *   Game Loop & State Management (Godot Lifecycle).
    *   Bird Controller (CharacterBody2D, Variable Flap).
    *   Input System Implementation (InputMap).
2.  **Endless Environment:**
    *   Procedural Pipe Spawner (Object Pooling).
    *   Scrolling Backgrounds (Parallax).
    *   Day/Night Cycle Manager.
3.  **Elemental Mechanics:**
    *   Ice Projectile System.
    *   Fire Pipe Logic & Interaction.
    *   Collision Handling (Game Over).
4.  **UI & Progression:**
    *   HUD (Score, Coins).
    *   Main Menu & Game Over Screen.
    *   Shop System (Unlock Birds).
5.  **Polish & Audio:**
    *   Particle Effects (Ice shatter, Flap dust).
    *   2D Lighting Setup.
    *   Audio Manager (SFX, Dynamic Music).

---

## Success Metrics

### Technical Metrics

### Technical Metrics
*   Maintain 60 FPS on target mid-range mobile devices via WebGL.
*   Maintain 60 FPS on target mid-range mobile devices via WebGL.
*   Initial load time under 5 seconds on 4G (Godot Web export optimization).

### Gameplay Metrics
*   Average session length: 2-3 minutes.
*   "One more try" restart rate: < 1 second.

---

## Out of Scope

*   Multiplayer / Leaderboards (Phase 2).
*   Native Mobile Builds (iOS/Android App Stores) - WebGL first.
*   Complex Story Mode.

---

## Assumptions and Dependencies

*   User has a modern web browser with WebGL 2.0 support.
*   User has a modern web browser with WebGL 2.0 support.
*   Development will focus on Godot 4.5 (Stable).
