extends VBoxContainer

func _ready() -> void:
	var pack: String = JackboxManager.owned_games.keys()[0]
	var game_id: String = JackboxManager.owned_games[pack].keys()[0]
	
	JackboxManager.update_desc(pack, game_id)
