extends Node2D

@export var speed := 140.0

func _process(delta):
	position.y += speed * delta
