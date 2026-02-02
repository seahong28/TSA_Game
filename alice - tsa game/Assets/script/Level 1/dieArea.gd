extends Area2D

var checkpoint_manager
var player

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.die()
		return


func _on_rabbit_3_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
