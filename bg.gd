extends Button

var modes: Array[String] = [
	"Background: Off",
	"Background: On",
]

var current_mode: int = 1

func _ready() -> void:
	JackboxManager.settingsLoaded.connect(settings_changed)

func settings_changed():
	current_mode = int(JackboxManager.change_bg)
	text = modes[current_mode]

func _process(_delta: float) -> void:
	text = modes[current_mode]

func _pressed() -> void:
	current_mode += 1
	current_mode = posmod(current_mode, 2)
	
	text = modes[current_mode]
	
	JackboxManager.change_bg = bool(current_mode)
	JackboxManager.save_settings()
