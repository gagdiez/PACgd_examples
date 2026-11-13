extends Node3D

# This is the main script for the Level.
# PAC finds the player and every object by itself (cutscenes call them by
# their id, set in each object's script), so all we have to do is to play the
# intro CutScene when the game starts

func _ready():
	PAC.play_scene("res://examples/cutscenes/cutscenes/Intro.txt")
