class_name SuperOil
extends Node2D

@export var scoreIncrease: int = 100
@export var oilAmount: float = 100
func _on_oil_pick_up_body_entered(body: Node2D) -> void:
	if body is Player:
		body.health += oilAmount
		body.health = min(body.health, 100)
		body.get_node("light").fuel = body.health
		
		Global.score += scoreIncrease
		queue_free()
		
		
		
