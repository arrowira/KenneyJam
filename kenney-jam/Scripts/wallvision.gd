extends RayCast3D

var invisWall = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	target_position = get_parent().get_parent().get_parent().playerPos
	if is_colliding():
		print(get_collider().name)
		if get_collider().name == "wallBody":
			
			if get_collider().get_parent()!=invisWall:
				if invisWall != null:
					invisWall.deInvis()
				invisWall = get_collider().get_parent()
				invisWall.invis()
		else:
			invisWall.deInvis()
			
