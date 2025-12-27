extends Node

var bird_scene = preload("res://src/actors/Bird.tscn")
var bird: Bird

func _ready():
	print("--- Starting Bird Controller Verification ---")
	
	# Instantiate Bird
	bird = bird_scene.instantiate()
	add_child(bird)
	
	# Test Initial State
	assert(bird.is_active == false, "Bird should be inactive initially")
	print("PASS: Initial State is Inactive")
	
	# Test Game Start
	GameManager.start_game()
	assert(bird.is_active == true, "Bird should be active after game start")
	print("PASS: Bird activated on Game Start")
	
	# Test Flap Logic (Simulated)
	# Note: Cannot easily simulate Input.is_action_just_pressed in headless without InputMap setup or mocking
	# So we test the flap() function directly
	# var initial_velocity = bird.velocity.y
	bird.flap()
	assert(bird.velocity.y == Bird.FLAP_FORCE, "Flap should set upward velocity")
	assert(is_equal_approx(bird.rotation_degrees, -25.0), "Flap should set rotation")
	print("PASS: Flap logic works")
	
	# Test Game Over
	GameManager.end_game()
	assert(bird.is_active == false, "Bird should be inactive after game over")
	print("PASS: Bird deactivated on Game Over")
	
	print("--- Verification Complete: ALL PASS ---")
	get_tree().quit()
