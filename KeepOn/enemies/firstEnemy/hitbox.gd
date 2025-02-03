class_name Bug
extends Node2D
var bughealth = 1
var player: Player = null  # Store the player reference
var boomerang: Boomerang = null


func _process(delta: float) -> void:
	if player:
		player.health -= 10 * delta  # Damage over time
		player.health = min(player.health, 100)
		player.get_node("light").fuel = player.health
	if boomerang:
		queue_free()
		print("booma")
		
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body  # Start damaging the player
		
func _on_hitbox_body_exited(body: Node2D) -> void:
	if body is Player:
		player = body



		
		


#Kill the bug if it runs out of health
func _on_hitbox_area_entered(area: Area2D) -> void:
	print("Bug detected collision with:", area.name)

	if area.is_in_group("boomarang"): 
		print("Boomerang hit the bug!")
		bughealth -= 1  # Reduce Bug health

		if bughealth <= 0:
			print("Bug destroyed!")
			queue_free()  # Destroy the bug
			get_parent().queue_free()
			#TODO have the bug drop something, maybe oil and points
