extends Node2D

@onready var boat: Node2D = $Boat
@onready var obstacle: Node2D = $EndObstacle

func _ready() -> void:
	# Trigger Game Over when the boat leaves the scene tree (dies)
	boat.tree_exiting.connect(func():
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Level 3/world.tscn")
	)


	# Trigger End"res://Level 3/world.tscn" Scene when the boat collides with the specific obstacle
	if boat.has_signal("body_entered"):
		boat.body_entered.connect(_on_boat_body_entered)

func _on_boat_body_entered(body: Node) -> void:
	if body == obstacle:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/end.tscn")
