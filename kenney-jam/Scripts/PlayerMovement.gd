extends CharacterBody3D

var Speed = 600

func _physics_process(delta: float) -> void:
	var vec2 = (Input.get_vector("left","right", "up", "down").normalized())*Speed
	velocity += Vector3(vec2.x, 0, vec2.y)
	velocity-=velocity*0.1
	
	move_and_slide()
