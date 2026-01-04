# BoxOpener: Open-Source Megapicker
_This project is unaffiliated with Jackbox Games and is not supported nor endorsed by them._

BoxOpener is a reimplementation of a lot of the Jackbox Megapicker, rewritten to support games from alternate sources like Epic, as well as generally be lighter weight.

## Setup

In the `user://` folder (the app will open it on first launch), create files named `config.json` and `favorites.json`.

`favorites.json` can just contain `{}`.

Here is an example `config.json` for just owning Party Pack 7 on Steam, Party Pack 4 on Epic, and Drawful 2 on Epic.

```
{
    "dir": {
        "pp4": "C:\\Program Files\\Epic Games\\JackboxPartyPack4",
        "pp7": "C:\\Program Files (x86)\\Steam\\steamapps\\common\\The Jackbox Party Pack 7",
        "standalone": {
            "drawful2": "C:\\Program Files\\Epic Games\\Drawful2"
        }
    }
}
```

## Usage

The entry bar on the top is for searching all of the games. If you click a party pack, the view on the bottom will scroll to that pack's games.

To favorite a game, click the little circle next to its name. You can filter for just your favorites by clicking "All" next to the search button.

To launch a game, just click its name.

**NSFW Games are shown by default!** If you want to disable these from being picked with Random Game, click the button that says "Show NSFW."

## Editing

Just download the .zip file, extract it, and open it with Godot (4.5 or later)

## Pack -> ID Key

### Party Packs
pp1 -> Party Pack 1

pp2 -> Party Pack 2

pp3 -> Party Pack 3

pp4 -> Party Pack 4

pp5 -> Party Pack 5

pp6 -> Party Pack 6

pp7 -> Party Pack 7

pp8 -> Party Pack 8

pp9 -> Party Pack 9

pp10 -> Party Pack 10

pp11 -> Party Pack 11

np -> Naughty Pack

### Standalone Games
drawful2 -> Drawful 2

quiplash2standalone -> Quiplash 2

survey -> Survey Scramble

## Todo

- Support for Fibbage XL and Quiplash 1
- Support for the Party Starter
- Support for Mac and Linux (potentially)
