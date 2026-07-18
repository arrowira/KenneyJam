extends Node3D


var dir = Vector2(-1,0)
var behavior = "idle"
var SPEED = 0.01

var player
var byPlayer = false

var angerDir = Vector2(1,0)
var angerSpeedMod = 2

var pScale = preload("res://Scenes/Scale.tscn")
var color
var rarity = 3

func _ready() -> void:
	color = Color.WHITE
	color.r = randf()
	color.b = randf()
	color.g = randf()
	for piece in $Node.get_children():
		piece.modulate = color
	

func _physics_process(delta: float) -> void:
	if byPlayer:
		$eyes/RayCast3D.target_position=player.position
	if byPlayer:
		if !$eyes/RayCast3D.is_colliding():
			behavior = "angry"
		elif $eyes/RayCast3D.get_collider().name == "Player" :
			behavior = "angry"
			
	
	if behavior == "walk":
		position.x += dir.x*SPEED
		position.z += dir.y*SPEED
	elif behavior == "idle":
		$AnimationPlayer.speed_scale = $idleTime.time_left/$idleTime.wait_time
	elif behavior == "angry":
		position.z += angerDir.x * SPEED * angerSpeedMod
		position.x += angerDir.y * SPEED * angerSpeedMod
	if behavior == "angry":
		look_at(get_parent().get_parent().playerPos)
		rotation.y+= -PI/2
		rotation.z = 0
		rotation.x = 0
		angerSpeedMod += 0.03
		angerDir = -Vector2(cos(rotation.y + PI/2), sin(rotation.y + PI/2))
	else:
		angerSpeedMod = 2
		rotation.y=dir.angle_to(Vector2(-1,0))

func _on_mood_timeout() -> void:
	#scale drop
	if randf()<0.05:
		var newScale = pScale.instantiate()
		newScale.configure(color, rarity)
		newScale.position=position
		newScale.position.y-=0.2
		newScale.rotation.y = randf()*360
		get_parent().get_parent().add_child(newScale)
	
	#mood swings
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
	if body.name == "Player":
		print("game over")
	else:
		dir = dir.orthogonal()
		if randf()<0.5:
			dir *= -1


func _on_eyes_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		byPlayer = true
		player = body.get_parent()



func _on_eyes_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		byPlayer = false
