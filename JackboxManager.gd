extends Node

# todo:
# standalone games (drawful 2, quiplash 2, survey scramble)
# naughty pack
# party starter
# mac & linux support

var folders: Dictionary

const executables: Dictionary = {
		"pp1": "The Jackbox Party Pack.exe",
		"pp2": "The Jackbox Party Pack 2.exe",
		"pp3": "The Jackbox Party Pack 3.exe",
		"pp4": "The Jackbox Party Pack 4.exe",
		"pp5": "The Jackbox Party Pack 5.exe",
		"pp6": "The Jackbox Party Pack 6.exe",
		"pp7": "The Jackbox Party Pack 7.exe",
		"pp8": "The Jackbox Party Pack 8.exe",
		"pp9": "The Jackbox Party Pack 9.exe",
		"pp10": "The Jackbox Party Pack 10.exe",
		"pp11": "The Jackbox Party Pack 11.exe"
}

var os_mode: int = 0

@warning_ignore("unused_signal") # godot they are used elsewhere
signal searched(query: String)
@warning_ignore("unused_signal") # shut up
signal favoriteChanged(to: bool)

const games: Dictionary = {
	"pp1": {
		"ydkj": "YDKJ2015",
		"fibbagexl": "Fibbage",
		"lieswatter": "LieSwatterParty",
		"wordspud": "WordSpud",
		"drawful": "Drawful"
	},

	"pp2": {
		"fibbage2": "Fibbage2",
		"earwax": "Earwax",
		"bidiots": "Auction",
		"quiplash1": "Quiplash",
		"bomb": "BombInterns"
	},

	"pp3": {
		"quiplash2": "Quiplash2",
		"tmp": "TriviaDeath",
		"guess": "PollPosition",
		"fakinit": "FakinIt",
		"teeko": "AwShirt"
	},

	"pp4": {
		"fibbage3": "Fibbage3",
		"sti": "SurviveTheInternet",
		"msm": "MonsterMingle",
		"bracketeering": "Bracketeering",
		"civicdoodle": "Overdrawn"
	},

	"pp5": {
		"ydkjfs": "YDKJ2018",
		"split": "SplitTheRoom",
		"madverse": "RapBattle",
		"zeeple": "SlingShoot",
		"patently": "PatentlyStupid"
	},

	"pp6": {
		"tmp2": "TriviaDeath2",
		"role": "RoleModels",
		"jokeboat": "Jokeboat",
		"dictionary": "Ridictionary",
		"ptb": "PushTheButton"
	},

	"pp7": {
		"quip3": "Quiplash3",
		"devils": "Everyday",
		"champd": "WorldChampions",
		"talking": "JackboxTalks",
		"blather": "BlankyBlank"
	},

	"pp8": {
		"drawfulanimate": "DrawfulAnimate",
		"wheel": "TheWheel",
		"jobjob": "JobGame",
		"pollmine": "SurveyBomb",
		"wdrawn": "MurderDetectives"
	},

	"pp9": {
		"fibbage4": "Fibbage4",
		"roomerang": "MakeFriends",
		"junktopia": "AntiqueGame",
		"nonsensory": "RangeGame",
		"quixort": "Lineup"
	},

	"pp10": {
		"teeko2": "AwShirt2",
		"timejinx": "TimeTrivia",
		"fixytext": "RiskyText",
		"dodo": "NopusOpus",
		"hypnotorious": "Strangers"
	},

	"pp11": {
		"doominate": "YouRuinedIt",
		"hearsay": "MicGame",
		"cookie": "CookiesGame",
		"suspectives": "DirtyDetectives",
		"legends": "TriviaRPG"
	}
}

const names: Dictionary = {
	# pp1
	"ydkj": "You Don't Know Jack 2015",
	"fibbagexl": "Fibbage XL",
	"lieswatter": "Lie Swatter",
	"wordspud": "Word Spud",
	"drawful": "Drawful",

	# pp2
	"fibbage2": "Fibbage 2",
	"earwax": "Earwax",
	"bidiots": "Bidiots",
	"quiplash1": "Quiplash XL",
	"bomb": "Bomb Corp.",

	# pp3
	"quiplash2": "Quiplash 2",
	"tmp": "Trivia Murder Party",
	"guess": "Guesspionage",
	"fakinit": "Fakin' It",
	"teeko": "Tee K.O",

	# pp4
	"fibbage3": "Fibbage 3",
	"sti": "Survive the Internet",
	"msm": "Monster Seeking Monster",
	"bracketeering": "Bracketeering",
	"civicdoodle": "Civic Doodle",

	# pp5
	"ydkjfs": "You Don't Know Jack: Full Stream",
	"split": "Split The Room",
	"madverse": "Mad Verse City",
	"zeeple": "Zeeple Dome",
	"patently": "Patently Stupid",

	# pp6
	"tmp2": "Trivia Murder Party 2",
	"role": "Role Models",
	"jokeboat": "Joke Boat",
	"dictionary": "Dictionarium",
	"ptb": "Push The Button",

	# pp7
	"quip3": "Quiplash 3",
	"devils": "The Devils and the Details",
	"champd": "Champ'd Up",
	"talking": "Talking Points",
	"blather": "Blather 'Round",

	# pp8
	"drawfulanimate": "Drawful Animate",
	"wheel": "The Wheel of Enormous Proportions",
	"jobjob": "Job Job",
	"pollmine": "The Poll Mine",
	"wdrawn": "Weapons Drawn",

	# pp9
	"fibbage4": "Fibbage 4",
	"roomerang": "Roomerang",
	"junktopia": "Junktopia",
	"nonsensory": "Nonsensory",
	"quixort": "Quixort",

	# pp10
	"teeko2": "Tee K.O 2",
	"timejinx": "TimeJinx",
	"fixytext": "FixyText",
	"dodo": "Dodo Re Mi",
	"hypnotorious": "Hypnotorious",

	# pp11
	"doominate": "Doominate",
	"hearsay": "Hear Say",
	"cookie": "Cookie Haus",
	"suspectives": "Suspectives",
	"legends": "Legends of Trivia"
}

const packNames: Dictionary = {
	"pp1": "The Jackbox Party Pack",
	"pp2": "The Jackbox Party Pack 2",
	"pp3": "The Jackbox Party Pack 3",
	"pp4": "The Jackbox Party Pack 4",
	"pp5": "The Jackbox Party Pack 5",
	"pp6": "The Jackbox Party Pack 6",
	"pp7": "The Jackbox Party Pack 7",
	"pp8": "The Jackbox Party Pack 8",
	"pp9": "The Jackbox Party Pack 9",
	"pp10": "The Jackbox Party Pack 10",
	"pp11": "The Jackbox Party Pack 11"
}

var favorites: Array = [
	"quiplash3"
]

func _ready() -> void:
	var json: Dictionary = {}
	
	var file_opener: FileAccess = FileAccess.open("user://config.json", FileAccess.READ)
	
	json = JSON.parse_string(file_opener.get_as_text())
	
	file_opener.close()
	
	folders = json.get("dir", {})
	
	var loaded_array: Array
	
	file_opener = FileAccess.open("user://favorites.json", FileAccess.READ)
	
	loaded_array = JSON.parse_string(file_opener.get_as_text())
	
	file_opener.close()
	
	favorites = loaded_array.duplicate()

func launch_game(pack: String, game: String):
	OS.execute("CMD.exe", ["/C", "cd \"{0}\" && \"{1}\" -launchTo games\\{2}\\{2}.swf".format([folders[pack], executables[pack], game])])

func save_favorites():
	var file_opener: FileAccess = FileAccess.open("user://favorites.json", FileAccess.WRITE)
	
	file_opener.store_string(JSON.stringify(favorites))
	
	file_opener.close()
