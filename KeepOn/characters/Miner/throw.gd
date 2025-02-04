class_name PlayerAbilities
extends Node2D

const BOOMERANG = preload("res://characters/Miner/weapon/boomarang.tscn")

enum Abilities { BOOMARANG }

var selected_ability = Abilities.BOOMARANG
var player: Player
var boomerang_instance: Boomerang = null

func _ready() -> void:
	player = get_node("/root/Game/Player")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print("Mouse event detected: ", event.button_index, " Pressed: ", event.pressed)
	if event.is_action_pressed("throw"):
		if selected_ability == Abilities.BOOMARANG:

			boomerang_ability()

func boomerang_ability() -> void:
	if boomerang_instance != null:
		print("Boomerang is already active!")
		return

	print("Instantiating Boomerang...")
	var _b = BOOMERANG.instantiate() as Boomerang
	if _b == null:
		return

	print("Adding Boomerang to scene...")
	player.add_sibling(_b)  # Add it to the scene
	_b.global_position = player.global_position


	_b.throw()  # Calls throw() in Boomerang script
	boomerang_instance = _b
