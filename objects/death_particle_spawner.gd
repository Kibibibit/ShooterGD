extends Node2D
class_name DeathParticleSpawner

func _ready() -> void:
	DeathParticles.spawn_particle.connect(spawn_particle)

func _exit_tree() -> void:
	DeathParticles.spawn_particle.disconnect(spawn_particle)

func spawn_particle(pos: Vector2, code: StringName) -> void:
	var frames: SpriteFrames = DeathParticles.get_particle_frames(code)
	var instance: DeathParticleObject = DeathParticleObject.new()
	instance.position = pos
	instance.sprite_frames = frames
	instance.animation = &"default"
	instance.play()
	
	add_child(instance)
