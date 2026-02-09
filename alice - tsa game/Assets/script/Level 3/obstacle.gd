extends Node2D

@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent
@onready var anim: AnimationPlayer = $AnimationPlayer

@onready var pixel: AnimatedSprite2D = $AnimatedSprite2D
@onready var real:Sprite2D = $Sprite2D


func _ready() -> void:
	anim.play("glitch")
	switch()
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	
func switch():
	pixel.visible = false
	real.visible = true
	
	
