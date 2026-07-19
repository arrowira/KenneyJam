extends Node3D

var pSnake = preload("res://Scenes/snake/snake.tscn")
func spawn():
	var nodes = get_children().size()
	var snake = pSnake.instantiate()
	var randomIndex = randi_range(0,nodes-1)
	snake.position = get_children()[randomIndex].position
	get_parent().add_child(snake)
	
		
