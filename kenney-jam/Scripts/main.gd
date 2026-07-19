extends Node3D

var playerPos = Vector3.ZERO

func _process(delta: float) -> void:
	playerPos = $Player.position
