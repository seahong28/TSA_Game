extends Area2D

@export var shrink_factor := 0.1

func _on_body_entered(body):
	if not body.is_in_group("player"):
		return
	body.shrink(shrink_factor)
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Scenes/Cut Scenes/small.tscn")
	
	queue_free()
	
