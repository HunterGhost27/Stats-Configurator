# **Stats Configurator**

## Divinity Original Sin 2: Definitive Edition

----------

The **Stats Configurator** allows you to modify and customize stats. It's a tool for users to make changes to stat-entries by creating config files. It also allows other mods to interface with its functionality to achieve the same. Through configuration files, you can change attributes like action-points cost, cooldown, gold-value, display-name, damage-values and resistances, memory cost, item-color and many more.

## Releases

* ***[Steam Workshop](#SteamWorkshop)***
* ***[Nexus](#NexusMods)***
* ***[Github](https://github.com/Shresht7/Stats-Configurator)***

## Requirements

* ***[Script-Extender](https://github.com/Norbyte/ositools)***

## Mod at a Glance

* **Edit stats dynamically.** _Modify_, _customize_ and _rebalance_ the game as you see fit. Change the damage value and damage type of weapons, AP and SP cost of skills, make Sir Lora immortal, give all shields blocking chance, create your own overhauls or just paint all your armor black! Sky is the limit.
* _Share_ your **config-data** with your **friends**.
* _Save_ your stat-overrides **persistently** in the save-file, or change them up each and every session.
* Can _interface_ with **other mods** and provide them the same configuration power. Create **MCMs** for your mods! Dependency-free integration allows **quick setup** of mod-config-menus for your mod with some basic functionality. **Lua** can be used for more _advanced control_.
* Hate fiddling with _menus_ and _UI_? Use **console commands!** - Add or Remove Skills, Search for stats, and more.
* The mod is **highly configurable**. :)

## Features

===============================

***[GO HERE FOR EXTENSIVE DOCUMENTATION](Documentation/Extensive-Documentation.md)***

===============================

### Configure to your heart's desire

Users can make their own stat-overrides by creating json files with the following template:

```json
{
    "StatName": {
        "AttributeName": "Value",
        "AttributeName": "Value",
    },
    "StatName": {
        "AttributeName": "Value"
    },
}
```

For example:

```json
{
    "Projectile_Fireball": {
        "ActionPoints": 4,
        "Cooldown": 7,
        "ExplodeRadius": 10,
        "DisplayName": "BOOMER"
    }
}
```

When we load this configuration in the game, it will override `Projectile_Fireball` (**Fireball**'s internal name). The **Fireball** skill will now cost ***4 ActionPoints***, have a ***7 turn Cooldown***, _explode_ in a ***10m radius*** and will be called ***BOOMER***.

Take a look at the [quick-tour](Documentation/QuickTour.md) and/or the [examples](Documentation/Examples.md) to get started. Read the [docs](Documentation/Extensive-Documentation.md) to see all that this mod has to offer.

### Easily share your config in multiplayer

All configuration-profiles, user-created or mod-created, are compiled into a single **ConfigData** file (default: `S7_ConfigData.json`). This file is read during `ModuleLoading` where it applies the _stat-modifications_. Since this operation takes place locally on the `client-side`, **all peers** _connected_ to the same game-session must have the same ConfigData file loaded. Having different ConfigData will mean that every client sees different stats. For stats to be _synchronized_ between all clients, it is recommended that everyone loads the same ConfigData file.

You can manually share this file with your friends or send it to them from the in-game Mod-Menu.

### Mod-Integration

While primarily created for end-users, the mod doesn't actually care where it gets the json config-file. This means other mods can send serialized json configs to the stats configurator for stat-overrides. This functionality exists because I wanted to create MCMs for my other mods but technically any mod-maker can use this if they wish. You can use this for more than just MCMs though, for example you could create logic for AP-Cost reduction with the number of attribute points in a skill like DOS1 and send the serialized json for configuration.

The mod also comes with a dynamic-quick-menu that can create basic MCMs for you! You need just register your mod with a `Global Flag` to listen for and create a `Database` with the stats that you want the MCM for. Done. Your mod now has a basic MCM. It'll launch whenever that flag is set.

For proper documentation, please visit [Mod-Integration](Documentation/Extensive-Documentation.md#Mod-Integration).

### Console-Commands

The mod comes with a suite of [console-commands](Documentation/Extensive-Documentation.md#Diagnostics) for you to use. Here are some examples:

* `!S7_Config AddSkill Projectile_Fireball` --- Adds Fireball skill to all clients.
* `!S7_Config RemoveSkill Projectile_Fireball Host` --- Removes Fireball from the host character.
* `!S7_Config SearchStat Dallis` --- Searches for all stats with `Dallis` in their name.
* `!S7_Config Help` --- For a detailed list of console commands.

### Settings

The mod-settings can allow you to fine tune your experience and provide greater control over the mod's functionality. You can export your settings as a json file and edit them externally, or create the file yourself (default: `S7_ConfigSettings.json`). This is what it looks like

```json
{
    "ConfigFile": "S7_Config.json",
    "StatsLoader": {"Enable": true, "FileName": "S7_ConfigData.json"},
    "ConfigLog": {"Enable": false, "FileName": "S7_ConfigLog.tsv"},
    "CreateStats": false,
    "SyncStatPersistence": false,
    "BypassSafetyCheck": false,
    "ExportStatIDtoTSV": {"FileName": "S7_AllTheStats.tsv", "RestrictStatTypeTo": ""},
    "CustomCollections": {}
}
```

A lot of these settings can be toggled on or off from the mod-menu or by using the [console-commands](Documentation/Extensive-Documentation.md#Console-Commands). For a detailed explanation, visit [Settings](Documentation/Extensive-Documentation.md#Settings).

----------

## My Other Mods

* ***[Scribe Scrolls and Skillbooks](https://steamcommunity.com/sharedfiles/filedetails/?id=2012742114)*** - Crafting recipes for copying scrolls and skillbooks.
* ***[Declutter Skill-Panel](https://steamcommunity.com/sharedfiles/filedetails/?id=2049313850)*** - Remove skills from your characters.
* ***[Channel Source](https://steamcommunity.com/sharedfiles/filedetails/?id=2028696492)*** - Regenerate source in and out of combat.

## Thanks and Credits

* **[Divinity: Original Sin 2](http://store.steampowered.com/app/435150/Divinity_Original_Sin_2/)**, a game by **[Larian Studios](http://larian.com/)**.
* **LaughingLeader** for the **[Source Control Generator](https://github.com/LaughingLeader/SourceControlGenerator)**.
* **Norbyte** for the **[Script-Extender](https://github.com/Norbyte/ositools)**.
