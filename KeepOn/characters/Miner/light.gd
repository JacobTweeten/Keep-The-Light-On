extends Area2D

var max_fuel = 100.0
#fuel consumed per second
var fuel_consumption_rate = 5.0

var fuel = 1
var initial_scale: Vector2

func _ready():
	initial_scale = self.scale
	
	# If the player has the lantern, set fuel to max
	if Global.has_lantern:
		fuel = 100
		%light.visible = true
	else:
		%light.visible = false
	
func _process(delta):
	if Global.has_lantern:
		%light.visible = true
		if fuel > 0:
			fuel -= fuel_consumption_rate * delta
		#add else statement that kills player when the lantern is out of fuel
		var scale_factor = fuel / max_fuel
		 # Apply the new scale to the lantern.
		self.scale = initial_scale * scale_factor
	
	
		
