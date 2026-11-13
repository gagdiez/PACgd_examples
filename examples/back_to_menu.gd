extends CanvasLayer

# A button to go back to the menu. It is regular UI: PAC only receives the
# clicks that the UI does not use, so pressing it never makes Cole walk

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Menu.tscn")
