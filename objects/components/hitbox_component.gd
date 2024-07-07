extends Area2D
class_name HitboxComponent



var parent: GameObject

func _ready() -> void:
	if (get_parent() is GameObject):
		parent = get_parent()
	else:
		push_error("Hitbox component is missing parent!")
