extends Control

# The examples menu: a button per example, each one loading its level. Nothing
# else is needed to switch levels: PAC lives outside of them, and finds the
# player and the objects of whichever level is loaded

const EXAMPLES = {
	"Cutscenes (3D)": "res://examples/cutscenes/Level.tscn",
	"Character Interaction (3D)": "res://examples/character_interaction/Level.tscn",
	"2D Game": "res://examples/2d_game/Level.tscn",
}

func _ready():
	# Every time we come back to the menu we start over: the inventory is
	# emptied (otherwise it would carry over from one example to the next)
	PAC.reset()

	for title in EXAMPLES:
		var button = Button.new()
		button.text = title
		button.pressed.connect(get_tree().change_scene_to_file.bind(EXAMPLES[title]))
		$Examples.add_child(button)
