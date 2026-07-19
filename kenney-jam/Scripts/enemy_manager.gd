extends Node3D

@export var frequency = 1
var maxEnemies = 3
var enemies = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_children().size())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	enemies = get_children().size()-2

func _on_timer_timeout() -> void:
	if randf()<frequency and enemies<maxEnemies:
		$spawner.spawn()
