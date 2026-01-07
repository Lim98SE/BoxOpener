extends HSeparator

var is_naughty: bool = false

func _ready() -> void:
	JackboxManager.searched.connect(search_updated)
	JackboxManager.favoriteChanged.connect(filter_changed)
	JackboxManager.nsfwChanged.connect(func(to): filter_nsfw = to)

var current_search: String = ""
var filter_fav: bool = false
var filter_nsfw: bool = false

func search_updated(to: String):
	current_search = to

func filter_changed(fav: bool):
	filter_fav = fav

func _process(delta: float) -> void:
	if len(current_search) != 0 or filter_fav or (is_naughty and filter_nsfw) or (JackboxManager.filter_max != 0) or (JackboxManager.filter_min != 0):
		hide()
	
	else:
		show()
