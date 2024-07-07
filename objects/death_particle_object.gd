extends AnimatedSprite2D
class_name DeathParticleObject


func _ready() -> void:
	self.animation_finished.connect(_die)
	
func _die() -> void:
	get_parent().remove_child(self)
	queue_free()
