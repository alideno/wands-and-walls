extends Node3D


@export var health: int = 3

func take_damage(damage: int) -> void:
	health -= damage
	if health <= 0:
		queue_free()



