extends Node

var respawn_position: Vector2
var has_checkpoint := false
var last_scene: String
var cutscene_trigger_used := false
var player_scale: Vector2 = Vector2.ONE
var player_gravity_scale: float = 1.0

func set_checkpoint(pos: Vector2):
	respawn_position = pos
	has_checkpoint = true

func get_respawn_position() -> Vector2:
	return respawn_position
	
