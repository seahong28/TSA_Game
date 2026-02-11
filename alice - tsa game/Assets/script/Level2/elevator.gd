extends PathFollow2D

@export var speed := 0.05
@export var stop_y := -935.0   

var move := false

func _process(delta):
	if move:
		progress_ratio += speed * delta
		
		# stop when we reach the target height
		if global_position.y <= stop_y:
			move = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("entered")
		move = true
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("left")
		move =  false
		progress_ratio = 0.0
