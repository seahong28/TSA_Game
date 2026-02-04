extends Node2D

signal accept_pressed(index: int)
signal escape_pressed

@export var cursor_stops: Array[Vector2] = []
@export var start_index: int = 0

var current_index: int = 0

@onready var input: Node = $Input

func _ready() -> void:
	current_index = start_index
	_update_position()

	input.move_up.connect(_on_up)
	input.move_down.connect(_on_down)
	input.accept.connect(_on_accept)
	input.escape.connect(_on_escape)

	input.active = true

func _on_up() -> void:
	if cursor_stops.is_empty():
		return
	current_index = wrapi(current_index - 1, 0, cursor_stops.size())
	_update_position()

func _on_down() -> void:
	if cursor_stops.is_empty():
		return
	current_index = wrapi(current_index + 1, 0, cursor_stops.size())
	_update_position()

func _on_accept() -> void:
	emit_signal("accept_pressed", current_index)

func _on_escape() -> void:
	emit_signal("escape_pressed")

func _update_position() -> void:
	position = cursor_stops[current_index]
