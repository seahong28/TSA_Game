extends Node2D

@onready var player := $AudioStreamPlayer
var current_sfx: AudioStream = null

func play_music(sfx: AudioStream):
	if current_sfx == sfx:
		return  
	current_sfx = sfx
	player.stream = sfx
	player.play()
