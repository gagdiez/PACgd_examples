extends PACInteractive

func _ready():
	id = "green_box"

	# The green box starts being invisible, and we cannot interact with it
	self.visible = false
	interactive = false

	# We can take it
	main_action = PAC.actions.take

	# Where to stand to interact: the InteractionPoint marker in the scene

	# Description and thumbnail
	description = "That's a new box"
	thumbnail = preload("res://thumbnails/green_box.png")
