class_name Player
extends CharacterBody2D

signal health_depleted

var health = 100.0
var direction: Vector2 = Vector2.ZERO
var cardinal_direction: Vector2 = Vector2.DOWN

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		cardinal_direction = direction.normalized()
	velocity = direction * 600
	move_and_slide()
	'if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()'
		
		
	var light_node = $light
	health = light_node.fuel
	%ProgressBar.value = health
	if health <= 0.0:
		health_depleted.emit()
			
			
