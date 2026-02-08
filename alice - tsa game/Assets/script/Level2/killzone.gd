extends Area2D

@onready var deathSound = $AudioStreamPlayer

var checkpoint_manager
var player

func _on_body_entered(body):
	deathSound.play()
	if body.is_in_group("player"):
		body.die()
		return
