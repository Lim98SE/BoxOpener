# BoxOpener: Open-Source Megapicker
_This project is unaffiliated with Jackbox Games and is not supported nor endorsed by them._

BoxOpener is a reimplementation of a lot of the Jackbox Megapicker, rewritten to support games from alternate sources like Epic, as well as generally be lighter weight.

## Setup

In the `user://` folder (the app will open it on first launch), create files named `config.json` and `favorites.json`.

`favorites.json` can just contain `{}`.

Here is an example `config.json` for just owning Party Pack 7 on Steam, and Party Pack 4 on Epic.

```
{
    "dir": {
        "pp4": "C:\\Program Files\\Epic Games\\JackboxPartyPack4",
        "pp7": "C:\\Program Files (x86)\\Steam\\steamapps\\common\\The Jackbox Party Pack 7",
    }
}
```

## Usage

The entry bar on the top is for searching all of the games. If you click a party pack, the view on the bottom will scroll to that pack's games.

To favorite a game, click the little circle next to its name. You can filter for just your favorites by clicking "All" next to the search button.

To launch a game, just click its name.

## Editing

Just download the .zip file, extract it, and open it with Godot (4.5 or later)

## Todo

- Support for standalone games (Quiplash, Fibbage XL, Drawful 2, Quiplash 2, and the Survey Scramble)
- Support for the Naughty Pack
- Support for the Party Starter
- Support for Mac and Linux (potentially)
