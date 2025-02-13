extends Area2D

var max_fuel = 100.0
#fuel consumed per second
var fuel_consumption_rate = 5.0

var fuel = 100.0
var initial_scale: Vector2

func _ready():
	initial_scale = self.scale
	
func _process(delta):
	if fuel > 0:
		fuel -= fuel_consumption_rate * delta
	#add else statement that kills player when the lantern is out of fuel
	var scale_factor = fuel / max_fuel
	 # Apply the new scale to the lantern.
	self.scale = initial_scale * scale_factor
	
	#Add fuel when players hurt box collides with OIL
	#var overlapping_oil = %HurtBox.get_overlapping_bodies()
		
