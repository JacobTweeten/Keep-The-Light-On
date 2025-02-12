extends Node2D



' func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf() * 10000
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
	


func _on_timer_timeout():
	spawn_mob()
'

func _ready() -> void:
	%GameOver.hide()
	
func _on_player_health_depleted():
	%GameOver.show()

	
	


func _on_button_pressed() -> void:
	print("Button Clicked!")
	%GameOverButton.disabled = false
	get_tree().paused = false
	%GameOverButton.disabled = false
	SceneTransition.change_scene("res://Levels/titleScreen/main_menu.tscn")
