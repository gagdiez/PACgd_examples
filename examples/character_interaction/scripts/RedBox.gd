extends PACInteractive

func _ready():
	id = "red_box"

	# We can take this object
	main_action = PAC.actions.take

	# Where to stand to interact: the InteractionPoint marker in the scene

	# Description and Thumbnail
	description = "I think that's the box I have to move"
	thumbnail = preload("res://thumbnails/red_box.png")

func take(who):
	# When we click on the box, this function will be executed
	# We get Cole close, make him "grab" the box, and add it to his inventory
	who.say("Lets grab the box")
	who.approach(self)
	who.animate_until_finished(who.anim_raise_hand)
	self.run(grab)
	who.add_to_inventory(self)
	who.animate_until_finished(who.anim_lower_hand)

func grab():
	# Function called after Cole raises the hand
	self.visible = false
	interactive = false
	description = "The red box I took before"

func use_item(who, item):
	# Function executed when <WHO> uses <ITEM> on THIS RED BOX
	if who == $'../Cole':
		who.say("I need to give the box to Shadow Cole")
	else:
		who.approach(self)
		who.animate_until_finished(who.anim_raise_hand)
		self.run(place_box.bind(item))
		who.remove_from_inventory(item)
		who.animate_until_finished(who.anim_lower_hand)

func place_box(box):
	box.global_position = self.global_position + Vector3(0, 2, 0)
	box.visible = true

	self.interactive = false
