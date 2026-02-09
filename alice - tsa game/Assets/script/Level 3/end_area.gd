extends Node2D

@export var enable_time: float = 20.0
@export var speed: float = 100.0 # moves left

var area: Area2D
var timer: Timer
var active: bool = false


func _ready():
	area = $Sprite2D/Area2D
	timer = $Timer

	# Disable collision detection initially
	area.monitoring = false
	

	# Start the timer
	timer.wait_time = enable_time
	timer.one_shot = true
	timer.start()

	# Connect signals
	timer.timeout.connect(_on_timer_timeout)
	area.body_entered.connect(_on_area_2d_area_entered)
	
func _process(delta):
	if active:
		position.x -= speed * delta

func _on_area_2d_area_entered(area: Area2D)-> void:
	if area.is_in_group("player"):
		get_tree().change_scene_to_file("res://Scenes/end_loading.tscn")

func _on_timer_timeout()-> void:
	area.monitoring = true
	active = true  # stop obstacles from spawning
	print("Ending Hole is now active! Obstacle spawning should stop now.")
	
