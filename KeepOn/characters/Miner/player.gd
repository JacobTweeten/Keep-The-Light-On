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
	if health > 30.0:
		%Death1.hide()
		%Death2.hide()
		%Death3.hide()
	if health <= 30.0:
		%Death1.show()
	if health <= 20.0:
		%Death1.hide()
		%Death2.show()
	if health <= 10.0:
		%Death2.hide()
		%Death3.show()
	if health <= 0.0:
		%Death1.hide()
		%Death2.hide()
		%Death3.hide()
		health_depleted.emit()
			
			
