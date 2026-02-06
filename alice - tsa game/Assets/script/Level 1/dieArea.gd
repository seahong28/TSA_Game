extends Area2D
@onready var timer = $Timer

func _on_die_entered(body):
	if body.is_in_group("player"):
		timer.start()


func _die_timer_timeout():
	get_tree().reload_current_scene()


func _on_rabbit_3_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
