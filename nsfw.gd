extends Button

var previous_search: String = ""

var modes: Array[String] = [
	"NSFW: On",
	"NSFW: Off",
]

var current_mode: int = 0

func _ready() -> void:
	JackboxManager.searched.connect(func(query: String): previous_search = query)
	text = modes[current_mode]
	JackboxManager.settingsLoaded.connect(settings_changed)

func settings_changed():
	current_mode = int(JackboxManager.nsfw)
	JackboxManager.nsfwChanged.emit(current_mode == 1)
	JackboxManager.searched.emit(previous_search)
	#JackboxManager.save_settings()

func _process(_delta: float) -> void:
	text = modes[current_mode]

func _pressed() -> void:
	current_mode += 1
	current_mode = posmod(current_mode, len(modes))
	
	JackboxManager.nsfw = current_mode == 1
	JackboxManager.nsfwChanged.emit(current_mode == 1)
	JackboxManager.searched.emit(previous_search)
	JackboxManager.save_settings()
