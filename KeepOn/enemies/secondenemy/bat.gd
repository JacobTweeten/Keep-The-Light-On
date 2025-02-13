extends CharacterBody2D

var player: Node2D = null           # Reference to the player
var target_direction: Vector2 = Vector2.ZERO  # Direction toward the player when detected
var chasing: bool = false            # Whether the bat is currently chasing the player
var chase_timer: float = 0.0         # Timer to track how long it has been chasing
var chase_interval: float = 1      # Time interval to chase the player
var speed: float = 1000              # Movement speed during the chase
@export var scoreIncrease: int = 5

@onready var batfly: AudioStreamPlayer2D = $batfly


func _physics_process(delta: float) -> void:
	if chasing:
		# Move the bat in the pre-determined target direction
		velocity = target_direction * speed
		move_and_slide()
		if velocity.length() > 0:
			if not batfly.playing:
				batfly.play()
		# Update the timer
		chase_timer += delta
		if chase_timer >= chase_interval:
			chase_timer = 0.0
			target_direction = position.direction_to(player.position) # Recalculate the direction to the player every interval
	else:
		# When not chasing, the bat does nothing
		velocity = Vector2.ZERO
		move_and_slide()
		
	
		


	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		target_direction = position.direction_to(player.position)
		chasing = true
		chase_timer = 0.0


		
		
