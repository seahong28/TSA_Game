extends CharacterBody2D
@onready var alice = $AnimatedSprite2D

<<<<<<< HEAD
const SPEED = 120.0
const JUMP_VELOCITY = -300.0
=======
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const AIR_CONTROL := 0.15
>>>>>>> main

@onready var animated_sprite: AnimatedSprite2D = $Sprite

@export var grow_speed := 0.25
@export var shrink_speed := 0.6  
@export var base_gravity := 1200.0
@export var gravity_scale := 1.0
@export var current_gravity := 1200.0

func _ready():
	update_gravity()

var can_move := true

func _physics_process(delta: float) -> void:
<<<<<<< HEAD
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
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
=======
	var direction := Input.get_axis("left", "right")

	# --- Gravity ---
	if not is_on_floor():
		velocity.y += current_gravity * delta

	# --- Horizontal movement (ground + air) ---
	if is_on_floor():
		velocity.x = direction * SPEED
	else:
		velocity.x = lerp(velocity.x, direction * SPEED, AIR_CONTROL)

	# --- Jump ---
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# --- Sprite flipping (ground + air) ---
	if direction != 0:
		animated_sprite.flip_h = direction < 0

	# --- Animations ---
	if not is_on_floor():
		animated_sprite.play("jump")
	elif direction != 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")

	move_and_slide()

# -------------------------
# Size / gravity mechanics
# -------------------------
>>>>>>> main
func grow(factor: float):
	scale *= factor
	var tween = create_tween()
	tween.tween_property(self, "scale", scale, 1.0)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_OUT)

	scale = Vector2.ONE * 1.6
	gravity_scale = 1.4
	update_gravity()

func shrink(factor: float):
	scale *= factor
	var tween = create_tween()
	tween.tween_property(self, "scale", scale, 1.0)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_OUT)

	scale = Vector2.ONE * 0.6
	gravity_scale = 0.6
	update_gravity()

func update_gravity():
	current_gravity = base_gravity * gravity_scale

# -------------------------
# Respawn / death
# -------------------------
func respawn():
	if CheckpointManager.has_checkpoint:
		global_position = CheckpointManager.get_respawn_position()
	else:
		global_position = Vector2(100, 100)

func die():
	if is_in_group("player"):
		velocity = Vector2.ZERO
		respawn()
		reset_state()

func reset_state():
	animated_sprite.play("idle")
