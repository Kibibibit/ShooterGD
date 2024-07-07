extends Area2D
class_name HurtboxComponent


@export
var damage: int

@export
var destroy_on_hit: bool

var parent: GameObject

func _ready() -> void:
	
	if (get_parent() is GameObject):
		parent = get_parent()
	else:
		push_error("Hurtbox doesn't have parent!")
	
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D) -> void:
	if (area is HitboxComponent):
		var area_parent: GameObject = area.parent
		if (area_parent.has_health_component()):
			area_parent.get_health_component().do_damage(damage)
		if (destroy_on_hit):
			parent.destroy_game_object.call_deferred(true)
