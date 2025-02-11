class_name Oil
extends Node2D

@export var oilAmount: float = 25
@export var scoreIncrease: int = 10
func _on_oil_pick_up_body_entered(body: Node2D) -> void:
	if body is Player:
		body.health += oilAmount
		body.health = min(body.health, 100)
		body.get_node("light").fuel = body.health
		
		Global.score += scoreIncrease
		print("Score:", Global.score)
		
		queue_free()
		
		
		
