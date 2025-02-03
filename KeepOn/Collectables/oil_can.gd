class_name Oil
extends Node2D

@export var oilAmount: float = 50
func _on_oil_pick_up_body_entered(body: Node2D) -> void:
	if body is Player:
		body.health += oilAmount
		# Clamp the player's health to a maximum of 100.
		body.health = min(body.health, 100)
		# Also update the light fuel if that’s your source of truth
		body.get_node("light").fuel = body.health
		queue_free()
		
		
		
