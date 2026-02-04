extends Node2D

@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
