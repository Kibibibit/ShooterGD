extends Node
class_name PlayerController


const INPUT_PLAYER_LEFT: StringName = &"player_left"
const INPUT_PLAYER_RIGHT: StringName = &"player_right"
const INPUT_PLAYER_UP: StringName = &"player_up"
const INPUT_PLAYER_DOWN: StringName = &"player_down"
const INPUT_PLAYER_FIRE: StringName = &"player_fire"

const MOVE_SPEED: float = 150.0


var parent: GameObject
var parent_set: bool = false

func _ready() -> void:
	if (get_parent() is GameObject):
		parent = get_parent() as GameObject
		parent_set = true
	else:
		push_error("Player controller doesn't have a parent!")

func _process(delta: float) -> void:
	
	if (parent_set):
		# Movement Code
		var x_speed: float = 0.0
		var y_speed: float = 0.0
		if (Input.is_action_pressed(INPUT_PLAYER_LEFT)):
			x_speed -= MOVE_SPEED
		if (Input.is_action_pressed(INPUT_PLAYER_RIGHT)):
			x_speed += MOVE_SPEED
		if (Input.is_action_pressed(INPUT_PLAYER_UP)):
			y_speed -= MOVE_SPEED
		if (Input.is_action_pressed(INPUT_PLAYER_DOWN)):
			y_speed += MOVE_SPEED
		
		parent.position.x += x_speed*delta
		parent.position.y += y_speed*delta
	
		# Firing code
		if (parent.has_attack_component()):
			if (Input.is_action_pressed(INPUT_PLAYER_FIRE)):
				parent.get_attack_component().fire()
