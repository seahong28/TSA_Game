extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		get_tree().change_scene_to_file("res://Scenes/Level 3/world.tscn")
