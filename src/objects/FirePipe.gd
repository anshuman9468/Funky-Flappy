extends "res://src/objects/PipePair.gd"

class_name FirePipe

@onready var fire_hazard = $FireHazard
@onready var fire_sprite = $FireHazard/Sprite2D
@onready var fire_collision = $FireHazard/CollisionShape2D
@onready var fire_light = $FireHazard/PointLight2D
@onready var fire_particles = $FireHazard/CPUParticles2D

var is_extinguished: bool = false

func extinguish() -> void:
	if is_extinguished:
		return
		
	is_extinguished = true
	fire_sprite.visible = false
	fire_particles.emitting = false
	fire_light.enabled = false
	fire_collision.set_deferred("disabled", true)
	
	if GameManager.audio_manager:
		GameManager.audio_manager.play_sfx("extinguish")

func _on_fire_hazard_body_entered(body: Node2D) -> void:
	if is_extinguished:
		return
		
	if body is Bird:
		GameManager.end_game()
