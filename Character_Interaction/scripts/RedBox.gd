extends Interactive

func _ready():
	# We can take this object
	main_action = ACTIONS.take

	# We have to stand a couple of pixels away from it to interact
	interaction_position = self.transform.origin + Vector3(3, 0, 0)

	# Description and Thumbnail
	description = "I think that's the box I have to move"
	thumbnail = "res://thumbnails/red_box.png"

func take(who):
	# When we click on the box, this function will be executed
	# We get Cole close, make him "grab" the box, and add it to his inventory
	who.say("Lets grab the box")
	who.approach(self)
	who.animate_until_finished("raise_hand")
	who.call_function_from(self, "grab")
	who.add_to_inventory(self)
	who.animate_until_finished("lower_hand")

func grab():
	# Function called after Cole raises the hand - line 21: who.interact(...)
	visible = false
	interactive = false
	description = "The red box I took before"

func use_item(who, item):
	# Function executed when <WHO> uses <ITEM> on THIS RED BOX
	if who == $'../Cole':
		who.say("I need to give the box to Shadow Cole")
	else:
		who.approach(self)
		who.animate_until_finished("raise_hand")
		who.call_function_from(self, "place_box", [item])
		who.remove_from_inventory(item)
		who.animate_until_finished("lower_hand")

func place_box(box):
	box.transform.origin = self.transform.origin + Vector3(0, 2, 0)
	box.visible = true
	
	self.interactive = false
