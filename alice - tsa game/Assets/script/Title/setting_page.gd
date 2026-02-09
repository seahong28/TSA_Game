extends Node2D
@onready var button_sound := AudioStreamPlayer.new()

func _ready() -> void:
	add_child(button_sound)
	button_sound.stream = preload("res://Sound/selectButton.wav")
	button_sound.volume_db = -6

func _on_texture_button_pressed() -> void:
	button_sound.play()
	get_tree().change_scene_to_file("res://Scenes/Menu/title_page.tscn")


func _on_sound_toggled(toggled_on: bool) -> void:
	var bus_index = AudioServer.get_bus_index("Sounds")
	AudioServer.set_bus_mute(bus_index, toggled_on)

func _on_music_toggled(toggled_on: bool) -> void:
	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_mute(bus_index, toggled_on)
