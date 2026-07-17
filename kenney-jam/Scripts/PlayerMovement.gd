extends CharacterBody3D

var Speed = 2

func _physics_process(delta: float) -> void:
	
	if(Input.is_action_pressed("left")):
		velocity.x-=Speed
	if(Input.is_action_pressed("right")):
		velocity.x+=Speed
	if(Input.is_action_pressed("up")):
		velocity.z-=Speed
	if(Input.is_action_pressed("down")):
		velocity.z+=Speed
		
	velocity-=velocity*0.1
	move_and_slide()
