extends Node2D

@export var oilAmount: float = 100
@export var scoreIncrease: int = 10




func _on_lantern_pickup_body_entered(body: Node2D) -> void:
	if body is Player:
		body.health += oilAmount
		body.health = min(body.health, 100)
		body.get_node("light").fuel = body.health
		
		Global.score += scoreIncrease
		print("Score:", Global.score)
		
		queue_free()
		
