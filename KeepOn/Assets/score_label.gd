extends Label

@export var prefix_text: String = "Final Score: "

func _process(delta):
	text = prefix_text + str(Global.score)
