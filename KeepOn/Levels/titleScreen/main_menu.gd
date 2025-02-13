extends Node2D




func _on_button_pressed() -> void:
	print("button Pressed")
	SceneTransition.change_scene("res://Levels/testLevel.tscn")
	Global.score = 0
