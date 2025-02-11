extends Control

@onready var score_label: Label = $ScoreLabel

func _process(delta):
	score_label.text = "Score: " + str(Global.score)
