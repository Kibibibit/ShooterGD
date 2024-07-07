extends Node
class_name BasicEnemyController



var angle = randf_range(0.0, 2.0*PI)

var move_radius: float = 40.0
var speed: float = 2.0


var anchor_pos: Vector2


var parent: GameObject
var attack_component: AttackComponent
var can_attack: bool = false

func _ready() -> void:
	if (get_parent() is GameObject):
		parent = get_parent() as GameObject
		anchor_pos = parent.global_position
		if (parent.has_attack_component()):
			attack_component = parent.get_attack_component()
			can_attack = true
	else:
		push_error("BasicEnemyController component is missing parent!")

func _process(delta: float) -> void:
	
	angle += delta*speed
	while (angle > 2.0*PI):
		angle -= 2.0*PI
	parent.global_position = anchor_pos + Vector2.from_angle(angle)*move_radius
	
	if (can_attack):
		attack_component.fire()
	
