extends PACInteractive

func _ready():
	id = "cube"

	# We can take this object
	main_action = PAC.actions.take

	# The secondary_action is (implicitly) examine

	# Where to stand to interact: the InteractionPoint marker in the scene

	# Description and Thumbnail
	description = "The cube I have to move"
	thumbnail = preload("res://thumbnails/red_box.png")
