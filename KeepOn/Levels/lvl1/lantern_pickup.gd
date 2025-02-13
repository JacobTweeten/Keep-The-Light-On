extends Area2D



@export var oilAmount: float = 10  # The amount of health to restore

func _on_body_entered(body):
	if body is Player:  # Check if it's the player
		if body.health < 100:
			body.health = min(body.health + oilAmount, 100)
		Global.has_lantern = true  # Set global variable
		print("lantern picked up")
		print("Lantern picked up, health now:", body.health)
		get_parent().queue_free()  # Remove the lantern from the scene
