extends CharacterBody2D

class_name Bird

# Constants
const GRAVITY = 1000.0
const FLAP_FORCE = -350.0
const MAX_ROTATION = 25.0
const MIN_ROTATION = -90.0
const ROTATION_SPEED = 3.0

@export var projectile_scene: PackedScene = preload("res://src/objects/IceProjectile.tscn")

# Variables
var is_active: bool = false

func _ready() -> void:
	# Connect to Game Manager signals
	GameManager.game_started.connect(_on_game_started)
	GameManager.game_over.connect(_on_game_over)
	
	# Setup InputMap for fire if not exists
	if not InputMap.has_action("fire"):
		InputMap.add_action("fire")
		var ev = InputEventKey.new()
		ev.keycode = KEY_F
		InputMap.action_add_event("fire", ev)
	
	# Initial state
	is_active = false
	rotation_degrees = 0

func _physics_process(delta: float) -> void:
	# Only apply physics if playing or falling in game over
	if GameManager.current_state == GameManager.GameState.IDLE:
		_idle_hover(delta)
		return
		
	# Apply Gravity
	velocity.y += GRAVITY * delta
	
	# Handle Flap
	if is_active:
		if Input.is_action_just_pressed("flap"):
			flap()
		if Input.is_action_pressed("fire"): # Changed to pressed to allow holding if we wanted auto-fire, but cooldown handles rate
			shoot()
			
	# Apply Rotation
	_handle_rotation(delta)
	
	# Move and Detect Collision
	var collision = move_and_slide()
	if collision:
		_handle_collision()
		
	# Check for ground/ceiling limits
	if global_position.y > 720 or global_position.y < -100:
		_handle_collision()

func flap() -> void:
	velocity.y = FLAP_FORCE
	rotation_degrees = -25.0
	if GameManager.audio_manager:
		GameManager.audio_manager.play_sfx("flap")

var last_shot_time: int = 0
const FIRE_COOLDOWN: int = 500 # ms

func shoot() -> void:
	if not is_active:
		return
		
	var current_time = Time.get_ticks_msec()
	if current_time - last_shot_time < FIRE_COOLDOWN:
		return
		
	last_shot_time = current_time
		
	var projectile = projectile_scene.instantiate()
	projectile.global_position = global_position
	get_tree().root.add_child(projectile) # Add to root so it doesn't move with bird
	if GameManager.audio_manager:
		GameManager.audio_manager.play_sfx("shoot")

func _handle_rotation(delta: float) -> void:
	if velocity.y > 0:
		# Falling - rotate down
		if rotation_degrees < 90:
			rotation_degrees += ROTATION_SPEED * 100 * delta
			if rotation_degrees > 90:
				rotation_degrees = 90
	else:
		# Rising - rotate up
		if rotation_degrees > -25:
			rotation_degrees -= ROTATION_SPEED * 100 * delta

func _idle_hover(_delta: float) -> void:
	# Simple hover effect for menu
	position.y += sin(Time.get_ticks_msec() * 0.005) * 0.5

func _handle_collision() -> void:
	if is_active:
		is_active = false
		GameManager.end_game()

func _on_game_started() -> void:
	is_active = true
	velocity = Vector2.ZERO
	flap() # Initial flap on start

func _on_game_over() -> void:
	is_active = false
	# Bird falls to ground
