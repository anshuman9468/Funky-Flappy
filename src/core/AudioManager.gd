extends Node

class_name AudioManager

# Audio Stream Players
@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer

# Preload sounds (using placeholders if files don't exist)
# In a real scenario, these would be load("res://assets/audio/...")
var sounds: Dictionary = {}

func _ready() -> void:
	GameManager.audio_manager = self
	
	# Connect finished signal to loop music
	music_player.finished.connect(_on_music_finished)
	
	# Attempt to load sounds if they exist, otherwise just log
	_load_sound("bgm", "res://assets/audio/bgm.mp3")
	_load_sound("flap", "res://assets/audio/flap.mp3")
	_load_sound("score", "res://assets/audio/score.wav")
	_load_sound("crash", "res://assets/audio/crash.wav")
	_load_sound("shoot", "res://assets/audio/shoot.wav")
	_load_sound("extinguish", "res://assets/audio/extinguish.wav")
	
	# Start music immediately
	play_music()

func _load_sound(sound_name: String, path: String) -> void:
	if FileAccess.file_exists(path):
		sounds[sound_name] = load(path)
	else:
		print("Audio file missing: ", path)

func play_music() -> void:
	if sounds.has("bgm"):
		if not music_player.playing:
			music_player.stream = sounds["bgm"]
			music_player.play()
	else:
		print("Playing music: bgm (File missing)")

func stop_music() -> void:
	music_player.stop()

func _on_music_finished() -> void:
	# Loop music
	play_music()

func play_sfx(sound_name: String) -> void:
	if sounds.has(sound_name):
		# For SFX, we might want overlapping sounds. 
		# A single player cuts off the previous sound.
		# For now, simple implementation.
		sfx_player.stream = sounds[sound_name]
		sfx_player.play()
	else:
		print("Playing SFX: ", sound_name, " (File missing)")
