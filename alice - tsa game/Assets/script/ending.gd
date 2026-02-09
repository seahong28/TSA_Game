extends Node2D

@export var level_music: AudioStream

var resource = load("res://Assets/Dialogues/ending.dialogue")
@onready var anim: AnimationPlayer = $Sprite2D/AnimationPlayer
func _ready() -> void:
	BackgroundMusic.play_music(level_music)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _on_dialogue_ended(_resource: DialogueResource) -> void:
	await get_tree().create_timer(1).timeout
	anim.play("rabbit")
	await get_tree().create_timer(5).timeout
	get_tree().quit()
	


func _on_timer_timeout() -> void:
	DialogueManager.show_dialogue_balloon(resource , "start")
		
