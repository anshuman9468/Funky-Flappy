extends Node

var bg_scene = preload("res://src/levels/Background.tscn")

func _ready():
	print("--- Starting Background Verification ---")
	
	var bg = bg_scene.instantiate()
	add_child(bg)
	
	# Test Initial State
	var initial_offset = bg.scroll_offset.x
	
	# Test Scrolling (Playing)
	GameManager.current_state = GameManager.GameState.PLAYING
	bg._process(0.1)
	assert(bg.scroll_offset.x < initial_offset, "Background should scroll left when playing")
	print("PASS: Background scrolls when playing")
	
	# Test Stop Scrolling (Game Over)
	GameManager.current_state = GameManager.GameState.GAME_OVER
	var offset_after_game_over = bg.scroll_offset.x
	bg._process(0.1)
	assert(bg.scroll_offset.x == offset_after_game_over, "Background should stop scrolling on Game Over")
	print("PASS: Background stops on Game Over")
	
	print("--- Verification Complete: ALL PASS ---")
	get_tree().quit()
