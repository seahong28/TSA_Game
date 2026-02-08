extends Node2D

@onready var cursor = $Cursor
const NORMAL_COLOR = Color(1, 1, 1) 
const HIGHLIGHT_COLOR = Color(0.069, 0.618, 1.0, 1.0) 
@onready var options: Array[Label] = [$Start, $Setting, $Quit]

var previous_index: int = -1
func _ready() -> void:
	cursor.accept_pressed.connect(_on_option_selected)
	cursor.escape_pressed.connect(_on_escape)
	_update_option_colors(cursor.current_index)

func _process(delta: float) -> void:
	if cursor.current_index != previous_index:
		_update_option_colors(cursor.current_index)
		previous_index = cursor.current_index


func _on_option_selected(index: int) -> void:
	match index:
		0:
			get_tree().change_scene_to_file("res://Scenes/Cut Scenes/opening.tscn")
		1:
			get_tree().change_scene_to_file("res://Scenes/Menu/setting_page.tscn")
		2:
			get_tree().quit()

func _on_escape() -> void:
	get_tree().quit()
	
func _update_option_colors(selected_index: int) -> void:
	for i in range(options.size()):
		if i == selected_index:
			options[i].add_theme_color_override("font_color", HIGHLIGHT_COLOR)
		else:
			options[i].add_theme_color_override("font_color", NORMAL_COLOR)
