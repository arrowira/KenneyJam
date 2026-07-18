extends Node3D


var dir = Vector2(1,0)
var behavior = "idle"

func _physics_process(delta: float) -> void:
	

func _on_mood_timeout() -> void:
	if randf()<0.8:
		behavior = "walk"
	else:
		behavior = "idle"
	if behavior == "idle":
		if randf()<0.3:
			dir *= -1
