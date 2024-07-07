extends Node2D
class_name ProjectileSpawner


func _ready() -> void:
	Projectiles.spawn_projectile.connect(spawn_projectile)

func _exit_tree() -> void:
	Projectiles.spawn_projectile.disconnect(spawn_projectile)

func spawn_projectile(pos: Vector2, code: StringName) -> void:
	
	var scene: PackedScene = Projectiles.get_projectile_scene(code)
	var instance: GameObject = scene.instantiate() as GameObject
	instance.position = pos
	
	add_child(instance)
