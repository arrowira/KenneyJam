extends Control

var DownT = load("res://UI elements/PNG/buttonLong_brown_pressed.png")
var UpT = load("res://UI elements/PNG/buttonLong_brown.png")

var StealthBuy = false
var StealthCost = 1

func _physics_process(delta: float) -> void:
	var p = false
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		p = true
		
	if(StealthBuy==true):
		if(p==true && Player.Scales >= StealthCost):
			Player.Scales-=StealthCost
			StealthCost+=1
			
			$StealthButton/ButtonSprite.texture = DownT
		else:
			$StealthButton/ButtonSprite.texture = UpT
	else:
		$StealthButton/ButtonSprite.texture = UpT

func MEnterStealth() -> void:
	StealthBuy = true
	$StealthButton/ButtonSprite.modulate = Color(1.3, 1.3, 1.3)

func MExitStealth() -> void:
	StealthBuy = false
	$StealthButton/ButtonSprite.modulate = Color.WHITE
