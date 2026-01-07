extends HSlider

var label: Label
var real_value: int = 0
var previous_search: String = ""

@export_enum("max", "min") var mode: int

func _ready() -> void:
	label = get_parent().get_node("SliderLabel")
	label.text = str(int(real_value))
	
	value_changed.connect(val_change)
	
	JackboxManager.searched.connect(func(query: String): previous_search = query)
	
	if real_value == 0:
		label.text = "N/A"

func val_change(to: int):
	if to == 12:
		real_value = 100
	
	elif to == 11:
		real_value = 16
	
	else:
		real_value = to
	
	label.text = str(int(real_value))
	
	if to == 0:
		label.text = "N/A"
	
	if mode == 0:
		JackboxManager.filter_max = real_value
	
	else:
		JackboxManager.filter_min = real_value
	
	JackboxManager.searched.emit(previous_search)
