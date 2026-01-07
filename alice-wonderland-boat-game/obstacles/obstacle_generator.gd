extends Node2D

@export var RockScene: PackedScene
@export var WoodScene: PackedScene
@export var RandomScene: PackedScene


var margin = 8
var screen_height = ProjectSettings.get_setting("display/window/size/viewport_height")

@onready var spawner_component: = $SpawnerComponent as SpawnerComponent
@onready var rock_spawn_timer: Timer = $RockSpawnTimer
@onready var wood_spawn_timer: Timer = $WoodSpawnTimer
@onready var random_spawn_timer: Timer = $RandomSpawnTimer
@onready var ending_hole: Node = $"../ending hole"



func _ready() -> void:
	rock_spawn_timer.timeout.connect(handle_spawn.bind(RockScene, rock_spawn_timer))
	wood_spawn_timer.timeout.connect(handle_spawn.bind(WoodScene, wood_spawn_timer))
	random_spawn_timer.timeout.connect(handle_spawn.bind(RandomScene, random_spawn_timer))
	
func handle_spawn(obstacle_scene: PackedScene, timer: Timer) -> void:
	if ending_hole.active:
		return  # Stop spawning obstacles once the Ending Hole is active
	spawner_component.scene = obstacle_scene
	spawner_component.spawn(Vector2(240, randf_range(margin, screen_height - margin)))
	timer.start()
	
	
