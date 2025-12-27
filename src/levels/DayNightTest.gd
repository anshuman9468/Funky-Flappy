extends Node

var cycle_script = preload("res://src/levels/DayNightCycle.gd")

func _ready():
	print("--- Starting Day/Night Verification ---")
	
	var cycle = CanvasModulate.new()
	cycle.set_script(cycle_script)
	add_child(cycle)
	cycle.cycle_duration = 1.0 # Fast cycle for testing
	
	# Test Initial Color (Should be Night-ish as t starts at 0? No, t depends on time)
	# t = (sin(0) + 1) / 2 = 0.5 -> Midpoint
	
	# Simulate Play
	GameManager.current_state = GameManager.GameState.PLAYING
	
	var initial_color = cycle.color
	cycle._process(0.1)
	
	assert(cycle.color != initial_color, "Color should change over time")
	print("PASS: Color changes during gameplay")
	
	# Test Stop (Game Over)
	GameManager.current_state = GameManager.GameState.GAME_OVER
	var color_at_stop = cycle.color
	cycle._process(0.1)
	assert(cycle.color == color_at_stop, "Color should not change on Game Over")
	print("PASS: Color change stops on Game Over")
	
	print("--- Verification Complete: ALL PASS ---")
	get_tree().quit()
