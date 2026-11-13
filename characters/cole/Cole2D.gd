extends PACCharacter

func _ready():
	id = "cole"
	display_name = "Cole"

	# Cole is the character the player controls
	is_player = true

	# How he moves (in pixels)
	speed = 200.0
	minimum_walkable_distance = 20.0

	# His speech is shown above his head
	speech_offset = Vector3(0, -284, 0)

	# Clicking on Cole does nothing
	main_action = null
	secondary_action = null
