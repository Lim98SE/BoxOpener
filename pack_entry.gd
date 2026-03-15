extends HBoxContainer

func _ready() -> void:
	for i in JackboxManager.packNames:
		if i == "standalone": continue
		var pack_name: String = JackboxManager.packNames[i]
		var pack_id: int = JackboxManager.packNames.keys().find(i)
		$MenuButton.add_item(pack_name, pack_id)
	
	for i in JackboxManager.games["standalone"]:
		var game_name: String = JackboxManager.names[i]
		var standalone_id: int = JackboxManager.games["standalone"].keys().find(i) + 1024
		$MenuButton.add_item(game_name, standalone_id)
	
	$MenuButton.select(0)
