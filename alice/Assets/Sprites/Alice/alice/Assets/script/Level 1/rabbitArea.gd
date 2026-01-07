extends Area2D

@onready var rabbit = $"../../rabbit/AnimatedSprite2D"
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_rabbit_entered(body):
	if body.is_in_group("player"):
		rabbit.play("clock")
		$CollisionShape2D.disabled = true
		timer.start()
		

		
		
		
	


func _on_timer_timeout() -> void:
	rabbit.play("run")
	rabbit_move_out()
	
func rabbit_move_out():
		var tween = create_tween()
		tween.tween_property(rabbit, "global_position", rabbit.global_position + Vector2(800, 0), 2)
