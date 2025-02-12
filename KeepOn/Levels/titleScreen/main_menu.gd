extends Node2D




func _on_button_pressed() -> void:
	print("button Pressed")
	SceneTransition.change_scene("res://Levels/level1.tscn")
