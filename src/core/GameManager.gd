extends Node

# Signals
signal game_started
signal game_over
signal score_updated(new_score)
signal high_score_updated(new_high_score)

# Enums
enum GameState { IDLE, PLAYING, GAME_OVER }

# Variables
var current_state: GameState = GameState.IDLE
var score: int = 0
var high_score: int = 0
var game_speed: float = 200.0 # Default speed
var auto_start: bool = false # For restarting immediately
var audio_manager: AudioManager

func set_difficulty(level: int) -> void:
	match level:
		0: game_speed = 150.0 # Slow
		1: game_speed = 200.0 # Medium
		2: game_speed = 300.0 # Fast
		_: game_speed = 200.0
	print("Difficulty set. Speed: ", game_speed)

func _ready() -> void:
	print("GameManager initialized")

func _unhandled_input(event: InputEvent) -> void:
	if current_state == GameState.IDLE:
		if event.is_action_pressed("flap"):
			start_game()
			get_viewport().set_input_as_handled()
	elif current_state == GameState.GAME_OVER:
		if event.is_action_pressed("flap"):
			reset_game()
			get_viewport().set_input_as_handled()

func change_state(new_state: GameState) -> void:
	if current_state == new_state:
		return
		
	current_state = new_state
	print("State changed to: ", GameState.keys()[current_state])
	
	match current_state:
		GameState.IDLE:
			score = 0
			emit_signal("score_updated", score)
			# Reset game objects if needed
			
		GameState.PLAYING:
			score = 0
			emit_signal("score_updated", score)
			emit_signal("game_started")
			
		GameState.GAME_OVER:
			emit_signal("game_over")
			_check_high_score()

func add_score(amount: int = 1) -> void:
	if current_state != GameState.PLAYING:
		return
		
	score += amount
	emit_signal("score_updated", score)
	print("Score: ", score)
	if audio_manager:
		audio_manager.play_sfx("score")

func _check_high_score() -> void:
	if score > high_score:
		high_score = score
		emit_signal("high_score_updated", high_score)
		# Save high score later

func start_game() -> void:
	change_state(GameState.PLAYING)
	if audio_manager:
		audio_manager.play_music()

func end_game() -> void:
	change_state(GameState.GAME_OVER)
	if audio_manager:
		audio_manager.stop_music()
		audio_manager.play_sfx("crash")

func reset_game() -> void:
	change_state(GameState.IDLE)
	get_tree().reload_current_scene()
