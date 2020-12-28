extends Interactive

func _ready():
	# We can take this object
	main_action = ACTIONS.take

	# We have to stand a couple of pixels away from it to interact
	position = self.transform.origin + Vector3(3, 0, 0)

	# Description and Thumbnail
	description = "I think that's the box I have to move"
	thumbnail = "res://thumbnails/red_box.png"

func take(who):
	# When we click on the box, this function will be executed
	# We get Cole close, make him "grab" the box, and add it to his inventory
	who.say("Lets grab the box")
	who.approach(self)
	who.face_object(self)
	who.animate_until_finished("raise_hand")
	who.interact(self, "grab")
	who.add_to_inventory(self)
	who.animate_until_finished("lower_hand")

func grab():
	# Function called after Cole raises the hand - line 21: who.interact(...)
	visible = false
	interactive = false
	description = "The red box I took before"

func use_item(who, what):
	# Function executed when <WHO> uses <WHAT> on THIS RED BOX
	# In this particular game we know that <WHAT> will be the GREEN BOX since
	
	# Cole will approach, and place the green box on top of it
	who.approach(self)
	who.face_object(self)
	who.animate_until_finished("raise_hand")
	who.remove_from_inventory(what)
	who.interact(self, "place_box", [what])
	who.animate_until_finished("lower_hand")
	who.say("That's it, now you can check the code!")
	who.say("Thanks for being interested in our work")
	who.say("We are sure you will make awesome games!")
	
	# Red box is not interactive anymore
	self.interactive = false

func place_box(box):
	# Function called after Cole raises the hand
	box.transform.origin = self.transform.origin + Vector3(0, 2, 0)
	box.visible = true
