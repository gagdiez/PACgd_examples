extends Character

var placed_box

func _ready():
	SPEED = 5
	MINIMUM_WALKABLE_DISTANCE = 0.5
	talk_bubble_offset = Vector3(0, 9.7, 0)

	main_action = ACTIONS.talk_to

	description = "It is me, but in black and white... lazy developers"
	interaction_position = self.transform.origin - Vector3(5, 0, 0)
	
	# Make it look at Shadow Cole
	face_object($'../Cole')


# Function executed when we click on Shadow Cole
func talk_to(who):
	self.wait_on_character(who, "arrived")
	self.face_object(who)
	self.say("Hi " + who.name)

	who.approach(self)
	who.emit_message("arrived")

func use_item(who, item):
	# Called when <WHO> uses <ITEM> on me
	# Cole approaches Shadow Cole
	who.approach(self)
	who.emit_message("arrived")

	# Shadow Cole waits until Cole arrives and looks at him
	self.wait_on_character(who, "arrived")
	self.face_object(who)

	if item != $"../Green Box":
		self.say("No, please give me the green box")
		return

	self.receive_item(who, item)

	self.say("Thanks")
	$"../Red Box".use_item(self, item) #-> it populates the queue of Shadow Cole
	self.emit_message("box_placed")

	# Cole waits and says thank you
	who.wait_on_character(self, "box_placed")
	who.say("That's it, now you can check the code!")
	who.say("Thanks for being interested in our work")
	who.emit_message("finished_talking")

	# Shadow Cole waits says thank you
	self.wait_on_character(who, "finished_talking")
	self.say("We are sure you will make awesome games!")

#func use_item(who, item):
#	$"../PointClick".play_scene('res://cutscenes/ShadowBox.txt', {"item":item})
