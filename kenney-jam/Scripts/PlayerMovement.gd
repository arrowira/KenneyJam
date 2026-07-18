extends CharacterBody3D

var Speed = 2

func _physics_process(delta: float) -> void:
	var dir = Vector3.ZERO
	
	if(Input.is_action_pressed("left")):
		dir.x-=Speed
	if(Input.is_action_pressed("right")):
		dir.x+=Speed
	if(Input.is_action_pressed("up")):
		dir.z-=Speed
	if(Input.is_action_pressed("down")):
		dir.z+=Speed
	
	velocity += dir.normalized()
		
	velocity-=velocity*0.2
	move_and_slide()
