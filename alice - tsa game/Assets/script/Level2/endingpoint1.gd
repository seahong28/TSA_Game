extends Area2D


func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player") and not CheckpointManager.cutscene_trigger_used:
		CheckpointManager.cutscene_trigger_used = true
		CheckpointManager.set_checkpoint(global_position)
		print("Checkpoint set at:", global_position)
		CheckpointManager.last_scene = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file("res://Scenes/Cut Scenes/crying.tscn")
