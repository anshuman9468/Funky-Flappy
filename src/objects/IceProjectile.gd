extends Area2D

class_name IceProjectile

const SPEED = 600.0

func _physics_process(delta: float) -> void:
	position.x += SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(_body: Node2D) -> void:
	# Will implement interaction with FirePipe here
	pass

func _on_area_entered(area: Area2D) -> void:
	# Check if the area itself or its parent can be extinguished
	if area.has_method("extinguish"):
		area.extinguish()
		queue_free()
	elif area.get_parent().has_method("extinguish"):
		area.get_parent().extinguish()
		queue_free()
