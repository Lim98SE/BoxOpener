extends LineEdit

func _ready() -> void:
	text_changed.connect(JackboxManager.searched.emit)
