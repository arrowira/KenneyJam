extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
		if(body.name == "Player"):
			get_tree().change_scene_to_file("res://Scenes/merchant.tscn")
