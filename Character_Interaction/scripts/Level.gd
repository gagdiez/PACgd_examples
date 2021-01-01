extends Spatial

# This is the main script for the Level.

func _ready():
	# For the players, we need to define their "navigation" and "camera"
	# properties.
	# -The Navigation NODE will guide our character through the level, telling
	#  him which paths to follow to go from one place to the other
	# -The Camera lets the player know which direction he should be facing when
	#  moving around 
	$Cole.navigation = $Navigation
	$Cole.camera = $Camera

	$"Shadow Cole".navigation = $Navigation
	$"Shadow Cole".camera = $Camera

	# We need to initialize our point and click system letting it know:
	# - Who's the player
	# - If you are going to play cutscenes, you need to define the dictionary
	#   that transforms text in the cutscene to objects in the game
	var name_to_object = {"cole": $Cole,
						  "shadow_cole": $"Shadow Cole",
						  "white_box": $"White Box",
						  "red_box": $"Red Box",
						  "green_box":$"Green Box"}
	$PointClick.init($Cole, name_to_object)
	
	# When the game starts, we play the intro CutScene
	#$PointClick.play_scene("res://cutscenes/Intro.txt")
