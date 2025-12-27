extends CanvasLayer

func _ready() -> void:
	if GameManager.auto_start:
		GameManager.auto_start = false
		start_game()

func _on_slow_button_pressed() -> void:
	GameManager.set_difficulty(0)
	start_game()

func _on_medium_button_pressed() -> void:
	GameManager.set_difficulty(1)
	start_game()

func _on_fast_button_pressed() -> void:
	GameManager.set_difficulty(2)
	start_game()

func start_game() -> void:
	visible = false
	GameManager.start_game()
