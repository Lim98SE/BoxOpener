extends VBoxContainer

const button_scene: PackedScene = preload("res://game_button.tscn")
const seperator_scene: PackedScene = preload("res://seperator.tscn")

func update():
	for i in get_children():
		i.queue_free()
	
	var index: int = 0
	
	for pack in JackboxManager.games.keys():
		index = 0
		for i in JackboxManager.games[pack]:
			var button: HBoxContainer = button_scene.instantiate()
			
			button.pack = pack
			button.game = JackboxManager.games[pack][i]
			button.get_node("GameButton").text = JackboxManager.names[i]
			button.first = index == 0
			
			add_child(button)
			
			index += 1
		
		if pack == JackboxManager.games.keys()[-1]: break
		var sep: HSeparator = seperator_scene.instantiate()
		add_child(sep)

func _ready() -> void:
	update()
