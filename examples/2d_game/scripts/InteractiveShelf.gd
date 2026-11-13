extends PACInteractive

func _ready():
	id = "shelf"

	# The main_action is (implicitly) "walk_to"
	# The secondary_action is (implicitly) examine

	# Where to stand to interact: the InteractionPoint marker in the scene

	# Description
	description = "I want to place the red cube here"

func use_item(who, item):
	# The SHELF will interact with the CUBE
	who.approach(self)
	who.animate_until_finished(who.anim_raise_hand)
	who.remove_from_inventory(item)
	self.run(place_red_box.bind(item))
	who.animate_until_finished(who.anim_lower_hand)
	who.say("That is it, thank you for playing")

func place_red_box(red_box):
	# Run by the shelf once Cole has raised his hand
	red_box.global_position = self.global_position + Vector2(20, -22)
	red_box.visible = true

	# Change its main action, so you cannot "use" it anymore
	red_box.main_action = PAC.actions.walk_to

	# The boxes are not interactive anymore
	self.interactive = false
	red_box.interactive = false
