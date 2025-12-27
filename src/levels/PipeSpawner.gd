extends Node

@export var pipe_scene: PackedScene = preload("res://src/objects/PipePair.tscn")
@export var fire_pipe_scene: PackedScene = preload("res://src/objects/FirePipe.tscn")
@export var spawn_interval: float = 2.0
@export var height_range: float = 150.0

var timer: Timer

func _ready() -> void:
	# Ensure scenes are loaded
	if pipe_scene == null:
		pipe_scene = load("res://src/objects/PipePair.tscn")
	if fire_pipe_scene == null:
		fire_pipe_scene = load("res://src/objects/FirePipe.tscn")

	# Create and configure timer
	timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	
	# Connect to Game Manager signals
	GameManager.game_started.connect(_on_game_started)
	GameManager.game_over.connect(_on_game_over)

func _on_game_started() -> void:
	# Adjust timer based on speed to keep distance consistent
	# Base: 2.0s at 200 speed = 400 distance
	timer.wait_time = 400.0 / GameManager.game_speed
	timer.start()
	spawn_pipe() # Spawn first pipe immediately

func _on_game_over() -> void:
	timer.stop()

func _on_timer_timeout() -> void:
	spawn_pipe()

func spawn_pipe() -> void:
	if GameManager.current_state != GameManager.GameState.PLAYING:
		return
		
	var pipe
	# Robust check for fire_pipe_scene
	if fire_pipe_scene and randf() < 0.3: # 30% chance for Fire Pipe
		pipe = fire_pipe_scene.instantiate()
	elif pipe_scene:
		pipe = pipe_scene.instantiate()
	else:
		printerr("Error: No pipe scenes loaded!") 
		return
		
	add_child(pipe)
	
	# Randomize height
	var random_y = randf_range(-height_range, height_range)
	pipe.position = Vector2(1300, 360 + random_y) # Spawn off-screen right, centered vertically + offset
