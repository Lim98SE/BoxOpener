import json

with open("descriptions_raw.json", "rb") as file:
    data = json.load(file)

out = {}

for i in data:
    formatted = {
        "title": i["title"],
        "desc": i["description"]["en"],
        "playerCount": [
            i["minPlayerCount"],
            i["maxPlayerCount"]
        ]
    }

    out[i["id"]] = formatted

with open("descriptions.json", "w") as file:
    json.dump(out, file)