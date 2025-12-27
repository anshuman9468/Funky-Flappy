extends CanvasLayer

@onready var score_label = $MarginContainer/PanelContainer/ScoreLabel

func _ready() -> void:
	GameManager.score_updated.connect(_on_score_updated)
	GameManager.game_started.connect(_on_game_started)
	GameManager.game_over.connect(_on_game_over)
	
	# Initially hidden until game starts
	visible = false

func _on_score_updated(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)

func _on_game_started() -> void:
	visible = true

func _on_game_over() -> void:
	# Keep HUD visible on Game Over so user can see final score
	visible = true
