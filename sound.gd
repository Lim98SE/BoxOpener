extends Button

var modes: Array[String] = [
	"SFX: Off",
	"SFX: On",
]

var current_mode: int = 1

func _ready() -> void:
	JackboxManager.settingsLoaded.connect(settings_changed)

func settings_changed():
	current_mode = int(JackboxManager.sfx)

func _process(_delta: float) -> void:
	text = modes[current_mode]

func _pressed() -> void:
	current_mode += 1
	current_mode = posmod(current_mode, 2)
	
	text = modes[current_mode]
	
	JackboxManager.sfx = bool(current_mode)
	JackboxManager.save_settings()
