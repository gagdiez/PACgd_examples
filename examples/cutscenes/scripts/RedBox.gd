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
	# In this particular game we know that <ITEM> will be the GREEN BOX

	# Cole will approach, and place the green box on top of it
	who.approach(self)
	who.animate_until_finished(who.anim_raise_hand)
	who.remove_from_inventory(item)
	self.run(place_box.bind(item))
	who.animate_until_finished(who.anim_lower_hand)
	who.say("That's it, now you can check the code!")
	who.say("Thanks for being interested in our work")
	who.say("We are sure you will make awesome games!")

	# Red box is not interactive anymore
	self.interactive = false

func place_box(box):
	# Function called after Cole raises the hand
	box.global_position = self.global_position + Vector3(0, 2, 0)
	box.visible = true
