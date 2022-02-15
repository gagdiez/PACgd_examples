extends Node2D


func _ready():
	$Cole2D.navigation = $Navigation2D
	$Cole2D.z_index = 1

	$PointClick.init($Cole2D)
