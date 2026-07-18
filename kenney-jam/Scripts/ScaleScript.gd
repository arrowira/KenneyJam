extends Area3D

var rarity = 0
func _on_body_entered(body: Node3D) -> void:
	if(body.name == "Player"):
		body.Scales +=1
		queue_free()

func configure(color, r):
	$Sprite.modulate = color
	rarity = r
