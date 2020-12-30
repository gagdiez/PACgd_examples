extends Interactive

func _ready():
	# The green box starts being invisible, and we cannot interact with it
	visible = false
	interactive = false
	
	# We can take it
	main_action = ACTIONS.take
	
	# We have to stand a couple of pixels away from it to interact
	interaction_position = self.transform.origin + Vector3(3, 0, 0)
	
	# Description and thumbnail
	description = "That's a new box"
	thumbnail = "res://thumbnails/green_box.png"
