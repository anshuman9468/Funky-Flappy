extends Node

func _ready():
	print("--- Input Verification Scene ---")
	print("Press SPACE, LEFT CLICK, or TAP to test FLAP")
	print("Press ESCAPE to test PAUSE")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("flap"):
		print("ACTION DETECTED: flap")
		
	if event.is_action_pressed("pause"):
		print("ACTION DETECTED: pause")
