extends CharacterBody2D
@onready var alice = $AnimatedSprite2D
@onready var jump_sound = $AudioStreamPlayer


const SPEED = 120.0
const JUMP_VELOCITY = -200.0

var can_move := true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jump_sound.play()
			velocity.y = JUMP_VELOCITY
	
	if not can_move:
		velocity = Vector2.ZERO
		return


	var direction := Input.get_axis("left", "right")
	
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
