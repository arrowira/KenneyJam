extends Node3D


var dir = Vector2(1,0)
var behavior = "idle"
var SPEED = 200

func _physics_process(delta: float) -> void:
	if behavior == "walk":
		position.x += dir.x*SPEED
		position.z += dir.y*SPEED
		

func _on_mood_timeout() -> void:
	if randf()<0.8:
		behavior = "walk"
		$AnimationPlayer.play("slither")
	else:
		$AnimationPlayer.play("idle")
		behavior = "idle"
	if behavior == "idle":
		if randf()<0.3:
			dir *= -1
