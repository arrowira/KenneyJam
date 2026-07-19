extends Sprite2D

var DList = [
	"They say there's a way to escape this dreadful place. Reach the end of dungeon after the third gate, there 
	you'll find a white portal. But, that's just what they say.", 
	"Never let your torch run out. Anything can get you in the dark. ", 
	"Civilization collapsed long ago. This is all we have left.", 
	"Watch the snakes. They will try to snuff out your torch. You can't let that happen.", 
	"Come back here if you ever need a torch refill. I got all the resources in the world. Literally."]

func _ready():
	$Text.text = DList[randi_range(0, 4)]
