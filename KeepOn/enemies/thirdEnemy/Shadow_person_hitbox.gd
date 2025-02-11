extends Node2D
var bughealth = 2
var player: Player = null  # Store the player reference
var boomerang: Boomerang = null
const OIL_SCENE = preload("res://Collectables/oil_can.tscn")
@export var scoreIncrease: int = 50

func _process(delta: float) -> void:
	if player:
		player.health -= 10 * delta  # Damage over time
		player.health = min(player.health, 100)
		player.get_node("light").fuel = player.health
		print("hurtin player")
	if boomerang:
		queue_free()
		print("booma")
		
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body  # Start damaging the player
		
func _on_hitbox_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null



		
		


#Kill the bug if it runs out of health
func _on_hitbox_area_entered(area: Area2D) -> void:
	print("Bug detected collision with:", area.name)

	if area.is_in_group("boomarang"): 
		print("Boomerang hit the bug!")
		bughealth -= 1  # Reduce Bug health

		if bughealth <= 0:
			print("Bug destroyed!")
			spawn_oil(global_position)
			Global.score += scoreIncrease
			queue_free()  # Destroy the bug
			get_parent().queue_free()
			
			

			
			
# Function to spawn the oil at the given position
func spawn_oil(position: Vector2) -> void:
	# Instantiate the oil scene
	var oil_instance = OIL_SCENE.instantiate()
	
	# Set the position of the oil to the bug's position
	oil_instance.global_position = position
	
	# Add the oil to the parent (or another appropriate node in the scene)
	get_parent().get_parent().add_child(oil_instance)
