class_name Player
extends CharacterBody2D
@onready var sfx_footstep: AudioStreamPlayer2D = $sfx_footstep
@onready var player_walk: AnimationPlayer = $PlayerWalk


signal health_depleted

var health = 1.0
var direction: Vector2 = Vector2.ZERO
var cardinal_direction: Vector2 = Vector2.DOWN
var game_over = false

func _ready():
	if Global.has_lantern:
		health = 100
		print("Player health:", health)

func _physics_process(delta):
	if game_over:
		return
		
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		cardinal_direction = direction.normalized()
	velocity = direction * 600
	if velocity.length() > 0:
		if not sfx_footstep.playing:
			sfx_footstep.play()
			
	move_and_slide()
	if velocity.length() > 0:
		if player_walk.has_animation("WALK"):  # Check if the animation exists
			player_walk.play("WALK") 
	'if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()'
		
		
	var light_node = $light
	health = light_node.fuel
	%ProgressBar.value = health
	if health <= 0.0:
		health_depleted.emit()
		game_over = true
		%GameOver.show()
			
			
