extends CharacterBody2D

var player = null
var motion = Vector2.ZERO




func _physics_process(delta):
	
	if player:  # ✅ Prevents null access
		var direction = position.direction_to(player.position)
		velocity = direction * 200  # Example speed
		direction = move_and_slide()
		
		
		
	
	
		


	


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("gone")
	player = null
