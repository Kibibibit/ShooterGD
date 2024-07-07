extends Node2D
class_name DeathParticleComponent

signal spawn_particle(pos: Vector2, code: StringName)

@export
var code: StringName


var parent: GameObject

func _ready() -> void:
	if (get_parent() is GameObject):
		parent = get_parent()
		DeathParticles.connect_signal(self)
	else:
		push_error("Health component is missing parent!")

func _exit_tree() -> void:
	DeathParticles.disconnect_signal(self)


func trigger() -> void:
	spawn_particle.emit(global_position, code)
