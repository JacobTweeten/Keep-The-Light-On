extends CharacterBody2D

var player = null
var motion = Vector2.ZERO



@onready var ratwalk: AudioStreamPlayer2D = $ratwalk

@onready var Ratmoving: AnimationPlayer = $Ratmoving

func _physics_process(delta):
	
	if player:
		var direction = position.direction_to(player.position)
		velocity = direction * 200 
		direction = move_and_slide()
		if velocity.length() > 0:
			if not ratwalk.playing:
				ratwalk.play()
		




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("gone")
	player = null
