extends Character

var placed_box

func _ready():
	._ready()

	interaction_position = self.transform.origin - Vector3(5, 0, 0)

func talk_to(who):
	who.approach(self)
	who.emit_message("arrived")
	
	self.wait_on_player(who, "arrived")
	self.face_object(who)
	self.say("Hi " + who.name)

func use_item(who, item):
	
	who.approach(self)
	who.emit_message("arrived")
	
	self.wait_on_player(who, "arrived")
	self.face_object(who)
	
	if item != $"../Green Box":
		self.say("No, please give me the green box")
		return
	
	who.animate_until_finished("raise_hand")
	who.remove_from_inventory(item)
	who.animate_until_finished("lower_hand")
	who.emit_message("gave_item")
	
	self.wait_on_player(who, "gave_item")
	self.say("Thanks")
	self.approach($"../Red Box")
	self.say("I will put it here")
	self.call_function_from(self, "place_box", [item])
	self.animate_until_finished("lower_hand")
	self.emit_message("box_placed")
	
	who.wait_on_player(self, "box_placed")
	who.say("That's it, now you can check the code!")
	who.say("Thanks for being interested in our work")
	who.say("We are sure you will make awesome games!")


func place_box(box):
	# Function called after Cole raises the hand
	var red_box = $"../Red Box"
	box.transform.origin = red_box.transform.origin + Vector3(0, 2, 0)
	box.visible = true
	
	red_box.interactive = false
	
