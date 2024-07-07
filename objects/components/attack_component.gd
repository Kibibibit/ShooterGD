extends Node2D
class_name AttackComponent

enum FiringMode {ALL_AT_ONCE, SEQUENTIAL}

@export
var firing_mode: FiringMode

var weapons: Array[WeaponPointComponent] = []


func _ready() -> void:
	for child in get_children():
		if (child is WeaponPointComponent):
			weapons.append(child)
	weapons.sort_custom(_sort_weapons)

func _sort_weapons(a: WeaponPointComponent, b:WeaponPointComponent):
	return a.firing_index < b.firing_index

func fire() -> void:
	if (firing_mode == FiringMode.ALL_AT_ONCE):
		for weapon in weapons:
			if (weapon.can_fire()):
				weapon.fire()
	elif (firing_mode == FiringMode.SEQUENTIAL):
		for index in range(0, weapons.size()):
			var weapon: WeaponPointComponent = weapons[index]
			if (weapon.can_fire()):
				var prev_index: int = index-1
				if (prev_index < 0):
					prev_index = weapons.size() - 1
				var prev_weapon: WeaponPointComponent = weapons[prev_index]
				var prev_frames: float = float(prev_weapon.cooldown_frames)
				if (prev_weapon.cooldown <=  prev_frames - (prev_frames / weapons.size())):
					weapons[index].fire()
				break
