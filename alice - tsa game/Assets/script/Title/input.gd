extends Node

@onready var button_sound := AudioStreamPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(button_sound)
	button_sound.bus = "Sounds"
	button_sound.stream = preload("res://Sound/selectButton.wav")
	button_sound.volume_db = -6


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal move_up
signal move_down
signal move_left
signal move_right
signal accept
signal escape

@export var active: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if not active:
		return

	if event.is_action_pressed("ui_up"):
		button_sound.play()
		emit_signal("move_up")
	elif event.is_action_pressed("ui_down"):
		button_sound.play()
		emit_signal("move_down")
	elif event.is_action_pressed("ui_left"):
		button_sound.play()
		emit_signal("move_up")
	elif event.is_action_pressed("ui_right"):
		button_sound.play()
		emit_signal("move_down")
	elif event.is_action_pressed("ui_accept"):
		button_sound.play()
		emit_signal("accept")
	elif event.is_action_pressed("ui_cancel"):
		button_sound.play()
		emit_signal("escape")
