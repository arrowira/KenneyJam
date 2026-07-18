extends CharacterBody3D

var DScale #Default sprite scale

var Speed = 1

func _ready():
	DScale = $Sprite.scale

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
		
	if(Input.is_action_pressed("crouch")):
		velocity*=0.5
		$Sprite.scale.y = 0.5
	else:
		$Sprite.scale.y = DScale.y

	if(Input.is_action_pressed("run") && !Input.is_action_pressed("crouch")):
		dir = Vector3(dir.x*2, dir.y, dir.z*2)
	
	velocity += dir
	velocity-=velocity*0.2
	move_and_slide()
