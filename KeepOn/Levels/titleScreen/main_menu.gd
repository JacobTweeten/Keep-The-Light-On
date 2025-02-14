extends Node2D




func _on_button_pressed() -> void:
	print("button Pressed")
	SceneTransition.change_scene("res://Levels/level_0_and_1.tscn")
	Global.score = 0
