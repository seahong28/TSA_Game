extends Area2D
@onready var anim: AnimationPlayer = $AnimationPlayer
@export var growth_factor := 1.5
func _on_body_entered(body):
	if not body.is_in_group("player"):
		return
	body.grow(growth_factor)
	queue_free()
