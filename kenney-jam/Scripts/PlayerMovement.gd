extends CharacterBody2D

var Speed = 60

func _physics_process(delta: float) -> void:
	velocity += (Input.get_vector("left","right", "up", "down").normalized())*Speed
	velocity-=velocity*0.1
	
	move_and_slide()
