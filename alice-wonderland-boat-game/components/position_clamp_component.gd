# Give the component a class name so it can be instanced as a custom node
class_name PositionClampComponent
extends Node2D

# Export the actor who's position will be clamped
@export var actor: Node2D

# Export a margin for top and bottom
@export var margin := 8

# Define the top and bottom borders to bounce on
var top_border = 0
# Use the display viewport height to get the bottom border of the screen
var bottom_border = ProjectSettings.get_setting("display/window/size/viewport_height")

func _process(delta: float) -> void:
	# Clamp the y position of the actor between the top border and the bottom border (accounting for the margin)
	actor.global_position.y = clamp(actor.global_position.y, top_border+margin, bottom_border-margin)
