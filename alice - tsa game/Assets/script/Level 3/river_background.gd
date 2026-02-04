extends ParallaxBackground

@onready var water_layer: ParallaxLayer = %WaterLayer
@onready var light_water_layer: ParallaxLayer = %LightWaterLayer
@onready var dark_water_layer: ParallaxLayer = %DarkWaterLayer


func _process(delta: float) -> void:
	water_layer.motion_offset.x += -80 * delta
	light_water_layer.motion_offset.x += -100 * delta
	dark_water_layer.motion_offset.x += -140 * delta
	pass
	
	
