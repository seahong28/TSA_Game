extends Node2D
@export var cup_scene: PackedScene
@export var candle_scene: PackedScene
@export var clock_scene: PackedScene

var cup
var candle
var clock

func _ready():
	cup = cup_scene.instantiate()
	candle = candle_scene.instantiate()
	clock = clock_scene.instantiate()
	
	add_child(cup)
	add_child(candle)
	add_child(clock)
	
func _on_timer_timeout() -> void:
	if not is_instance_valid(cup):
		cup = cup_scene.instantiate()
		add_child(cup)
	cup.play_anim("glitch")
	cup.switch()
func _on_timer_2_timeout() -> void:
	if not is_instance_valid(candle):
		candle = candle_scene.instantiate()
		add_child(candle)
	candle.play_anim("glitch")
	candle.switch()
func _on_timer_3_timeout() -> void:
	if not is_instance_valid(clock):
		clock = clock_scene.instantiate()
		add_child(clock)
	clock.play_anim("glitch")
	clock.switch()
