extends Node


signal spawn_projectile(pos: Vector2, code: StringName)

const PLAYER: StringName = &"PlayerProjectile"
const ENEMY: StringName = &"EnemyProjectile"

const ALL: Array[StringName] = [
	PLAYER,
	ENEMY
]

const SCENES: Dictionary = {
	PLAYER: preload("res://objects/game_objects/player_projectile.tscn"),
	ENEMY: preload("res://objects/game_objects/enemy_projectile.tscn")
}

func get_projectile_scene(code: StringName) -> PackedScene:
	assert(projectile_exists(code), "Tried to get projectile with code %s that doesn't exist!" % code)
	return SCENES[code] as PackedScene

func projectile_exists(code: StringName) -> bool:
	return ALL.has(code)

func connect_signal(component: WeaponPointComponent):
	component.spawn_projectile.connect(forward_spawn_signal)

func disconnect_signal(component: WeaponPointComponent):
	component.spawn_projectile.disconnect(forward_spawn_signal)

func forward_spawn_signal(pos: Vector2, code: StringName) -> void:
	spawn_projectile.emit(pos, code)
