extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent

func _process(delta: float) -> void:
	animate_the_ship()
	
func animate_the_ship() -> void:
	if move_component.velocity.y < 0:
		animated_sprite_2d.play("bank_left")    # ship moving up
	elif move_component.velocity.y > 0:
		animated_sprite_2d.play("bank_right")  # ship moving down
	else:
		animated_sprite_2d.play("center")     # ship is stationary vertically
