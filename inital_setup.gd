extends HBoxContainer

const pack_entry_scene: PackedScene = preload("res://pack_entry.tscn")
var entry_container: VBoxContainer

func get_value_of_entry(entry: HBoxContainer):
	var dropdown: OptionButton = entry.get_node("MenuButton")
	
	return dropdown.get_item_id(dropdown.selected)

func add_pack():
	var entry: HBoxContainer = pack_entry_scene.instantiate()
	
	entry_container.add_child(entry)

func remove_pack():
	var last_child: int = entry_container.get_child_count() - 1
	
	if (last_child == -1): return
	
	entry_container.get_child(last_child).queue_free()

func check_for_dupes():
	var ids: Array[int] = []
	
	for i in entry_container.get_children():
		if get_value_of_entry(i) in ids: i.queue_free(); continue
		ids.append(get_value_of_entry(i))

func generate_json():
	var json: Dictionary
	
	for i in entry_container.get_children():
		if get_value_of_entry(i) > 1023:
			continue # let's handle standalones later
		
		var pack_id: String = JackboxManager.packNames.keys()[get_value_of_entry(i)]
		json[pack_id] = i.get_node("Path").text
	
	json["standalone"] = {}
	
	for i in entry_container.get_children():
		if get_value_of_entry(i) <= 1023:
			continue # let's handle standalones now
		
		var pack_id: String = JackboxManager.games["standalone"].keys()[get_value_of_entry(i) - 1024]
		json["standalone"][pack_id] = i.get_node("Path").text
	
	var encoded: String = JSON.stringify(json)
	
	var handler: FileAccess = FileAccess.open("user://config.json", FileAccess.WRITE)
	handler.store_string(encoded)
	handler.close()
	
	handler = FileAccess.open("user://favorites.json", FileAccess.WRITE)
	handler.store_string("[]")
	handler.close()
	
	get_tree().change_scene_to_file("res://main.tscn")
	JackboxManager._ready()

func _ready() -> void:
	entry_container = get_tree().current_scene.get_node("%EntryContainer")
	$AddPack.pressed.connect(add_pack)
	$RemovePack.pressed.connect(remove_pack)
	$DeleteDupes.pressed.connect(check_for_dupes)
	
	$Go.pressed.connect(generate_json)
