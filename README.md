# **Stats Configurator**

## Divinity Original Sin 2: Definitive Edition

----------

The **Stats Configurator** allows you to modify and customize stats. It's a tool for users to make stat-modifications by creating a _config file_.  Other mods can interface with its functionality to achieve the same. If you don't have the time and patience to use the divinity-engine 2 or just want to make quick-edits to stats without having to deal with the clunky stats-editor or unpack other people's mods, then this mod is for you. Through the configuration file, you can change attributes like _action-points cost, cooldown, gold-value, display-name, damage-values_ and _resistances, movement-range, memory cost, item-color, accuracy_ and _dodge, status-effects_ and **many more**.

## Releases

* ~~***[Steam Workshop](#SteamWorkshop)***~~
* ~~***[Nexus](#NexusMods)***~~
* ***[Github](https://github.com/Shresht7/Stats-Configurator)***

## Requirements

* ***[Norbyte's Script-Extender](https://github.com/Norbyte/ositools)***

## Mod at a Glance

* **Edit stats dynamically.** _Modify_, _customize_ and _rebalance_ the game as you see fit. Change the _damage value_ and _damage type_ of weapons, _AP_ and _SP cost_ of skills, make Sir Lora _immortal_, give all shields _blocking chance_, create your own _overhauls_ or just paint all your armor _black_! Sky is the limit.
* Easily _share_ your **config-data** with your **friends**.
* _Save_ your stat-overrides **persistently** in the save-file, or change them up each and every session.
* Can _interface_ with **other mods** and provide them the same configuration power. Create **MCMs** for your mods! or let this mod do it for you!
* Hate fiddling with _menus_? Use **console commands!** to navigate the mod instead. - _Add or Remove Skills, Search for stats,_ and more.
* The mod is **highly configurable**. :)

## Features

============================

***[READ THE EXTENSIVE DOCUMENTATION](Documentation/Extensive-Documentation.md)***

============================

### Configure to your heart's desire

Users can make their stat-overrides by creating json files. For example:

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

When this configuration is loaded in the game, it will override `Projectile_Fireball` (**Fireball**'s internal name). The **Fireball** skill will now cost ***4 ActionPoints***, have a ***7 turn Cooldown***, _explode_ in a ***10m radius*** and will be called ***BOOMER***.

![Fireball-Example](https://imgur.com/Vc3NkF8.png)

Take a look at the [quick-tour](Documentation/QuickTour.md) and/or the [examples](Documentation/Examples.md) to get started. Read the [documentation](Documentation/Extensive-Documentation.md) to see everything that this mod has to offer.

### Easily share your config in multiplayer

All configuration-profiles, _user-created_ or _mod-created_, are compiled into a single **ConfigData** file (default: `S7_ConfigData.json`). This file is read during `ModuleLoading` where it applies the _stat-modifications_. Since this operation takes place locally on the `client-side`, **all peers** _connected_ to the same _game-session_ must have the same ConfigData file loaded. Having different ConfigData will mean that each client sees different stats. For stats to be _synchronized_ between all clients, it is recommended that everyone loads the same ConfigData file. The host can manually share this file with their friends or send it to them from the in-game mod-menu.

### Mod-Interfacing

While primarily created for end-users, the mod doesn't actually care where it gets the config-file. This means other mods can send serialized jsons to the stats configurator for stat-overrides. This functionality exists because I wanted to create MCMs for my other mods, but any mod-maker can use this if they wish.

The mod comes with a dynamic-quick-menu that can create basic MCMs for you! You need just register your mod with a `global-flag` to listen for and create a `database` with the stats and attributes that you want the MCM to account for. Done. Your mod now has a basic MCM. It'll launch whenever that flag is set. It will allow the users to customize those stat-entries and store the configuration in their local ConfigData.

For proper documentation, please visit [mod-interfacing](Documentation/Extensive-Documentation.md#Mod-Interfacing).

### Console-Commands

The mod comes with a suite of [console-commands](Documentation/Extensive-Documentation.md#Console-Commands) for you to use. Console-commands give you access to everything this mod has to offer (that for one reason or another cannot be put in the mod-menu). Here are some examples:

* `!S7_Config AddSkill Projectile_Fireball` --- Adds Fireball skill to all clients.
* `!S7_Config RemoveSkill Projectile_Fireball Host` --- Removes Fireball from the host character.
* `!S7_Config SearchStat Dallis` --- Searches for all stats with `Dallis` in their name.
* `!S7_Config Help` --- For a detailed list of console commands.

### Settings

The [mod-settings](Documentation/Extensive-Documentation.md#Settings) can allow you to fine tune your experience and provide greater control over the mod's functionality. You can export your settings as a json file and edit them externally, or create the file yourself (default: `S7_ConfigSettings.json`). This is what it will look like

```json
{
    "ConfigFile": "S7_Config.json",
    "StatsLoader": {"Enable": true, "FileName": "S7_ConfigData.json"},
    "ConfigLog": {"Enable": false, "FileName": "S7_ConfigLog.tsv"},
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
* ***[Declutter Skill-Panel](https://steamcommunity.com/sharedfiles/filedetails/?id=2049313850)*** - Selectively remove skills from your characters.
* ***[Channel Source](https://steamcommunity.com/sharedfiles/filedetails/?id=2028696492)*** - Regenerate source in and out of combat.

## Thanks and Credits

* **[Divinity: Original Sin 2](http://store.steampowered.com/app/435150/Divinity_Original_Sin_2/)**, a game by **[Larian Studios](http://larian.com/)**.
* **LaughingLeader** for the **[Source Control Generator](https://github.com/LaughingLeader/SourceControlGenerator)**.
* **Norbyte** for the **[Script-Extender](https://github.com/Norbyte/ositools)**.
* **Sebastian Lenz** for the **[VSCode extension](https://marketplace.visualstudio.com/items?itemName=sebastian-lenz.divinity-vscode)**.
