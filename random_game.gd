extends Button

func _pressed() -> void:
	var potential: Array[Node] = get_tree().get_nodes_in_group("Game")
	
	var real: Array[HBoxContainer]
	
	for i in potential:
		if i.visible:
			real.append(i)
	
	var selected: HBoxContainer = real.pick_random()
	
	selected._pressed()
