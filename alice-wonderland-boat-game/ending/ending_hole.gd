extends Node2D

# Time in seconds before the hole becomes active
@export var enable_time: float = 30.0
@export var speed: float = 100.0

var delta: float
# References to child nodes
var area: Area2D
var timer: Timer

var active: bool = false

func _ready():
	# Get the Area2D and Timer nodes
	area = $Sprite2D/Area2D
	timer = $Timer


	# Configure the timer
	timer.wait_time = enable_time
	timer.one_shot = true
	timer.start()

	# Connect timer timeout signal
	timer.timeout.connect(_on_timeout)

	# Connect the Area2D signal for detecting player collision
	area.body_entered.connect(_on_area_2d_area_entered)



func _on_timeout() -> void:
	print("Ending Hole is now active!")
	active = true  # stop obstacles from spawning

func _process(delta):
	if active:
		position.x -= speed * delta 


func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("player"):   # replace "Player" with your actual player node name
		print("Player touched the Ending Hole. Game Over!")
		get_tree().quit()  # stops the game
		# Optional: you can show a game over screen instead
