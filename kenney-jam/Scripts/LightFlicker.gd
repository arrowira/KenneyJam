extends OmniLight3D

@onready var FTimer = $Fl
var Flicker = false

func _ready():
	FTimer.timeout.connect(Flick)
	FTimer.one_shot = false

func _physics_process(delta: float) -> void:
	if(Flicker == false):
		light_energy = lerp(light_energy, randf(), 0.3)
		Flicker = true
		FTimer.wait_time = 0.05
		FTimer.start()    

func Flick():
	Flicker = false
