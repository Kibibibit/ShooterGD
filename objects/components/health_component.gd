extends Node
class_name HealthComponent


@export var max_health: int

var health: int

var parent: GameObject

func _ready() -> void:
	if (get_parent() is GameObject):
		parent = get_parent()
	else:
		push_error("Health component is missing parent!")
	
	health = max_health


func do_damage(amount: int) -> void:
	health -= amount
	if (health <= 0):
		parent.destroy_game_object.call_deferred(true)
