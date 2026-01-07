extends VBoxContainer

const button_scene: PackedScene = preload("res://game_button.tscn")
const seperator_scene: PackedScene = preload("res://seperator.tscn")

func update():
	for i in get_children():
		i.queue_free()
	
	var index: int = 0
	
	for pack in JackboxManager.owned_games.keys():
		index = 0
		for i in JackboxManager.owned_games[pack]:
			var button: HBoxContainer = button_scene.instantiate()
			
			button.pack = pack
			button.game = JackboxManager.owned_games[pack][i]
			button.get_node("GameButton").text = JackboxManager.names[i]
			button.first = index == 0
			
			add_child(button)
			
			index += 1
		
		if pack == JackboxManager.owned_games.keys()[-1]: break
		var sep: HSeparator = seperator_scene.instantiate()
		
		if pack == "np":
			sep.is_naughty = true
		
		add_child(sep)

func _ready() -> void:
	update()
