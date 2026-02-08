extends Node2D

@export var level_music: AudioStream


var resource = load("res://Assets/Dialogues/opening.dialogue")

func _ready() -> void:
	BackgroundMusic.play_music(level_music)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _on_dialogue_ended(_resource: DialogueResource) -> void:
	get_tree().change_scene_to_file("res://Scenes/Level 1/level_1.tscn")


func _on_timer_timeout() -> void:
	DialogueManager.show_dialogue_balloon(resource , "start")
		
