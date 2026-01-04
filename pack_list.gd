extends VBoxContainer

const button_scene: PackedScene = preload("res://pack_button.tscn")

func update():
	for i in get_children():
		i.queue_free()
	
	for i in JackboxManager.packNames:
		var button: Button = button_scene.instantiate()
		
		button.text = JackboxManager.packNames[i]
		button.pack = i
		
		add_child(button)

func _ready() -> void:
	update()
