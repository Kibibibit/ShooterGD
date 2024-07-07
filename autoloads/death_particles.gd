extends Node

signal spawn_particle(pos: Vector2, code: StringName)

const PLAYER_BULLET_BURST: StringName = &"PlayerBulletBurst"
const ENEMY_BULLET_BURST: StringName = &"EnemyBulletBurst"
const EXPLOSION: StringName = &"Explosion"
const EXPLOSION_BIG: StringName = &"ExplosionBig"

const ALL: Array[StringName] = [
	PLAYER_BULLET_BURST,
	ENEMY_BULLET_BURST,
	EXPLOSION,
	EXPLOSION_BIG
]

const SPRITE_FRAMES: Dictionary = {
	PLAYER_BULLET_BURST: preload("res://assets/sprite_frames/player_bullet_burst.tres"),
	ENEMY_BULLET_BURST: preload("res://assets/sprite_frames/enemy_bullet_burst.tres"),
	EXPLOSION: preload("res://assets/sprite_frames/explosion.tres"),
	EXPLOSION_BIG: preload("res://assets/sprite_frames/explosion_big.tres")
}

func get_particle_frames(code: StringName) -> SpriteFrames:
	assert(particle_exists(code), "Tried to get particle with code %s that doesn't exist!" % code)
	return SPRITE_FRAMES[code] as SpriteFrames

func particle_exists(code: StringName) -> bool:
	return ALL.has(code)

func connect_signal(component: DeathParticleComponent):
	component.spawn_particle.connect(forward_spawn_signal)

func disconnect_signal(component: DeathParticleComponent):
	component.spawn_particle.disconnect(forward_spawn_signal)

func forward_spawn_signal(pos: Vector2, code: StringName) -> void:
	spawn_particle.emit(pos, code)
