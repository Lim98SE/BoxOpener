extends HBoxContainer

var pack: String
var game: String
var first: bool = false
var is_favorite: bool = false
var favorite_filter: bool = false

const not_fav_icon: Texture2D = preload("res://not_favorited.png")
const fav_icon: Texture2D = preload("res://favorited.png")

func _ready() -> void:
	JackboxManager.searched.connect(search_updated)
	JackboxManager.favoriteChanged.connect(func(to: bool): favorite_filter = to)
	
	$GameButton.pressed.connect(_pressed)
	$Favorite.pressed.connect(toggle_favorite)

func toggle_favorite():
	is_favorite = !is_favorite
	
	print(game, " ", is_favorite)
	
	if !is_favorite:
		JackboxManager.favorites.erase(game)
		JackboxManager.save_favorites()
	
	else:
		JackboxManager.favorites.append(game)
		JackboxManager.save_favorites()

func _pressed() -> void:
	JackboxManager.launch_game(pack, game)

var target_vis: bool = true:
	set(value):
		if value != visible:
			visible = value
		
		target_vis = value

func search_updated(to: String):
	if favorite_filter and not is_favorite:
		target_vis = false
		return
	
	if to == "":
		target_vis = true
		return
	
	target_vis = false
	
	for a in to.split(" ", false):
		for b in $GameButton.text.split(" ", false):
			if a.to_lower() in b.to_lower():
				target_vis = true
				return

func _process(delta: float) -> void:
	if game in JackboxManager.favorites:
		is_favorite = true
	
	if is_favorite:
		$Favorite.icon = fav_icon
	
	else:
		$Favorite.icon = not_fav_icon
