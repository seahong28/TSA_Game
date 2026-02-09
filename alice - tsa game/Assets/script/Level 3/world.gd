extends Node2D

@onready var boat: Node2D = $Boat
@onready var obstacle: Node2D = $EndObstacle
@export var level_music: AudioStream
@onready var level_music2: AudioStreamPlayer
@onready var deathSound = $AudioStreamPlayer2D

@export var cup_scene: PackedScene
@export var candle_scene: PackedScene
@export var clock_scene: PackedScene

var cup
var candle
var clock



func _ready() -> void:

	boat.tree_exiting.connect(func():
		deathSound.play()
	

	
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://Scenes/Level 3/world.tscn")
	)
	BackgroundMusic.play_music(level_music)

	if boat.has_signal("body_entered"):
		boat.body_entered.connect(_on_boat_body_entered)
		


func _on_boat_body_entered(body: Node) -> void:
	if body == obstacle:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/end.tscn")
		
