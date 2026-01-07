extends Area2D
@onready var rabbit = $"../../rabbit3"
@onready var alice = $"../../Player"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		print("alice arrived")
		alice.visible = false
		alice.can_move = false


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("rabbit"):
		print("rabbit arrived")
		rabbit.visible = false
