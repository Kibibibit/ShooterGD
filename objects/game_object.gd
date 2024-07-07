extends Node2D
class_name GameObject


const HITBOX_COMPONENT_PATH: NodePath = ^"HitboxComponent"
const HURTBOX_COMPONENT_PATH: NodePath = ^"HurtboxComponent"
const SPRITE2D_COMPONENT_PATH: NodePath = ^"Sprite2D"
const ATTACK_COMPONENT_PATH: NodePath = ^"AttackComponent"
const PLAYER_CONTROLLER_COMPONENT_PATH: NodePath = ^"PlayerController"
const PROJECTILE_COMPONENT_PATH: NodePath = ^"ProjectileComponent"
const HEALTH_COMPONENT_PATH: NodePath = ^"HealthComponent"
const DEATH_PARTICLE_COMPONENT_PATH: NodePath = ^"DeathParticleComponent"

func destroy_game_object(death_particle: bool = false) -> void:
	if (death_particle):
		if (has_death_particle_component()):
			get_death_particle_component().trigger()
	if (get_parent() != null):
		get_parent().remove_child(self)
		self.queue_free()
	else:
		print(name)

func has_hitbox() -> bool:
	return has_node(HITBOX_COMPONENT_PATH)

func get_hitbox() -> HitboxComponent:
	assert(self.has_hitbox(), "Tried to get hitbox from object that doesn't have one!")
	return get_node(HITBOX_COMPONENT_PATH) as HitboxComponent

func has_hurtbox() -> bool:
	return has_node(HURTBOX_COMPONENT_PATH)

func get_hurtbox() -> HurtboxComponent:
	assert(self.has_hurtbox(), "Tried to get hurttbox from object that doesn't have one!")
	return get_node(HURTBOX_COMPONENT_PATH) as HurtboxComponent

func has_sprite2d() -> bool:
	return has_node(SPRITE2D_COMPONENT_PATH)

func get_sprite2d() -> Sprite2D:
	assert(self.has_sprite2d(), "Tried to get sprite2d from object that doesn't have one!")
	return get_node(SPRITE2D_COMPONENT_PATH) as Sprite2D

func has_attack_component() -> bool:
	return has_node(ATTACK_COMPONENT_PATH)

func get_attack_component() -> AttackComponent:
	assert(self.has_attack_component(), "Tried to get attack component from object that doesnt have one!")
	return get_node(ATTACK_COMPONENT_PATH) as AttackComponent

func has_player_controller() -> bool:
	return has_node(PLAYER_CONTROLLER_COMPONENT_PATH)

func get_player_controller() -> PlayerController:
	assert(self.has_player_controller(), "Tried to get player controller component from object that doesnt have one!")
	return get_node(PLAYER_CONTROLLER_COMPONENT_PATH) as PlayerController

func has_projectile_component() -> bool:
	return has_node(PROJECTILE_COMPONENT_PATH)

func get_projectile_component() -> ProjectileComponent:
	assert(self.has_projectile_component(), "Tried to get projectile component from object that doesnt have one!")
	return get_node(PROJECTILE_COMPONENT_PATH) as ProjectileComponent

func has_health_component() -> bool:
	return has_node(HEALTH_COMPONENT_PATH)

func get_health_component() -> HealthComponent:
	assert(self.has_health_component(), "Tried to get health component from object that doesnt have one!")
	return get_node(HEALTH_COMPONENT_PATH) as HealthComponent

func has_death_particle_component() -> bool:
	return has_node(DEATH_PARTICLE_COMPONENT_PATH)

func get_death_particle_component() -> DeathParticleComponent:
	assert(has_death_particle_component(), "Tried to get death particle component from object that doesnt have one!")
	return get_node(DEATH_PARTICLE_COMPONENT_PATH) as DeathParticleComponent
