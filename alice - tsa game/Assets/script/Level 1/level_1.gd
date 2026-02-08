extends Node2D

@export var level_music: AudioStream

func _ready():
	BackgroundMusic.play_music(level_music)
