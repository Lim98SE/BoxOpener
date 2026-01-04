extends HSeparator

func _ready() -> void:
	JackboxManager.searched.connect(search_updated)
	JackboxManager.favoriteChanged.connect(filter_changed)

var current_search: String = ""
var filter_fav: bool = false

func search_updated(to: String):
	current_search = to

func filter_changed(fav: bool):
	filter_fav = fav

func _process(delta: float) -> void:
	if len(current_search) != 0 or filter_fav:
		hide()
	
	else:
		show()
