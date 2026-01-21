extends Node2D

var resource = load("res://Assets/Dialogues/falling.dialogue")

func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _on_dialogue_ended(_resource: DialogueResource) -> void:
	get_tree().change_scene_to_file("res://Scenes/Level2/Game.tscn")


func _on_timer_timeout() -> void:
	DialogueManager.show_dialogue_balloon(resource , "start")
		
