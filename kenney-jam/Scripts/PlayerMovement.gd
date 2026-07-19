extends CharacterBody3D

var DScale #Default sprite scale

var Speed = 1

var Scales = 0

var CPivot = 1
var TPos = Vector3.ZERO
var COff = Vector3.ZERO

func _ready():
	DScale = $Model.scale
	TPos = $Camera.position

func _physics_process(delta: float) -> void:
	#animations
	if velocity.length() > 0.9:
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("idle")
	
	get_parent().get_node("CanvasLayer/ScaleCount").text = str(Scales)
	
	var dir = Vector3.ZERO
	if(Input.is_action_just_pressed("cright")):
		CPivot+=1
		if(CPivot >= 5):
			CPivot=1
		TPos = get_node("Pivot" + str(CPivot)).position
		$Model.rotation_degrees.y+=90
	if(Input.is_action_just_pressed("cleft")):
		CPivot-=1
		if(CPivot <= 0):
			CPivot=4
		TPos = get_node("Pivot" + str(CPivot)).position
		$Model.rotation_degrees.y-=90
	$Camera.position = $Camera.position.move_toward(TPos, 0.3)
	$Camera.look_at(position)
	
	if(Input.is_action_pressed("left")):
		dir.x-=Speed
	if(Input.is_action_pressed("right")):
		dir.x+=Speed
	if(Input.is_action_pressed("up")):
		dir.z-=Speed
	if(Input.is_action_pressed("down")):
		dir.z+=Speed
	
	dir = dir.rotated(Vector3.UP, $Camera.global_rotation.y)
	
	if(Input.is_action_pressed("crouch")):
		velocity*=0.5
		$Model.scale.y = 0.25
	else:
		$Model.scale.y = DScale.y

	if(Input.is_action_pressed("run") && !Input.is_action_pressed("crouch")):
		dir = Vector3(dir.x*2, dir.y, dir.z*2)
	
	velocity += dir.normalized()
	velocity-=velocity*0.2
	move_and_slide()
	
	
	
