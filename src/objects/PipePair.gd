extends Node2D



const SPEED = 200.0

func _ready() -> void:
	# Connect signals if needed, or rely on Area2D signals
	pass

func _physics_process(delta: float) -> void:
	if GameManager.current_state == GameManager.GameState.PLAYING:
		position.x -= GameManager.game_speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Bird:
		GameManager.end_game()

func _on_score_area_body_entered(body: Node2D) -> void:
	if body is Bird:
		GameManager.add_score(1)
