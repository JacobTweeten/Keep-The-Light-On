extends Node2D


func _ready() -> void:
	%GameOver.hide()
	
func _on_player_health_depleted():
	%GameOver.show()

	
	

func _on_game_over_button_pressed() -> void:
	print("Button Clicked!")
	%GameOverButton.disabled = false
	get_tree().paused = false
	%GameOverButton.disabled = false
	SceneTransition.change_scene("res://Levels/titleScreen/main_menu.tscn")
