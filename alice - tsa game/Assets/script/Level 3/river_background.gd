extends ParallaxBackground

@onready var water_layer: ParallaxLayer = %WaterLayer
@onready var light_water_layer: ParallaxLayer = %LightWaterLayer
@onready var dark_water_layer: ParallaxLayer = %DarkWaterLayer
@onready var dark_water_layer2: ParallaxLayer = %DarkWaterLayer2


func _process(delta: float) -> void:
	water_layer.motion_offset.x += -80 * delta
	light_water_layer.motion_offset.x += -100 * delta
	dark_water_layer.motion_offset.x += -130 * delta
	dark_water_layer2.motion_offset.x += -160 * delta
	pass
	
	
