extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
		emit_signal("move_up")
	elif event.is_action_pressed("ui_down"):
		emit_signal("move_down")
	elif event.is_action_pressed("ui_left"):
		emit_signal("move_up")
	elif event.is_action_pressed("ui_right"):
		emit_signal("move_down")
	elif event.is_action_pressed("ui_accept"):
		emit_signal("accept")
	elif event.is_action_pressed("ui_cancel"):
		emit_signal("escape")
