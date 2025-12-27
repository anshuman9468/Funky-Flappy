extends ParallaxBackground

@export var speed: float = 100.0
@export var day_color: Color = Color(1, 1, 1, 1)
@export var night_color: Color = Color(0, 0, 0, 1)
@export var cycle_duration: float = 24.0

@onready var sky_sprite = $SkyLayer/Sprite2D
@onready var ground_sprite = $GroundLayer/Sprite2D
@onready var cloud_layer = $CloudLayer
@onready var star_particles = $StarLayer/CPUParticles2D

var time_passed: float = 0.0

func _process(delta: float) -> void:
	# Scrolling
	if GameManager.current_state == GameManager.GameState.PLAYING:
		scroll_offset.x -= GameManager.game_speed * 0.5 * delta

	# Day/Night Cycle
	time_passed += delta
	var t = (cos(time_passed / cycle_duration * TAU) + 1.0) / 2.0 # 1.0 = Day, 0.0 = Night
	
	# Modulate background elements (Darken at night)
	var current_color = night_color.lerp(day_color, t)
	
	if sky_sprite:
		sky_sprite.modulate = current_color
	if ground_sprite:
		ground_sprite.modulate = current_color
	if cloud_layer:
		cloud_layer.modulate = current_color
		
	# Modulate Stars (Fade IN at night, OUT during day)
	# t=1 (Day) -> Alpha=0
	# t=0 (Night) -> Alpha=1
	if star_particles:
		star_particles.modulate.a = 1.0 - t
