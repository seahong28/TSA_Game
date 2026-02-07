extends PathFollow2D

@export var speed := 0.05
var move:= false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move:
		progress_ratio += speed * delta
	
			

	# update child position manuall 
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("entered")
		move =  true
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("left")
		move =  false
		progress_ratio = 0.0
