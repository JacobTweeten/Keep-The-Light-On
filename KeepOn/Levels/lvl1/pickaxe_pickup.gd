extends Area2D




func _on_body_entered(body):
	if body is Player:  # Check if it's the player
		print("pickaxePickedUp!")
		Global.has_pickaxe = true
		get_parent().queue_free()  # Remove the lantern from the scene
