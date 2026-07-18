extends Node3D

var playerPos

func _process(delta: float) -> void:
	playerPos = $Player.position
