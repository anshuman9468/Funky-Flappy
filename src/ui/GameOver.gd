extends CanvasLayer

func _ready() -> void:
	GameManager.game_over.connect(_on_game_over)
	GameManager.game_started.connect(_on_game_started)
	visible = false

func _on_game_over() -> void:
	visible = true

func _on_game_started() -> void:
	visible = false

func _on_restart_button_pressed() -> void:
	GameManager.auto_start = true
	GameManager.reset_game()

func _on_menu_button_pressed() -> void:
	GameManager.auto_start = false
	GameManager.reset_game()
