extends Area2D
@onready var anim: AnimationPlayer = $AnimationPlayer
@export var growth_factor := 1.5
@onready var pixel:Sprite2D = $Cake
@onready var real: Sprite2D = $Sprite2D
func _on_ready():
	pixel.visible = true
	real.visible = false
	
	
func _on_body_entered(body):
	if not body.is_in_group("player"):
		return

	body.grow(growth_factor)
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		anim.play("glitch(l2)")
