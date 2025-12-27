extends Node

func _ready():
	print("--- Starting Game Loop Verification ---")
	
	# Test Initial State
	assert(GameManager.current_state == GameManager.GameState.IDLE, "Initial state should be IDLE")
	print("PASS: Initial State is IDLE")
	
	# Test Start Game
	GameManager.start_game()
	assert(GameManager.current_state == GameManager.GameState.PLAYING, "State should be PLAYING after start_game()")
	print("PASS: State changed to PLAYING")
	
	# Test Score
	GameManager.add_score(1)
	assert(GameManager.score == 1, "Score should be 1")
	GameManager.add_score(10)
	assert(GameManager.score == 11, "Score should be 11")
	print("PASS: Score tracking works")
	
	# Test Game Over
	GameManager.end_game()
	assert(GameManager.current_state == GameManager.GameState.GAME_OVER, "State should be GAME_OVER after end_game()")
	print("PASS: State changed to GAME_OVER")
	
	# Test High Score
	assert(GameManager.high_score == 11, "High score should be updated")
	print("PASS: High Score updated")
	
	# Test Reset
	GameManager.reset_game()
	assert(GameManager.current_state == GameManager.GameState.IDLE, "State should be IDLE after reset_game()")
	assert(GameManager.score == 0, "Score should be reset to 0")
	print("PASS: Reset works")
	
	print("--- Verification Complete: ALL PASS ---")
	get_tree().quit()
