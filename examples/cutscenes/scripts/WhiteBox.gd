extends PACInteractive

func _ready():
	id = "white_box"

	# For the WHITE box, the main_action is (implicitly) "walk_to"

	# Where to stand to interact: the InteractionPoint marker in the scene

	# Description
	description = "The mythical white box!"

func use_item(who, item):
	# The WHITE box will interact with the RED one, since the GREEN is hidden
	who.approach(self)
	who.say("Time to place one box on top of the other")
	who.animate_until_finished(who.anim_raise_hand)
	who.remove_from_inventory(item)
	self.run(place_box.bind(item))
	who.animate_until_finished(who.anim_lower_hand)
	who.say("Wow, a floating box appeared!")

	# Uncomment the next line to make Cole automatically pile the GREEN box
	# self.run(play_outro)

func place_box(box):
	# Place the box on top of the WHITE one, and interact with it from this
	# side (its InteractionPoint moves with it, we just change the side)
	box.global_position = self.global_position + Vector3(0, 2, 0)
	box.interaction_point.position = Vector3(-3, 0, 0)
	box.visible = true
	box.interactive = true

	# Change its main action, so you cannot "use" it anymore
	box.main_action = PAC.actions.walk_to

	# The GREEN box appears!
	$"../Green Box".visible = true
	$"../Green Box".interactive = true
	$"../Green Box/CollisionShape3D".disabled = false

	# The WHITE box is not interactive anymore
	self.interactive = false

func play_outro():
	# The OUTRO showcases our CutScene system
	PAC.play_scene("res://examples/cutscenes/cutscenes/Outro.txt")
