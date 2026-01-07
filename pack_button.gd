extends Button

var pack: String
var packContainer: ScrollContainer

func mouse_enter():
	if JackboxManager.sfx:
		$Scroll.play()

func _ready() -> void:
	packContainer = get_tree().current_scene.get_node("%GameContainer")
	mouse_entered.connect(mouse_enter)

func _pressed() -> void:
	var buttons: Array[Node] = get_tree().get_nodes_in_group("Game")
	
	for button in buttons:
		if button.pack == pack and button.first:
			button.grab_focus()
			packContainer.set_deferred("scroll_vertical", button.position.y)
