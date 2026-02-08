extends Node

@onready var player := $AudioStreamPlayer
var current_track: AudioStream = null

func play_music(track: AudioStream):
	if current_track == track:
		return  
	current_track = track
	player.stream = track
	player.play()
