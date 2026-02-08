extends CharacterBody2D
@onready var alice = $AnimatedSprite2D
@onready var jumpSound = $AudioStreamPlayer2D
@onready var runSound = $AudioStreamPlayer2D2
@onready var landSound = $AudioStreamPlayer2D3


const SPEED = 120.0
const JUMP_VELOCITY = -200.0

var was_in_air := false
var can_move := true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jumpSound.play();
	
	if not can_move:
		velocity = Vector2.ZERO
		return
		
	if is_on_floor() and was_in_air:
		landSound.play()

	was_in_air = not is_on_floor()


	var direction := Input.get_axis("left", "right")
	
	if is_on_floor() and direction != 0:
		if not runSound.playing:
			runSound.play()
	else:
		if runSound.playing:
			runSound.stop()

	
	if direction > 0:
		alice.flip_h = false
	elif direction < 0:
		alice.flip_h = true
		
		
	if is_on_floor():	
		if direction == 0:
			alice.play("idle")
		else:
			alice.play("run")
	else:
		alice.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
