extends Node2D
class_name WeaponPointComponent

signal spawn_projectile(pos: Vector2, code: StringName)

@export
var projectile: StringName
@export
var cooldown_frames: int
@export
var firing_index: int

var cooldown: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Projectiles.connect_signal(self)

func _exit_tree() -> void:
	Projectiles.disconnect_signal(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (cooldown > 0):
		cooldown -= 1

func can_fire() -> bool:
	return cooldown <= 0

func fire() -> void:
	if (can_fire()):
		spawn_projectile.emit(global_position, projectile)
		cooldown = cooldown_frames
