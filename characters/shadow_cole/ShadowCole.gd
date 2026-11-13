extends PACCharacter

# Shadow Cole is Cole's scene (inherited) with another spritesheet and this
# script: he is not the player, and he has his own answers to actions

func _ready():
	id = "shadow_cole"
	display_name = "Shadow Cole"

	# How he moves
	speed = 5.0
	minimum_walkable_distance = 0.5

	# His speech is shown above his head
	speech_offset = Vector3(0, 9.7, 0)

	# Clicking on him makes Cole talk to him
	main_action = PAC.actions.talk_to

	description = "It is me, but in black and white... lazy developers"

	# Make him look at Cole
	self.face_object($'../Cole')


# Function executed when we click on Shadow Cole
func talk_to(who):
	# Cole approaches, Shadow Cole looks at him and says hi
	who.approach(self)
	self.face_object(who)
	self.say("Hi " + who.display_name)


func use_item(who, item):
	# Called when <WHO> uses <ITEM> on me
	who.approach(self)
	self.face_object(who)

	if item.id != "green_box":
		self.say("No, please give me the green box")
		return

	self.receive_item(who, item)
	self.say("Thanks")

	$"../Red Box".use_item(self, item)

	who.say("That's it, now you can check the code!")
	who.say("Thanks for being interested in our work")

	self.say("We are sure you will make awesome games!")

# The same, written as a cutscene (see cutscenes/ShadowBox.txt)
#func use_item(who, item):
#	PAC.play_scene("res://examples/character_interaction/cutscenes/ShadowBox.txt", {"item": item})
