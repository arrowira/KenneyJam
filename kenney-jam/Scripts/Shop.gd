extends Control

var DownT = load("res://UI elements/PNG/buttonLong_brown_pressed.png")
var UpT = load("res://UI elements/PNG/buttonLong_brown.png")


func _physics_process(delta: float) -> void:
	pass



func MEnterStealth() -> void:
	print("yes")
	$StealthButton/ButtonSprite.texture = DownT

func MExitStealth() -> void:
	print("yes")
	$StealthButton/ButtonSprite.texture = UpT
