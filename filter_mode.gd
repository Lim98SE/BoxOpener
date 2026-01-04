extends Button

var previous_search: String = ""

var modes: Array[String] = [
	"All",
	"Favorites"
]

var current_mode: int = 0

func _ready() -> void:
	JackboxManager.searched.connect(func(query: String): previous_search = query)

func _pressed() -> void:
	current_mode += 1
	current_mode = posmod(current_mode, len(modes))
	text = modes[current_mode]
	
	JackboxManager.favoriteChanged.emit(current_mode == 1)
	JackboxManager.searched.emit(previous_search)
