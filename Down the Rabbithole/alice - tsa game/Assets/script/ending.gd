extends Node2D

var resource = load("res://Assets/Dialogues/ending.dialogue")

func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _on_dialogue_ended(_resource: DialogueResource) -> void:

	get_tree().quit()


func _on_timer_timeout() -> void:
	DialogueManager.show_dialogue_balloon(resource , "start")
		
