extends SceneTree

func _init():
	print("Attempting to load FirePipe.tscn...")
	var scene = load("res://src/objects/FirePipe.tscn")
	if scene:
		print("Load successful")
		var instance = scene.instantiate()
		if instance:
			print("Instantiate successful")
			instance.free()
		else:
			print("Instantiate failed")
	else:
		print("Load failed")
	quit()
