extends CanvasModulate

@export var day_color: Color = Color(1, 1, 1, 1)
@export var night_color: Color = Color(0.1, 0.1, 0.4, 1)
@export var cycle_duration: float = 24.0 # Seconds for a full day/night cycle

var time_passed: float = 0.0

func _process(delta: float) -> void:
	# Cycle continuously regardless of game state
	# if GameManager.current_state != GameManager.GameState.PLAYING:
	# 	return
		
	time_passed += delta
	var t = (cos(time_passed / cycle_duration * TAU) + 1.0) / 2.0 # Oscillate between 0 and 1
	
	color = night_color.lerp(day_color, t)
