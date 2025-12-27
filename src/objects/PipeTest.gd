extends Node

var pipe_scene = preload("res://src/objects/PipePair.tscn")
var spawner_script = preload("res://src/levels/PipeSpawner.gd")

func _ready():
	print("--- Starting Pipe Verification ---")
	
	# Test Pipe Movement
	var pipe = pipe_scene.instantiate()
	add_child(pipe)
	pipe.position.x = 100
	
	# Simulate physics frame
	GameManager.current_state = GameManager.GameState.PLAYING
	pipe._physics_process(0.1)
	
	assert(pipe.position.x < 100, "Pipe should move left when playing")
	print("PASS: Pipe moves left")
	
	# Test Spawner Logic
	var spawner = Node.new()
	spawner.set_script(spawner_script)
	add_child(spawner)
	
	# Mock Game Start
	spawner._on_game_started()
	assert(spawner.timer.is_stopped() == false, "Spawner timer should start on game start")
	print("PASS: Spawner starts on Game Start")
	
	# Test Spawn
	var child_count_before = spawner.get_child_count()
	spawner.spawn_pipe()
	assert(spawner.get_child_count() > child_count_before, "Spawn_pipe should add a child")
	print("PASS: Spawner instantiates pipe")
	
	print("--- Verification Complete: ALL PASS ---")
	get_tree().quit()
