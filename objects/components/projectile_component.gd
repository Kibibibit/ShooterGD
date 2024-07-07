extends Node
class_name ProjectileComponent

@export
var direction: Vector2

@export
var speed: float

var parent: GameObject
var parent_set: bool

var world_rect: Rect2

func _ready() -> void:
	if (get_parent() is GameObject):
		parent = get_parent()
		direction = direction.normalized()
		parent_set = true
		world_rect = get_viewport().get_visible_rect()
	else:
		push_error("Projectile component doesn't have a parent!")


func _process(delta: float) -> void:
	parent.position += speed*direction*delta
	
	if (not world_rect.has_point(parent.position)):
		parent.destroy_game_object()
	
