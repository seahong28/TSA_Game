extends Area2D
@onready var timer = $Timer
@onready var deathSound = $AudioStreamPlayer2D

func _on_die_entered(body):
	if body.is_in_group("player"):
		deathSound.play()
		timer.start()


func _die_timer_timeout():
	get_tree().reload_current_scene()


func _on_rabbit_3_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
