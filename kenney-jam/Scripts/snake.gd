extends Node3D


var dir = Vector2(-1,0)
var behavior = "idle"
var SPEED = 0.01

var player
var byPlayer = false

func _physics_process(delta: float) -> void:
	rotation.y=dir.angle_to(Vector2(-1,0))
	if behavior == "walk":
		position.x += dir.x*SPEED
		position.z += dir.y*SPEED
	elif behavior == "idle":
		$AnimationPlayer.speed_scale = $idleTime.time_left/$idleTime.wait_time

func _on_mood_timeout() -> void:
	if randf()<0.8:
		behavior = "walk"
		$AnimationPlayer.speed_scale=1
		$AnimationPlayer.play("slither")
	else:
		behavior = "idle"
		$idleTime.start()
	if behavior == "idle":
		if randf()<0.1:
			dir *= -1


func _on_wall_detection_body_entered(body: Node3D) -> void:
	dir = dir.orthogonal()
	if randf()<0.5:
		dir *= -1


func _on_eyes_body_entered(body: Node3D) -> void:
	if body.get_parent().name == "Player":
		byPlayer = true
		player = body.get_parent()



func _on_eyes_body_exited(body: Node3D) -> void:
	if body.get_parent().name == "Player":
		byPlayer = false
