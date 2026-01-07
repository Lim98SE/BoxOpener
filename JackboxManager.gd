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
		"pp11": "The Jackbox Party Pack 11.exe",
		"np": "The Jackbox Naughty Pack.exe",
		
		"standalone": {
			"drawful2": "Drawful 2.exe",
			"survey": "The Jackbox Survey Scramble.exe",
			"quiplash2standalone": "Quiplash 2.exe"
		}
}

enum operating_systems {
	windows,
	mac,
	linux
}

var os_mode: operating_systems = operating_systems.windows

@warning_ignore("unused_signal") # godot they are used elsewhere
signal searched(query: String)
@warning_ignore("unused_signal") # shut up
signal favoriteChanged(to: bool)
@warning_ignore("unused_signal")
signal nsfwChanged(to: bool)
@warning_ignore("unused_signal")
signal settingsLoaded

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
	},
	
	"np": {
		"dirtydraw": "Drawful3",
		"fakinit2": "FakinIt2",
		"letmefinish": "CAPTCHA" # lmao
	},
	
	"standalone": {
		"drawful2": "drawful2",
		"survey": "survey",
		"quiplash2standalone": "quiplash2standalone"
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
	"legends": "Legends of Trivia",
	
	# naughty pack
	"dirtydraw": "Dirty Drawful",
	"fakinit2": "Fakin' It All Night Long",
	"letmefinish": "Let Me Finish",
	
	# standalones
	"drawful2": "Drawful 2",
	"survey": "The Jackbox Survey Scramble",
	"quiplash2standalone": "Quiplash 2"
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
	"pp11": "The Jackbox Party Pack 11",
	"np": "The Jackbox Naughty Pack",
	"standalone": "Standalone Games"
}

var favorites: Array = [
]

var images: Dictionary[String, Texture2D]
var bgs: Dictionary[String, Texture2D]

const metadata: Dictionary = {
  "ydkj": {
	"title": "You Don't Know Jack 2015",
	"desc": "YOU DON'T KNOW JACK 2015 is the very first Party Pack edition of your favorite game show, where high culture and pop culture collide!",
	"playerCount": [
	  1,
	  4
	]
  },
  "drawful": {
	"title": "Drawful",
	"desc": "Since 2014, players have attempted to draw absurd things like \"Napoleon riding a squirrel.\" As a result, a lot of hilariously bad art has been created. We're proud to say that this is one of our biggest contributions to society.",
	"playerCount": [
	  3,
	  8
	]
  },
  "wordspud": {
	"title": "Word Spud",
	"desc": "If you're reading about Word Spud, congratulations. You've officially become a hardcore Jackbox Games fan. Word Spud is the racy-as-you-want-to-be fill-in-the-blank word game.",
	"playerCount": [
	  2,
	  8
	]
  },
  "lieswatter": {
	"title": "Lie Swatter",
	"desc": "Lie Swatter is the perfect game to play if you need a good random fact to have in your back pocket for cocktail parties, or you just hate bugs.",
	"playerCount": [
	  1,
	  100
	]
  },
  "fibbagexl": {
	"title": "Fibbage XL",
	"desc": "In Fibbage XL, players are presented with an obscure trivia fact that's missing one key detail. The objective is to fill in the blank so that it fools others into thinking it's the truth.",
	"playerCount": [
	  2,
	  8
	]
  },
  "fibbage2": {
	"title": "Fibbage 2",
	"desc": "The fib-to-win trivia game returns. Players are presented with an obscure trivia fact that's missing one key detail. The objective is to fill in the blank so that it fools others into thinking it's the truth.",
	"playerCount": [
	  2,
	  8
	]
  },
  "earwax": {
	"title": "Earwax",
	"desc": "When you own a huge library of fart sound effects, you are morally obligated to build a game around it, so that's what we did with Earwax.",
	"playerCount": [
	  3,
	  8
	]
  },
  "bidiots": {
	"title": "Bidiots",
	"desc": "Going once... Going twice... SOLD to the player who might've just made a huge mistake! Put on your monocle as we explore this fine \"art\" auction game.",
	"playerCount": [
	  3,
	  6
	]
  },
  "bomb": {
	"title": "Bomb Corp",
	"desc": "You're an intern at the office doing intern-y things like getting coffee, stapling papers, and defusing bombs. Yes, you're keeping bombs from exploding. Did we mention its unpaid?",
	"playerCount": [
	  1,
	  4
	]
  },
  "quiplash1": {
	"title": "Quiplash",
	"desc": "Quiplash is the gut-busting battle of wits and wittiness! Just use your phone or tablet (no controllers needed) to answer simple prompts like these: \n\n- Something you'd be surprised to see a donkey do\n- A double rainbow doesn't have gold at the end of it. Instead, it has ______.\n- A better name for France",
	"playerCount": [
	  3,
	  8
	]
  },
  "fakinit": {
	"title": "Fakin' It",
	"desc": "In Fakin' It, you can FINALLY discover how bad your friends are at lying, without any relationship-ending arguments!",
	"playerCount": [
	  3,
	  6
	]
  },
  "teeko": {
	"title": "Tee K.O.",
	"desc": "In Tee K.O., players are on the clock to create drawings and write as many slogans as possible. The pictures and slogans are then given out at random. Whoever combines their drawings and slogans to create the best t-shirt wins, as designs are pitted against each other in head-to-head battles. The t-shirts with the highest votes in each round must survive the final gauntlet to become the best. Tee... K.O. Get it?",
	"playerCount": [
	  3,
	  8
	]
  },
  "quiplash2": {
	"title": "Quiplash 2",
	"desc": "Quiplash 2 picks up where its predecessor left off. Enjoy original prompts and twists on the classic formula. Just like in Quiplash, players answer a wide array of fun prompts. ",
	"playerCount": [
	  3,
	  8
	]
  },
  "tmp": {
	"title": "Trivia Murder Party",
	"desc": "Waaaaake Up! It's time to play Trivia Murder Party, a deadly quiz show where you match wits with a trivia-obsessed killer. Just stay alive and you'll be fine.",
	"playerCount": [
	  1,
	  8
	]
  },
  "guess": {
	"title": "Guesspionage",
	"desc": "Guesspionage tests your knowledge of the human condition. Players predict how real people responded to basic poll questions like \"What percentage of people have peed in a public pool?\"",
	"playerCount": [
	  2,
	  8
	]
  },
  "fibbage3": {
	"title": "Fibbage 3",
	"desc": "It was only a matter of time before we created a loungey 70s version of Fibbage... and that time was 2017 in The Jackbox Party Pack 4.",
	"playerCount": [
	  2,
	  8
	]
  },
  "sti": {
	"title": "Survive the Internet",
	"desc": "You're familiar with the \"Internet\" right? Imagine a game that takes place within the Jackbox Games version of the Internet. It's equally terrifying and rewarding.",
	"playerCount": [
	  3,
	  8
	]
  },
  "msm": {
	"title": "Monster Seeking Monster",
	"desc": "At the end of the day, we're all just monsters trying to find love. There's no better party game to live this truth than Monster Seeking Monster.",
	"playerCount": [
	  3,
	  7
	]
  },
  "bracketeering": {
	"title": "Bracketeering",
	"desc": "Bracketeering is the game of strong opinions about stupid things. Everything has stakes and everyone is allowed to weigh in and make a final ruling on the truly absurd.",
	"playerCount": [
	  3,
	  16
	]
  },
  "civicdoodle": {
	"title": "Civic Doodle",
	"desc": "The good people of Doodle Valley have enlisted you and your fellow players to beautify the town with ridiculous murals... We're not sure why they trust you.",
	"playerCount": [
	  3,
	  8
	]
  },
  "ydkjfs": {
	"title": "You Don't Know Jack: Full Stream",
	"desc": "The irreverent trivia classic returns, revamped and better than ever! Your favorite host, Cookie Masterson, returns with all-new twisted trivia questions.",
	"playerCount": [
	  1,
	  8
	]
  },
  "split": {
	"title": "Split the Room",
	"desc": "Imagine a world where there's a party game about creating hilarious and divisive hypothetical questions. Well, it exists already and it's called Split the Room.",
	"playerCount": [
	  3,
	  8
	]
  },
  "madverse": {
	"title": "Mad Verse City",
	"desc": "Giant robots have arrived from space and to set the city ablaze with dope rhymes. Who can channel their inner MC to win this robot rap battle?",
	"playerCount": [
	  3,
	  8
	]
  },
  "zeeple": {
	"title": "Zeeple Dome",
	"desc": "Welcome, Earthlings, to the ZEEPLE DOME! You are now honored contestants on the Bleecha Nebula's most celebrated (and incredibly violent) game show!!!",
	"playerCount": [
	  1,
	  6
	]
  },
  "patently": {
	"title": "Patently Stupid",
	"desc": "Is your head just bursting with inventive ideas?! Well, show off your creative genius with Patently Stupid, the game that will turn you into a modern Edison!",
	"playerCount": [
	  3,
	  8
	]
  },
  "tmp2": {
	"title": "Trivia Murder Party 2",
	"desc": "Still on the run from the police after the events of the first Trivia Murder Party, the serial killer host has moved into the Murder Hotel where he grew up. In the past his family killed unsuspecting guests at their hotel, but now the host is using the hotel to run his bizarre game show... where he kills unsuspecting guests.",
	"playerCount": [
	  1,
	  8
	]
  },
  "role": {
	"title": "Role Models",
	"desc": "Everybody's somebody, so who are you? The planner? The flake? The sassy one? Only your friends know the real you, and now they have the perfect excuse to tell you all about it.",
	"playerCount": [
	  3,
	  6
	]
  },
  "jokeboat": {
	"title": "Joke Boat",
	"desc": "Ahoy there, you must be the comedians. The cruise ship's talent show is tonight so grab your ventriloquist dummy and follow me! We've got some jokes to write! ",
	"playerCount": [
	  3,
	  8
	]
  },
  "dictionary": {
	"title": "Dictionarium",
	"desc": "Humans have been inventing words and phrases for centuries. Now it's your turn to contribute an entry to the pages of the Dictionarium.",
	"playerCount": [
	  3,
	  8
	]
  },
  "ptb": {
	"title": "Push the Button",
	"desc": "Your ship has been invaded by aliens who look just like your best friends! Find the imposters and eject them into space before the timer runs out or we're all doomed!",
	"playerCount": [
	  4,
	  10
	]
  },
  "talking": {
	"title": "Talking Points",
	"desc": "Public speaking is fun, actually. Players are given picture slides they've never seen and words they didn't write. Giving a speech has never been this weird or this funny.",
	"playerCount": [
	  3,
	  8
	]
  },
  "quip3": {
	"title": "Quiplash 3",
	"desc": "Players enter a head-to-head battle of wits by answering a comedic prompt and letting the other players (and the audience) decide which they like best!",
	"playerCount": [
	  3,
	  8
	]
  },
  "devils": {
	"title": "The Devils and the Details",
	"desc": "Congratulations, demons! You'll be moving to an average suburban neighborhood, where you'll take part in the pointless and highly stressful rituals of mortal life. ",
	"playerCount": [
	  3,
	  8
	]
  },
  "champd": {
	"title": "Champ'd Up",
	"desc": "Enter the Scrawliseum, where player-created characters fight over unusual titles. Heavy favorites are pitted against underdogs to create hilarious, high-octane matches. ",
	"playerCount": [
	  3,
	  8
	]
  },
  "blather": {
	"title": "Blather 'Round",
	"desc": "Blather 'Round is a guessing game full of blundering, stumbling, and- yes!- blathering. Describe pop culture items to your friends, but you'll never get quiiiiite the right words.",
	"playerCount": [
	  2,
	  6
	]
  },
  "jobjob": {
	"title": "Job Job",
	"desc": "Welcome to Job Job, a game where everybody interviews for a job! Funny and unique answers get votes, and the player with the most points in the end SCORES THE JOB (JOB)!",
	"playerCount": [
	  3,
	  10
	]
  },
  "drawfulanimate": {
	"title": "Drawful Animate",
	"desc": "It's alive! The classic guessing game makes an energetic return in Drawful: Animate, which has players drawing two-frame animations based on absurd prompts.",
	"playerCount": [
	  3,
	  10
	]
  },
  "wheel": {
	"title": "The Wheel of Enormous Proportions",
	"desc": "The Wheel of Enormous Proportions is a hybrid game of trivia and chance hosted by an immortal, all-knowing wheel from a mountaintop in the sky. ",
	"playerCount": [
	  2,
	  8
	]
  },
  "pollmine": {
	"title": "The Poll Mine",
	"desc": "A survey game of survival! Players divide into two teams, secretly answer survey questions, then try to guess the results. Can you open the correct doors and escape?!",
	"playerCount": [
	  2,
	  10
	]
  },
  "wdrawn": {
	"title": "Weapons Drawn",
	"desc": "THERE'S BEEN A MURDER! Several in fact... Weapons Drawn is a social deduction game where everyone did it. Commit one yourself before solving others.",
	"playerCount": [
	  4,
	  8
	]
  },
  "fibbage4": {
	"title": "Fibbage 4",
	"desc": "The hilarious bluffing party game returns with an all-new Final Fibbage, video questions, and a fresh game mode! It's a game so beloved that we decided to slap a 4 on it.",
	"playerCount": [
	  2,
	  8
	]
  },
  "roomerang": {
	"title": "Roomerang",
	"desc": "Channel your inner reality TV star in an attempt to come out on top! Respond to prompts, bring the competition and role-play to avoid being voted out.",
	"playerCount": [
	  4,
	  9
	]
  },
  "junktopia": {
	"title": "Junktopia",
	"desc": "A strange wizard has turned you into a frog! Create hilarious backstories for weird objects and then get them appraised. The player with the best items becomes human again!",
	"playerCount": [
	  3,
	  8
	]
  },
  "nonsensory": {
	"title": "Nonsensory",
	"desc": "Professor Nanners is here to test your NSP (Nonsensory Perception). How close can you get to guessing where another player's prompt ranks on the silliest of scales?",
	"playerCount": [
	  3,
	  8
	]
  },
  "quixort": {
	"title": "Quixort",
	"desc": "In this trivia sorting factory, work with your team to sort falling answers into their proper order before they hit the floor. It's as easy as A, C, B!",
	"playerCount": [
	  1,
	  10
	]
  },
  "teeko2": {
	"title": "Tee K.O. 2",
	"desc": "The fan-favorite fashion throw down returns! Create the ultimate garment out of your own weird drawings and slogans, then send it into battle. But with new drawing tools, new clothing options like hoodies and tank tops, and a new button-pounding final round... who will emerge as the next champion of Tee Shirt Island?",
	"playerCount": [
	  3,
	  8
	]
  },
  "dodo": {
	"title": "Dodo Re Mi",
	"desc": "Hello gorgeous nature.\n\nWelcome to an uncharted jungle, inhabited by musical birds who play songs for a carnivorous plant that MIGHT eat them, if they don't play their notes accurately. Are they dodos? No. Did they evolve from dodos? Maybe...don't overthink it. We didn't.",
	"playerCount": [
	  1,
	  9
	]
  },
  "fixytext": {
	"title": "FixyText",
	"desc": "Ever wished someone would answer your texts for you?\nImagined the masterful comebacks you and your friends would create if you mashed all your brains together? You're in luck! This game lets you play out that fantasy with all of the chaos, and none of the backlash!",
	"playerCount": [
	  3,
	  8
	]
  },
  "timejinx": {
	"title": "Timejinx",
	"desc": "What would you do if you had a time machine? Would you go back and try to fix some mistakes? Would you travel into the future to see who you've become? No, of course not! You'd use it to play an immersive trivia game!",
	"playerCount": [
	  1,
	  8
	]
  },
  "hypnotorious": {
	"title": "Hypnotorious",
	"desc": "HYPNOSIS, TEAMWORK AND HIDDEN IDENTITIES!!!\n\nIn Hypnotorious, players are attending a hypnotist's show, where, as you might expect, they get hypnotized. Each player will take on a new, unique identity such as Frankenstein, a snowman or a carrot. They will then be asked to answer questions as their character would. ",
	"playerCount": [
	  4,
	  8
	]
  },
  "fakinit2": {
	"title": "Fakin' It All Night Long",
	"desc": "Fakin' It returns and this time we're putting it all out there. Everyone gets a secret task except the Faker, who tries to blend in. Find out which of your friends is the best liar...",
	"playerCount": [
	  3,
	  8
	]
  },
  "dirtydraw": {
	"title": "Dirty Drawful",
	"desc": "It's Drawful, but dirty... It's Dirty Drawful. We've taken the Drawful that you love and added spicy prompts to ensure your drawings are both terrible and titillating. ",
	"playerCount": [
	  3,
	  8
	]
  },
  "letmefinish": {
	"title": "Let Me Finish",
	"desc": "Let Me Finish is Jackbox's new presentation game that examines life's serious questions like, \"Where is the mailbox's butt?\" or \"How does this avocado get aroused?\" Everyone gets a chance to speak their mind but will others pick up what you're putting down? ",
	"playerCount": [
	  3,
	  8
	]
  },
  "quiplash2standalone": {
	"title": "Quiplash 2 InterLASHional",
	"desc": "The \"say anything\" party game is going international! All the hilarious content from Quiplash 2, now in French, Italian, German, and Spanish! With 100 NEW prompts in each language! (And you can still play in boring old English.) Get this QUINTILINGUAL Quiplash now, and take your next party global!",
	"playerCount": [
	  3,
	  8
	]
  },
  "drawful2": {
	"title": "Drawful 2",
	"desc": "Drawful is back to save your next party with Drawful 2, which challenges players to draw ridiculous prompts on their smartphones and tablets.",
	"playerCount": [
	  3,
	  8
	]
  },
  "survey": {
	"title": "The Jackbox Survey Scramble",
	"desc": "Jackbox has made an all-new party experience! Taking real surveys from real people around the globe, The Jackbox Survey Scramble is constantly changing based on answers submitted from players, including you!",
	"playerCount": [
	  2,
	  10
	]
  },
  "doominate": {
	"title": "Doominate",
	"desc": "Take all that is perfectly lovely and destroy it in a head-to-head joke game where the funniest answer is exalted.",
	"playerCount": [
	  3,
	  8
	]
  },
  "legends": {
	"title": "Legends of Trivia",
	"desc": "Are you looking for a fantasy trivia game with RPG-inspired elements? Oh boy, do I have some good news for you!",
	"playerCount": [
	  1,
	  6
	]
  },
  "hearsay": {
	"title": "Hear Say",
	"desc": "In Hear Say, you'll be putting your pipes to work to create hilarious soundscapes. Use your phone as a controller, just like all Jackbox party pack games. But in this one, you get to use the microphone on your phone to get real sound effects that work in the game!",
	"playerCount": [
	  2,
	  8
	]
  },
  "cookie": {
	"title": "Cookie Haus",
	"desc": "Welcome to Cookie Haus! You've been hired as a cookie decorator for a bakery with an odd sort of clientele. Your job is to decorate cookies to their specifications... better than your fellow employees. ",
	"playerCount": [
	  3,
	  8
	]
  },
  "suspectives": {
	"title": "Suspectives",
	"desc": "There's been a crime, one player secretly did it, and the evidence comes from your own survey answers! Study the clues, defend your innocence (even if you're lying), and put your friends on trial.",
	"playerCount": [
	  4,
	  8
	]
  }
}

var filter_min: int = 0
var filter_max: int = 0

var sfx: bool = true
var change_bg: bool = true
var nsfw: bool = false

var owned_games: Dictionary = {}

func save_settings():
	var json: Dictionary = {
		"sfx": sfx,
		"bg": change_bg,
		"nsfw": nsfw
	}
	
	var fileAccess: FileAccess = FileAccess.open("user://settings.json", FileAccess.WRITE)
	
	fileAccess.store_string(JSON.stringify(json))
	
	fileAccess.close()
	
	settingsLoaded.emit()

func update_desc(pack: String, game_id: String):
	if not get_tree().current_scene: return
	
	var logo: TextureRect = get_tree().current_scene.get_node("%GameLogo")
	var bg: TextureRect = get_tree().current_scene.get_node("%GameBackground")
	var full_bg: TextureRect = get_tree().current_scene.get_node("%FullWindowBackground")
	var desc: Label = get_tree().current_scene.get_node("%GameDescription")
	var minc: Label = get_tree().current_scene.get_node("%MinCount")
	var maxc: Label = get_tree().current_scene.get_node("%MaxCount")
	var packLabel: Label = get_tree().current_scene.get_node("%Pack")
	
	var my_metadata: Dictionary = JackboxManager.metadata[game_id]
	var my_pack: String = JackboxManager.packNames[pack].replace("The Jackbox", "").replace("Party", "")
	
	if my_pack == "Standalone Games":
		my_pack = "Standalone"
	
	if my_pack == "Pack":
		my_pack = "Pack 1"
	
	#print("res://gameLogos/%s.png" % game_id)
	
	logo.texture = images[game_id]
	bg.texture = bgs[game_id]
	full_bg.texture = bgs[game_id]
	desc.text = my_metadata["desc"]
	minc.text = "Min: %s Players" % my_metadata["playerCount"][0]
	maxc.text = "Max: %s Players" % my_metadata["playerCount"][1]
	packLabel.text = my_pack

func _ready() -> void:
	var version_string: String = ProjectSettings.get_setting("application/config/version")
	
	get_window().title = "BoxOpener " + version_string
	
	var json: Dictionary = {}
	
	var file_opener: FileAccess = FileAccess.open("user://config.json", FileAccess.READ)
	
	if FileAccess.get_open_error():
		OS.alert("Please create config.json in your user folder.", "Error!")
		OS.shell_open(ProjectSettings.globalize_path("user://"))
		get_tree().quit()
		return
	
	json = JSON.parse_string(file_opener.get_as_text())
	
	file_opener.close()
	
	folders = json.get("dir", {})
	
	var loaded_array: Array
	
	file_opener = FileAccess.open("user://favorites.json", FileAccess.READ)
	
	if FileAccess.get_open_error():
		OS.alert("Please create config.json in your user folder.", "Error!")
		OS.shell_open(ProjectSettings.globalize_path("user://"))
		get_tree().quit()
		return
	
	loaded_array = JSON.parse_string(file_opener.get_as_text())
	
	file_opener.close()
	
	favorites = loaded_array.duplicate()
	
	for i in folders.keys():
		if i == "standalone": continue
		owned_games[i] = games[i].duplicate()
	
	if "standalone" in folders.keys():
		for i in folders["standalone"]:
			if "standalone" in owned_games.keys():
				owned_games["standalone"][i] = games["standalone"][i]
			
			else:
				owned_games["standalone"] = {}
				owned_games["standalone"][i] = games["standalone"][i]
	
	if OS.has_feature("windows"): os_mode = operating_systems.windows
	elif OS.has_feature("macos"): os_mode = operating_systems.mac
	elif OS.has_feature("linux"): os_mode = operating_systems.linux
	
	var all_owned_keys: Array[String]
	
	for i in owned_games.keys():
		for item in owned_games[i]:
			all_owned_keys.append(item)
	
	for i in all_owned_keys:
		#print("loading %s" % i)
		
		images[i] = ResourceLoader.load("res://gameLogos/%s.png" % i)
		bgs[i] = ResourceLoader.load("res://gameBgs/%s.jpg" % i)
	
	file_opener = FileAccess.open("user://settings.json", FileAccess.READ)
	
	if FileAccess.get_open_error():
		sfx = true
		change_bg = true
		nsfw = false
		save_settings()
		return
	
	json = JSON.parse_string(file_opener.get_as_text())
	
	sfx = json.get("sfx", true)
	change_bg = json.get("bg", true)
	nsfw = json.get("nsfw", false)
	
	file_opener.close()
	
	settingsLoaded.emit()

var frames: int = 0

func launch_windows(pack: String, game: String):
	if pack == "standalone":
		print(executables["standalone"], " ", game)
		print(" ".join(["/C", "cd \"%s\" && \"%s\"" % [folders[pack][game], executables["standalone"][game]]]))
		OS.execute("CMD.exe", ["/C", "cd \"%s\" && \"%s\"" % [folders[pack][game], executables["standalone"][game]]])
		return
		
	OS.execute("CMD.exe", ["/C", "cd \"{0}\" && \"{1}\" -launchTo games\\{2}\\{2}.swf".format([folders[pack], executables[pack], game])])

func launch_linux(pack: String, game: String):
	if pack == "standalone":
		#print(executables["standalone"], " ", game)
		#print(" ".join(["/C", "cd \"%s\" && \"%s\"" % [folders[pack][game], executables["standalone"][game]]]))
		OS.execute("/usr/bin/env sh", ["-s", '"cd \"%s\" && \"%s\""' % [folders[pack][game], executables["standalone"][game]]])
		return
		
	OS.execute("/usr/bin/env sh", ["-s", '"cd \"{0}\" && \"{1}\" -launchTo games\\{2}\\{2}.swf"'.format([folders[pack], executables[pack], game])])

func launch_game(pack: String, game: String):
	launch_windows(pack, game)
	#match os_mode:
		#operating_systems.windows: launch_windows(pack, game)
		#operating_systems.linux: launch_linux(pack, game)
		#operating_systems.mac: launch_linux(pack, game)
	
func save_favorites():
	var file_opener: FileAccess = FileAccess.open("user://favorites.json", FileAccess.WRITE)
	
	file_opener.store_string(JSON.stringify(favorites))
	
	file_opener.close()

func _process(_delta: float) -> void:
	if frames == 10:
		settingsLoaded.emit()
	
	frames += 1
