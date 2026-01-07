extends Area2D

@onready var rabbit = $"../../rabbit2/AnimatedSprite2D"
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rabbit.play("run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_rabbit_entered(body):
	if body.is_in_group("player"):
		rabbit.play("run")
		rabbit_move_out()
		$CollisionShape2D.disabled = true
		
	
func rabbit_move_out():
		var tween = create_tween()
		tween.tween_property(rabbit, "global_position", rabbit.global_position + Vector2(800, 0), 3)
