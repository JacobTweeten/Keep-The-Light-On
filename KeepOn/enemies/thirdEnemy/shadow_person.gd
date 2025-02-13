extends CharacterBody2D

var player: Node2D = null  # Reference to the player
var orbit_distance: float = 200  # Distance from the player
var orbit_speed: float = 2.0  # Speed of circling movement (radians per second)
var angle: float = 0.0  # Current angle in the orbit

var state: String = "orbit"  # Possible states: "orbit", "dash", "return"
var dash_speed: float = 1200  # Speed when dashing toward the player
var dash_duration: float = 0.3  # How long the dash lasts
var dash_timer: float = 0.0  # Timer for dash duration
var dash_cooldown: float = 3.0  # Time before the next dash
var time_since_last_dash: float = 0.0  # Timer to track when to dash again

var dash_direction: Vector2 = Vector2.ZERO  # Direction for the dash
@onready var shadow_walksound: AudioStreamPlayer2D = $shadowWalksound



func _physics_process(delta: float) -> void:
	if player == null:
		return

	match state:
		"orbit":
			# Update orbit angle
			angle += orbit_speed * delta

			# Calculate the orbit position
			var target_position = player.position + Vector2(orbit_distance, 0).rotated(angle)
			velocity = (target_position - position) * 5  # Smooth movement toward orbit position
			
			# Check if it's time to dash
			time_since_last_dash += delta
			if time_since_last_dash >= dash_cooldown:
				time_since_last_dash = 0.0
				dash_direction = position.direction_to(player.position)
				state = "dash"
			if velocity.length() > 0:
				if not shadow_walksound.playing:
					shadow_walksound.play()

		"dash":
			# Move quickly toward the player
			velocity = dash_direction * dash_speed
			dash_timer += delta
			if dash_timer >= dash_duration:
				dash_timer = 0.0
				state = "return"
			if velocity.length() > 0:
				if not shadow_walksound.playing:
					shadow_walksound.play()

		"return":
			# Return to orbit after dashing
			var target_position = player.position + Vector2(orbit_distance, 0).rotated(angle)
			velocity = (target_position - position) * 10  # Move back quickly to orbit position

			# If close to the orbit position, switch back to orbiting
			if position.distance_to(target_position) < 10:
				state = "orbit"

	move_and_slide()

func _on_sight_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
