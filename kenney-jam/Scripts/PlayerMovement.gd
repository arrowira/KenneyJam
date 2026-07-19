extends CharacterBody3D

var DScale #Default sprite scale

var CPivot = 1
var TPos = Vector3.ZERO
var COff = Vector3.ZERO

var Scales = 0

var CTorch = 0
var MaxTorch = 60
var TickTime = 0
var TorchIntensity = 1.0

var Speed = 1 


func _ready():
	get_tree().scene_changed.connect(SceneChange)
	SceneChange()
	CTorch = MaxTorch

func _physics_process(delta: float) -> void:
	var checkable = false
	if(get_tree().current_scene != null):
		checkable = true
	else:
		checkable = false
	if(checkable == true && get_tree().current_scene.name == "Main"):
		if(CTorch <= 0):
			print("Return By Death")
		
		if(TickTime >= 60):
			CTorch-=1
			TickTime = 0
		TickTime+=1
		
		#animations
		if velocity.length() > 0.9:
			$AnimationPlayer.play("walk")
		else:
			$AnimationPlayer.play("idle")
		
		get_tree().current_scene.get_node("CanvasLayer/ScaleCount").text = str(Scales)
		
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
			$ModelPivot.rotation_degrees.y=90
		if(Input.is_action_pressed("right")):
			dir.x+=Speed
			$ModelPivot.rotation_degrees.y=-90
		if(Input.is_action_pressed("up")):
			dir.z-=Speed
			$ModelPivot.rotation_degrees.y=0
		if(Input.is_action_pressed("down")):
			dir.z+=Speed
			$ModelPivot.rotation_degrees.y=180
		
		dir = dir.rotated(Vector3.UP, $Camera.global_rotation.y)
		if(Input.is_action_pressed("crouch")):
			velocity*=0.5
			$ModelPivot/Model.scale.y = 0.25
		else:
			$ModelPivot/Model.scale.y = DScale.y

		if(Input.is_action_pressed("run") && !Input.is_action_pressed("crouch")):
			dir = Vector3(dir.x*2, dir.y, dir.z*2)
		
		velocity += dir.normalized()
		velocity-=velocity*0.2
		move_and_slide()

func SceneChange():
	if(get_tree().current_scene != null):
		if(get_tree().current_scene.name == "Main"):
			DScale = $ModelPivot/Model.scale
			TPos = $Camera.position
			global_position = Vector3(0.0, 0.127, -5.26)
