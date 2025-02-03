class_name PlayerAbilities
extends Node2D


const BOOMARANG = preload("res://characters/Miner/weapon/boomarang.tscn")

enum abilities { BOOMARANG }

var selected_ability = abilities.BOOMARANG
var player : Player
var boomarange_instance : Boomerang = null

func _ready() -> void:
	player = get_node("/root/Game/Player")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("throw"):
		if selected_ability == abilities.BOOMARANG: #hardcoded to only ability is the boomarang
			boomerang_ability()
	pass
	
	
func boomerang_ability() -> void:
	if boomarange_instance != null:
		return
	var _b = BOOMARANG.instantiate() as Boomerang
	player.add_sibling( _b)
	_b.global_position = player.global_position
	
	var throw_direction = player.direction
	if throw_direction == Vector2.ZERO:
		throw_direction = player.cardinal_direction #might need to edit player.gd, needs it to throw when player is not moving\
	
	_b.throw( throw_direction )
	boomarange_instance = _b
	
	pass








	
	
	
	
	
	
	
	
	
	
