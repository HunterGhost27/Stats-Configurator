# Extensive-Documentation

---

This document is a ***work-in-progress*** and will probably be that way for a while. I think I've covered the most important aspects of the mod that a user might need and will try to add to it as and when I muster the motivation.

- [Extensive-Documentation](#extensive-documentation)
  - [Osiris Data](#osiris-data)
  - [Stats-Configurator](#stats-configurator)
    - [Stats-Configurator Items](#stats-configurator-items)
    - [Applying Configurations](#applying-configurations)
    - [StatsLoader](#statsloader)
      - [StatLoader Settings](#statloader-settings)
      - [StatsLoader and Load-Order](#statsloader-and-load-order)
    - [Stat Persistence](#stat-persistence)
  - [Collections](#collections)
  - [Settings](#settings)
    - [Default Settings](#default-settings)
    - [Setting Details](#setting-details)
    - [Custom Settings](#custom-settings)
  - [Mod-Integration](#mod-integration)
  - [Diagnostics](#diagnostics)
    - [ConfigLog](#configlog)
    - [Inspect Skill](#inspect-skill)
    - [Export StatIDs for Reference](#export-statids-for-reference)
  - [Console-Commands](#console-commands)
  - [References](#references)

---

## Osiris Data

The [***script-extender***](https://github.com/Norbyte/ositools) _reads from_ and _writes_ files to the `Osiris Data` folder. All **config-files** and/or **exported data** for this mod will always be located in this folder. By default, the `Osiris Data` folder is in your game-document directory, i.e. something like `..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\`. This is also where your `PlayerProfiles` and `Mods` folders are located.

>**NOTE:** Throughout this document, `Osiris Data` will refer to the `..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\Osiris Data\` directory.

## Stats-Configurator

### Stats-Configurator Items

The _"Stats-Configurator"_ item is granted to the player (host-character) automatically as soon as they load into a game after activating this mod. The item is used to activate the _mod-menu dialog_. The mod-menu allows you access most of the functionality of this mod; like [loading and sharing configurations](#Applying-Configurations) or toggling certain [settings](#Settings). This is how most people will interact with the mod. All of these functions can also be called directly using the [console-commands](#Console-Commands).

Since most of these functions require the `server` context, only the **host-character** is allowed to interact with the item. Any attempts to use the item will redirect the dialog to the host-character.

Along with the titular item, the player is also provided with an in-game **changelog** whenever the mod updates. This is only meant to notify the player about significant changes and will not record every minor detail. It is **not** a substitute for the proper Changelogs. Players can safely discard this item if they wish, as it serves no other purpose. They can get another copy from the mod-menu should they need it again.

### Applying Configurations

Users create their configs in a `json` file separate from the ConfigData file. This file's configs can be loaded-in at any time by the host-character using the mod-menu's `Load Configuration` option. Users can safely test their configs before they rebuild their ConfigData file. Some stat-edits (like skills) are applied instantaneously and some (like characters) will require a save-and-reload cycle, but for the most part, you can load these configurations dynamically without ever exiting the game. These configurations are **not** saved persistently by _default_ (this can be changed in the [settings](#Custom-Settings)); meaning, they'll be lost after the session closes. Stat-overrides can be made persistent by rebuilding the ConfigData file after loading a configuration (recommended) or loading the configuration when `SyncStatPersistence` is enabled.

Stat-modifications from this file are loaded in the `server` context and are automatically synchronized to the clients afterwards. Clients connecting after this process may not have their stat synchronized to the server - you must reload the configuration if that is the case. You can also manually synchronize stats by using [console-commands](#Console-Commands).

Applying configurations this way is great for **prototyping** or making **temporary changes**. But otherwise, instead of re-applying configurations every session or making irreversible changes to your save-file (using `SyncStatPersistence`), you should export the configs to ConfigData. This will allow the StatsLoader(Read more below) to apply those edits automatically when the game loads.

### StatsLoader

The **StatsLoader** is responsible for loading **ConfigData** during `ModuleLoading`. Stat-modifications applied through the StatsLoader do not require additional synchronization as they are loaded just after the `StatsLoaded` event (but before `GameStart`) and on the client context. The only caveat here is that all clients **need** to have a local copy of the same ConfigData; otherwise, they will not have the same stats. The host-player can share their ConfigData file manually or _broadcast_ it in-game from the mod-menu. **Broadcasting** the configuration profile will send the host's ConfigData file to all _connected clients_ and save (/overwrite) it on their local system; however, all peer must then restart their game for the changes to apply. If the host wishes to check if their peers have the same ConfigData as them or not, they can **Verify Client Configs** to print out a response from the client's game to their debug-console. This way, the host can check if any peer is _out-of-sync_ (or is deliberately cheating :P).

 Preferably, all custom stat-modifications should be applied through the **StatsLoader**, while active-loading should only be used for prototyping and testing. All configurations made by mods are already stored in ConfigData. Users should also export their configs to if they wish them to apply automatically when the game loads. With the [default settings](#Default-Settings), stat-overrides will not be stored persistently in the save-file, i.e. you'll lose those changes and will have to re-load the configuration file every game-session. You can enable stat-synchronization persistence using the [settings](#Setting-Details) and console-commands, however, the recommended approach is to save your configs to the ConfigData file. This can easily be done using the **Rebuild ConfigData** option in the Mod-Menu.

#### StatLoader Settings

You can stop the StatsLoader from applying _any_ stat-modification through the [setting](#Custom-Settings):

```json
{
  "StatsLoader": {"Enable": false, "FileName": "S7_ConfigData.json"}
}
```

or by using the `ToggleStatsLoader` option in the Mod-Menu's setting page, or through console-commands (`!S7_Config ToggleStatsLoader`). This will completely disable the **StatsLoader**.

There can be only one **ConfigData** file but its name can be changed to whatever you like using the [settings](#Custom-Settings).

```json
{
  "StatsLoader": {"Enable": true, "FileName": "YOLO_ConfigData.json"}
}
```

This can be useful if you are playing with different groups and want to seperate the ConfigData files or keep a backup. The StatsLoader will load whichever `FileName` is specified in the settings.

#### StatsLoader and Load-Order

The StatsLoader loads config-data from mods in accordance to the load-order. i.e. stat-modifications from mods higher up in the load-order are loaded before mods at the bottom. Stat-edits that come from mods loaded late in the load-order override the previous stat-edits (if any). This information is crucial for conflict-resolution. If two mods edit the same stat, the mod that's placed lower in the load-order will win the conflict. This let's you exercise some degree of control over the outcome, but Ideally, modder should avoid conflicts if possible. Keep in mind that dependencies are always loaded before that mod, even if the dependency is technically lower in the load-order. Thus, any mod will always override their dependencies. I advise everyone to put this mod, **Stats-Configurator**, as low in their load order as they can. This mod will only hold config-data that's created by the user. As such, those changes are probably meant to be final. Putting this mod at the bottom will ensure that user-created configs always win.

### Stat Persistence

Stat-overrides can be saved persistently in the save-file so that those overrides are baked into the game-session. This will make sure those changes are always active for the server and the client. Norbyte did tell me this has hidden caveats but I forgot to ask for details.

By default, `SyncStatPersistence` is disabled. This essentially means that all configs must be reloaded every game session. StatsLoader can do this automatically for you.

## Collections

Trying to edit stats en-masse with the same values is both a redundant and time-consuming process. To solve this issue, stats can be grouped in a **collection** and configurations can be applied to all of them in-tandem. A collection is basically a list of stat-names/statIDs; whenever you apply stat-modifications to a collection, the modifications are applied to all stat-entries associated with the collection. For e.g.

```json
"COLLECTION Shield" {
  "Blocking": 15,
  "Physical": 25,
  "Piercing": 25
}
```

This config will give **all** shields 15% chance to block an attack along with 25% resistance to both Physical and Piercing Damage.

The mod comes with the following preset collections:
| CollectionName      | Comments                                                          | Example Stats                                                |
| ------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------ |
| PlayerCharacters    | A collection of all playable characters (origin and customs).     | Fane, Beast                                                  |
| NonPlayerCharacters | A collection of all non-playable characters.                      | Dallis, Gareth, Trader Bree                                  |
| Character           | A collection of stats of the `Character` type. Includes everyone. | Lohse, Malady                                                |
| Armor               | A collection of stats of the `Armor` type.                        | Generic and Unique Armors, Boots, Gloves                     |
| Weapon              | A collection of stats of the `Weapon` type.                       | Generic and Unique Swords, Bows, Wands                       |
| Shield              | A collection of stats of the `Shield` type.                       | Generic and Unique shields.                                  |
| Object              | A collection of stats of the `Object` type.                       | Miscellaneous Items like crafting-ingredients                |
| Crime               | A collection of stats of the `Crime` type.                        | _Don't know anything about Crime Stats_, sorry               |
| Potion              | A collection of stats of the `Potion` type.                       | Potion, Food and Status Effects. Not the items, the effects. |
| StatusData          | A collection of stats of the `StatusData` type.                   | Status effects like BURNING, HEALING, BLINDED                |
| SkillData           | A collection of stats of the `SkillData` type                     | Pretty much all skills.                                      |

To use this feature, you just need the keyName to be in the following format: `"COLLECTION <CollectionName>"`. Note: the whitespace is necessary.

Users can create and define their own collections using the settings.json.

## Settings

### Default Settings

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

These are the mod's **default** settings. The user can override these settings in `S7_ConfigSettings.json` in `Osiris Data`. Changes made in this file (`S7_ConfigSettings.json`) will take precedence over the default values when the mod loads. You can **Reapply Custom Settings** or **Reset To Default** from the stats-configurator **mod-menu**.

### Setting Details

Here's a quick summary of all the settings:

| Setting                                | Default Value        | Purpose                                                                                                                                                                  |
| -------------------------------------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ConfigFile`                           | `S7_Config.json`     | Name of the user-created configuration file. This is the file that users will write their configurations in.                                                             |
| `StatsLoader.Enable`                   | `true`               | StatsLoader is responsible for loading **ConfigData** during `ModuleLoading` event.                                                                                      |
| `StatsLoader.FileName`                 | `S7_ConfigData.json` | Name of the mod-created **ConfigData** file. This is the compiled configuration profile.                                                                                 |
| `ConfigLog.Enable`                     | `false`              | Enables logging to an external tsv file in `Osiris Data`. Useful for diagnostics and record-keeping. [Use with care](Documentation/Extensive-Documentation.md#ConfigLog) |
| `ConfigLog.FileName`                   | `S7_ConfigLog.tsv`   | Name of said tsv file.                                                                                                                                                   |
| `CreateStats`                          | `false`              | Enables stat-creation if `true`. Stat-creation only happens in the `server` context.                                                                                     |
| `SyncStatPersistence`                  | `false`              | Stat-edits will be saved **persistently** in the savefile if `true`.                                                                                                     |
| `BypassSafetyCheck`                    | `false`              | The mod prevents the modification of certain stats and keys. `BypassSafetyCheck` will allow unrestricted modification of these keys if `true`.                           |
| `ExportStatIDtoTSV.FileName`           | `S7_AllTheStats.tsv` | Name of the tsv file to which `StatID`s are exported.                                                                                                                    |
| `ExportStatIDtoTSV.RestrictStatTypeTo` | `""`                 | Export will be restricted to the specified stat-types.                                                                                                                   |
| `CustomCollections`                    | `{}`                 | Loads custom-collections created by the user.                                                                                                                            |

### Custom Settings

Custom Settings are applied from `S7_ConfigSettings.json` in `Osiris Data`. If that file doesn't exist, you can create one manually or **Export Current Settings** from the **mod-menu**. Custom settings are applied automatically when `ModuleLoadStarted` event triggers, but can be reapplied whenever the host-user wants, using the modmenu. Collections are automatically rebuilt everytime settings are refreshed. The mod-menu shows whether you're using the **default** settings or **custom** ones. Some simple settings can be toggled on-or-off from the mod-menu itself. They can also be toggled using [console-commands](Documentation/Extensive-Docuementation.md#Console-Commands). For settings that aren't just toggles, you'll need manual-editing in the `S7_ConfigSettings.json` file.

## Mod-Integration

## Diagnostics

### ConfigLog

Everything the mod prints to the _debug-console_, it can log to an _external tsv file_ aswell. This is extremely helpful if you are **diagnosing problems** or just trying to keep a **history** of the config-changes you've made. However, the file can get ridiculously large (and cause performance issues), thus it is `disabled` by default. I encourage you keep it disabled unless you absoulutely need it to diagnose a problem or keep a persistent-record of changes (especially if `SyncStatPersistence` is `true`). If you do this, I'd advise you to manually backup ConfigLogs somewhere else and empty the file or change its name every now-and-then. Keeping the file size small will prevent a lot of headache. You can toggle the logging functionality using the mod-menu, console-commands or custom-settings. You can also change the name of the tsv file using custom-settings.

### Inspect Skill

The **Inspect** skill is a special skill that the host-character can learn through the diagnostics menu. The skill does not cost any action-points or memory and you are completely free to use it whenever you chose. Targetting a character/Item by **Inspect** will print all the _active status-effects_ and _skills_ the target has to the debug-console. This is a quick and easy way to find out what the stat-names/statIDs of target's skills and statuses are. You can also target specific items, like armors and weapons to get their item-name/itemID aswell. When you are done with the skill you can "unlearn" it from the same menu. For a more comprehensive reference list, you can use the function described below.

### Export StatIDs for Reference

It may not always be possible to know the exact internal **stat-name/statID** of a stat, especially if you don't have access to **The Divinity Engine 2**. Even with the engine, opening the software just to check stat-names may not be the best use of your time. As such, a niche but useful function in the **diagnostics** section is `ExportStatToTSV`. This will save a `tsv` (tab-seperated-value) file in `Osiris Data` with **all** the stat-names along with their category. Unless new stats are created for your session (by adding new mods or if you create them), this list will not change much. So you can just export it once and keep it around for reference forever. You can restrict what type of stats are exported using the [settings](Documentation/Extensive-Documentation.md#Setting-Details) - the field `RestrictStatTypeTo` in `ExportStatToTSV` takes a string seperated by commas and spaces. For example, if you want to restrict the export to Armor and Weapons only, then `S7_ConfigSettings.json` will have the following block:

```json
{
  "ExportStatToTSV": {
    "FileName": "S7_AllTheStat.tsv",
    "RestrictStatTypeTo": "Armor, Weapon"
  }
}
```

Now, `S7_AllTheStat.tsv` will only have stat of the "Armor" and "Weapon" type.
Possible values for stat-types are: `Character`, `Armor`, `Weapon`, `Potion`, `SkillData`, `StatusData` and `Shield` etc. Leaving `RestrictStatTypeTo` empty will export everything.

If you just wish to know the stat-names for a certain **skill** or **status** a character/item has on them, then you can also use the [Inspect Skill](Documentation/Extensive-Documentation.md#Inspect-Skill). It will print out the relevant **stat-names** to the debug-console. This way you can quickly reference the stat-name/statID without having to export 7000+ stat entries.

You can also use the [console-command](Documentation/Extensive-Documentation.md#Console-Commands) `!S7_Config StatSearch YourSearchQueryHere OptionalTypeRestriction`. This will search any stats that have `YourSearchQueryHere` in their name. The optional argument `OptionalTypeRestriction` will restrict the search to that stat-type only - it can be omitted to search everything. e.g. `!S7_Config StatSearch Dallis` will search all stat-entries for the string `Dallis` and return any matches. To narrow down the search to her character we can use `!S7_Config StatSearch Dallis Character` will only search for the string `Dallis` in stat-entries of the `Character` type.

## Console-Commands

The mod comes with a suite of console-commands for a variety of purposes. Console-commands are inputted through the script-extender's debug-console window. Press enter while the debug-console is in focus to initiate the command-line. Here you can enter any Lua code and hit enter to run the code-chunk.

All console-commands from this mod are accessed by using the `!S7_Config` prefix. For example: `!S7_Config Help` will bring up a list of useful commands in the debug-console window.

| Command      | Argument 1   | Argument 2           | Comments                                              | Examples                                           |
| ------------ | ------------ | -------------------- | ----------------------------------------------------- | -------------------------------------------------- |
| Help         |              |                      | Prints a helpful list of commands.                    | `!S7_Config Help`                                  |
| StartModMenu |              |                      | Starts the Mod-Menu Dialog.                           | `!S7_Config StartModMenu`                          |
| AddSkill     | SkillID      | Character-Optional   | Adds skill (skillID) to character (character-key).    | `!S7_Config AddSkill Projectile_Fireball Host`     |
| RemoveSkill  | SkillID      | Character-Optional   | Removes skill (skillID) to character (character-key). | `!S7_Config RemoveSkill Shout_InspireStart`        |
| StatSearch   | SearchString | StatType-Optional    | Search for (SearchString) in category (StatType).     | `!S7_Config StatSearch Summon_Incarnate SkillData` |
| StatSync     | StatID       | Persistence-Optional | Synchronize (StatID) for all clients.                 | `!S7_Config StatSync Projectile_PyroclasticRock`   |
| Relay        | Signal       |                      | Relay to ModMenu. `!S7_Config Relay Help` for more.   | `!S7_Config Relay S7_BroadcastConfigData`          |

## References

If you want to know what the possible values can a certain attribute take, or just want to see what can be modified in the first place. If you're not a modder and are unfamiliar with the _divinity engine 2_ jargon, it can be hard to guess how to write the config-files. Therefore, the following reference sheets are provided for your convenience.

- [**StatObjectDefinitions**](../References/StatObjectDefinitions.md)
- [**Enumerations**](../References/Enumerations.md)

The data is taken straight from the game-engine files `StatObjectDefinitions.xml` and `Enumerations.xml`. Which is to say that all this is provided by Larian. The reference sheet may seem incomplete, so feel free to ask if you are still unsure about something.

---
