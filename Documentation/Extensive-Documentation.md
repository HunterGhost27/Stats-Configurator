# Extensive-Documentation

---

This document is a work-in-progress!

- [Extensive-Documentation](#extensive-documentation)
  - [Osiris Data](#osiris-data)
  - [Debug Console](#debug-console)
    - [Config File and ConfigData File](#config-file-and-configdata-file)
  - [Host and Client Contexts](#host-and-client-contexts)
  - [Stats-Configurator](#stats-configurator)
    - [Stats-Configurator Items](#stats-configurator-items)
    - [Stats-Configurator Mod-Menu](#stats-configurator-mod-menu)
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
  - [Mod-Interfacing](#mod-interfacing)
    - [Quick-Menu](#quick-menu)
  - [Diagnostics](#diagnostics)
    - [ConfigLog](#configlog)
    - [Inspect Skill](#inspect-skill)
    - [Export StatIDs for Reference](#export-statids-for-reference)
  - [Console-Commands](#console-commands)
  - [References](#references)

---

## Osiris Data

The [***script-extender***](https://github.com/Norbyte/ositools) _reads from_ and _writes_ files to the `Osiris Data` folder. All **config-files** and/or **exported data** for this mod will always be in this location. By default, the `Osiris Data` folder is in your game-document directory, i.e. something like `..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\`. For reference, this is also where your `PlayerProfiles` and `Mods` folders are located.

> **NOTE:** Throughout this document, `Osiris Data` will refer to the `..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\Osiris Data\` directory.

## Debug Console

The mod uses the script-extender's _debug-console_ to display a lot of useful information. The console is also used to input [console-commands](#console-commands).
The _debug-console_ can be enabled by setting `CreateConsole` to `true` in `OsirisExtenderSettings.json`.
Alternatively, if you use LaughingLeader's Mod-Manager, you can go to `Settings>Preferences>Script-Extender` and `Enable Console Window`. Then `Export Settings`.

### Config File and ConfigData File

**Config-File** and **ConfigData File** refer to two separate files. **Config-File** (default: `S7_Config.json`) is what users write their configurations in. This file is used to apply configurations from the mod-menu. The **ConfigData File** (default: `S7_ConfigData.json`) on the other hand is compiled from all available configuration data, _user-created_ or _mod-created_. The **ConfigData** file is not meant to be directly edited by the user, it is used to store data in a more consolidated format and read automatically during `ModuleLoading` event if [**StatsLoader**](#statsloader) is `enabled`.

This document will always refer to the **ConfigFile** unless explicitly stated otherwise. loading configuration, configs or configuration-profile all refer to the **ConfigFile**. Basically, if the documentation asks for manual-intervention, it means the **ConfigFile**. Anything else is probably automatically handled by the mod in **ConfigData**.

## Host and Client Contexts

Each game session has two contexts - the `server` and the `client`. There are significant differences between the two and they are completely isolated from one-another. Due to these differences not all functionality is available to both contexts. You can read more about this [here](https://github.com/Norbyte/ositools/blob/master/LuaAPIDocs.md#client--server-states).

The document will refer to the player that creates the `server` context as the `host` and their controlled-character as `host-character`, and all other peers are refered to as `clients`.

## Stats-Configurator

### Stats-Configurator Items

![stats-configurator-item](https://imgur.com/BagN95a.png)

The _"Stats-Configurator"_ item is granted to the player ([host-character](#host-and-client-contexts)) automatically as soon as they load into a game after activating this mod. The item is used to activate the _mod-menu dialog_. If you lose the item somehow, you can reacquire it using the `!S7_Config AddConfigurator` [console-command](#console-commands).

### Stats-Configurator Mod-Menu

![ModMenu](https://imgur.com/sADorrm.png)

The **mod-menu** allows you access most of the functionality of this mod; like [loading and sharing configurations](#Applying-Configurations) or changing [settings](#Settings) etc. This is how most people will interact with the mod. All of these functions can also be called directly using the [console-commands](#Console-Commands).

Since most of these functions require the `server` context, only the [**host-character**](#host-and-client-contexts) is allowed to interact with the item. Any attempts, by the clients to use the item will redirect the dialog to the host-character.

Along with the titular item, the player is also provided with an in-game **changelog** whenever the mod updates. This is only meant to notify the player about significant changes and will not record every minor detail. It is **not** a substitute for the proper [changelogs](../CHANGELOG.md). Players can safely discard this item if they wish, as it serves no other purpose. They can get another copy from the mod-menu should they need to read it again.

### Applying Configurations

Users create their configs in a `json` file. This file's configs can be loaded-in at any time by the [host-character](#host-and-client-contexts) using the mod-menu's `Load Configuration` option. Users can safely test their configs before they rebuild their [**ConfigData**](#config-file-and-configdata-file) file. Some stat-edits (like skills) are applied instantaneously and some (like characters) will require a _save-and-reload_, but for the most part, you can load these configurations dynamically without ever exiting the game. These configurations are **not** saved persistently by _default_ (this can be changed in the [settings](#Custom-Settings)); meaning, they'll be lost after the session closes. Stat-overrides can be made persistent by rebuilding the ConfigData file after loading a configuration (**recommended**) or loading the configuration when `SyncStatPersistence` is `enabled`.

Stat-modifications from this file are loaded in the `server` context and are automatically synchronized to the clients afterwards. Clients connecting after this process may not have their stat synchronized to the server - you must reload the configuration if that is the case. You can also manually synchronize stats by using [console-commands](#Console-Commands). Edited stats remain in memory until the game is closed, allowing you to synchronize all of them at will, should a client join after loading a configuration.

Applying configurations this way is great for **prototyping** or making **temporary changes**. But otherwise, instead of re-applying configurations every session or making irreversible changes to your save-file (using `SyncStatPersistence`), you should export the configs to **ConfigData**. This will allow the StatsLoader(Read more below) to apply those edits automatically when the game loads.

### StatsLoader

The **StatsLoader** is responsible for loading **ConfigData** during the `ModuleLoading` event. Stat-modifications applied through the StatsLoader do not require additional synchronization as they are loaded just after the `StatsLoaded` event (but before `GameStart`) and on the client context. The only caveat here is that all clients **need** to have a local copy of the same ConfigData; otherwise, they will not have the same stats. The host-player can share their ConfigData file manually or _broadcast_ it in-game from the mod-menu. **Broadcasting** the configuration profile will send the host's ConfigData file to all _connected clients_ and save (/overwrite) it on their local system; however, all peer must then restart their game for the changes to apply. If the host wishes to check if their peers have the same ConfigData as them or not, they can **Verify Client Configs** to print out a response from the client's game to their debug-console. This way, the host can check if any peer is _out-of-sync_ (or is deliberately cheating :P).

 Preferably, all custom stat-modifications should be applied through the **StatsLoader**, while active-loading should only be used for prototyping and testing. All configurations made by mods are already stored in ConfigData. Users should also export their configs to if they wish them to apply automatically when the game loads. With the [default settings](#Default-Settings), stat-overrides will not be stored persistently in the save-file, i.e. you'll lose those changes and will have to re-load the configuration file every game-session. You can enable stat-synchronization persistence using the [settings](#Setting-Details) and console-commands, however, the recommended approach is to save your configs to the ConfigData file. This can easily be done using the **Rebuild ConfigData** option in the Mod-Menu.

#### StatLoader Settings

You can stop the StatsLoader from applying _any_ stat-modification through the [setting](#Custom-Settings):

```json
{
  "StatsLoader": {"Enable": false, "FileName": "S7_ConfigData.json"}
}
```

or by using the `ToggleStatsLoader` option in the Mod-Menu's setting page, or through console-commands (`!S7_Config ToggleStatsLoader`). Setting this to `false` will completely disable the **StatsLoader**.

There can be only one **ConfigData** file but its name can be changed to whatever you like using the [settings](#Custom-Settings).

```json
{
  "StatsLoader": {"Enable": true, "FileName": "YOLO_ConfigData.json"}
}
```

This can be useful if you are playing with different groups and want to seperate the ConfigData files or keep a backup. The StatsLoader will load whichever `FileName` is specified in the settings.

#### StatsLoader and Load-Order

The StatsLoader loads config-data from mods in accordance to the load-order. i.e. stat-modifications from mods higher up in the load-order are loaded before mods at the bottom. Stat-edits that come from mods loaded late in the load-order override the previous stat-edits (if any). This information is crucial for conflict-resolution. If two mods edit the same stat, the mod that's placed lower in the load-order will win the conflict. This let's you exercise some degree of control over the outcome, but Ideally, modder should avoid conflicts if possible. Keep in mind that dependencies are always loaded before that mod, even if the dependency is technically lower in the load-order. Thus, any mod will always override their dependencies. I advise everyone to put this mod, **Stats-Configurator**, as low in their load order as they can. This mod will only hold config-data that's created by the user. As such, those changes are probably meant to be final. Putting this mod at the bottom will ensure that user-created configs always win the conflict.

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
| CollectionName       | Comments                                                                                                 |
| -------------------- | -------------------------------------------------------------------------------------------------------- |
| **Characters**       |                                                                                                          |
| Character            | A collection of stats of the `Character` type. Includes everyone. e.g. Lohse, Malady, Trompdoy etc.      |
| PlayerCharacters     | A collection of all playable characters (origin and customs). e.g. Fane, Beast etc.                      |
| NonPlayerCharacters  | A collection of all non-playable characters. e.g. Dallis, Gareth, Trader Bree etc.                       |
| **Armor**            |                                                                                                          |
| Armor                | A collection of stats of the `Armor` type. Generic and Unique Armors, Boots, Gloves etc.                 |
| ArmorTypeCloth       | A collection of stats of the `ArmorCloth` type. e.g. Noble clothing, crafted clothes etc.                |
| ArmorTypeRobes       | A collection of stats of the `ArmorRobes` type. Int-based Armors etc.                                    |
| ArmorTypeLeather     | A collection of stats of the `ArmorLeather` type. Fin-based Armors etc.                                  |
| ArmorTypeMail        | A collection of stats of the `ArmorMail` type. Str-based Armors etc.                                     |
| ArmorTypePlate       | A collection of stats of the `ArmorPlate` type. Str-based Armors etc.                                    |
| ArmorSlotHelmet      | A collection of stats that occupy the `Helmet` slot.                                                     |
| ArmorSlotBreast      | A collection of stats that occupy the `Breast` slot.                                                     |
| ArmorSlotLeggings    | A collection of stats that occupy the `Leggings` slot.                                                   |
| ArmorSlotWeapon      | A collection of stats that occupy the `Weapon` slot.                                                     |
| ArmorSlotShield      | A collection of stats that occupy the `Shield` slot.                                                     |
| ArmorSlotRing        | A collection of stats that occupy the `Ring` slot.                                                       |
| ArmorSlotBelt        | A collection of stats that occupy the `Belt` slot.                                                       |
| ArmorSlotBoots       | A collection of stats that occupy the `Boots` slot.                                                      |
| ArmorSlotGloves      | A collection of stats that occupy the `Gloves` slot.                                                     |
| ArmorSlotAmulet      | A collection of stats that occupy the `Amulet` slot.                                                     |
| ArmorSlotRing2       | A collection of stats that occupy the `Ring2` slot.                                                      |
| ArmorSlotWings       | A collection of stats that occupy the `Wings` slot.                                                      |
| ArmorSlotHorns       | A collection of stats that occupy the `Horns` slot.                                                      |
| ArmorSlotOverhead    | A collection of stats that occupy the `Overhead` slot.                                                   |
| **Crime**            |                                                                                                          |
| Crime                | A collection of stats of the `Crime` type. _Don't know anything about Crime Stats_, sorry!               |
| **Object**           |                                                                                                          |
| Object               | A collection of stats of the `Object` type. Miscellaneous Items like crafting-ingredients.               |
| **Potion**           |                                                                                                          |
| Potion               | A collection of stats of the `Potion` type. Potion, Food and Status Effects. Not the items, the effects. |
| IsConsumable         | A collection of stats of the `Potion` type that are consumed on use.                                     |
| IsFood               | A collection of stats of the consumable `Potion` type that are classified as Foods.                      |
| IsPotion             | A collection of stats of the consumable `Potion` type that are classified as Potions.                    |
| **Shield**           |                                                                                                          |
| Shield               | A collection of stats of the `Shield` type. Generic and Unique shields.                                  |
| **SkillData**        |                                                                                                          |
| SkillData            | A collection of stats of the `SkillData` type. Pretty much all skills.                                   |
| **StatusData**       |                                                                                                          |
| StatusData           | A collection of stats of the `StatusData` type. Status effects like BURNING, HEALING, BLINDED etc.       |
| **Weapon**           |                                                                                                          |
| Weapon               | A collection of stats of the `Weapon` type. Generic and Unique Swords, Bows, Wands                       |
| WeaponTypeSword      | A collection of stats of the `Weapon` type that classify as Swords.                                      |
| WeaponTypeClub       | A collection of stats of the `Weapon` type that classify as Clubs.                                       |
| WeaponTypeAxe        | A collection of stats of the `Weapon` type that classify as Axes.                                        |
| WeaponTypeStaff      | A collection of stats of the `Weapon` type that classify as Staves.                                      |
| WeaponTypeBow        | A collection of stats of the `Weapon` type that classify as Bows.                                        |
| WeaponTypeCrossbow   | A collection of stats of the `Weapon` type that classify as Crossbows.                                   |
| WeaponTypeSpear      | A collection of stats of the `Weapon` type that classify as Spears.                                      |
| WeaponTypeKnife      | A collection of stats of the `Weapon` type that classify as Knives.                                      |
| WeaponTypeWand       | A collection of stats of the `Weapon` type that classify as Wands.                                       |
| WeaponTypeArrow      | A collection of stats of the `Weapon` type that classify as Arrows.                                      |
| WeaponIsTwoHanded    | A collection of stats of the `Weapon` type that are two-handed.                                          |
| WeaponIsNotTwoHanded | A collection of stats of the `Weapon` type that are not two-handed.                                      |

To use this feature, you just need the key to be in the following format: `"COLLECTION <CollectionName>"`. Note: the whitespace is necessary.

Users can create and define their own collections using the settings.json.

## Settings

### Default Settings

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

These are the mod's **default** settings. The user can override these settings in `S7_ConfigSettings.json` in `Osiris Data`. Changes made in this file (`S7_ConfigSettings.json`) will take precedence over the default values when the mod loads. You can **Reapply Custom Settings** or **Reset To Default** from the stats-configurator **mod-menu**.

### Setting Details

Here's a quick summary of all the settings:

| Setting                                | Default Value        | Purpose                                                                                                                                        |
| -------------------------------------- | -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `ConfigFile`                           | `S7_Config.json`     | Name of the user-created configuration file. This is the file that users will write their configurations in.                                   |
| `StatsLoader.Enable`                   | `true`               | StatsLoader is responsible for loading **ConfigData** during `ModuleLoading` event.                                                            |
| `StatsLoader.FileName`                 | `S7_ConfigData.json` | Name of the mod-created **ConfigData** file. This is the compiled configuration profile.                                                       |
| `ConfigLog.Enable`                     | `false`              | Enables logging to an external tsv file in `Osiris Data`. Useful for diagnostics and record-keeping. [Use with care](#ConfigLog)               |
| `ConfigLog.FileName`                   | `S7_ConfigLog.tsv`   | Name of said tsv file.                                                                                                                         |
| `SyncStatPersistence`                  | `false`              | Stat-edits will be saved **persistently** in the savefile if `true`.                                                                           |
| `BypassSafetyCheck`                    | `false`              | The mod prevents the modification of certain stats and keys. `BypassSafetyCheck` will allow unrestricted modification of these keys if `true`. |
| `ExportStatIDtoTSV.FileName`           | `S7_AllTheStats.tsv` | Name of the tsv file to which `StatID`s are exported.                                                                                          |
| `ExportStatIDtoTSV.RestrictStatTypeTo` | `""`                 | Export will be restricted to the specified stat-types.                                                                                         |
| `CustomCollections`                    | `{}`                 | Loads custom-collections created by the user.                                                                                                  |

### Custom Settings

Custom Settings are applied from `S7_ConfigSettings.json` in `Osiris Data`. If that file doesn't exist, you can create one manually or **Export Current Settings** from the **mod-menu**. Custom settings are applied automatically when `ModuleLoadStarted` event triggers, but can be reapplied whenever the host-user wants, using the modmenu. Collections are automatically rebuilt everytime settings are refreshed. The mod-menu shows whether you're using the **default** settings or **custom** ones. Some simple settings can be toggled on-or-off from the mod-menu itself. They can also be toggled using [console-commands](Documentation/Extensive-Docuementation.md#Console-Commands). For settings that aren't just toggles, you'll need manual-editing in the `S7_ConfigSettings.json` file.

## Mod-Interfacing

The mod reads serialized jsons for configuration. But the source of these configurations need not always be the user; Other mods can interface with the stats-configurator aswell. They need only pass the serialized json and rebuild the ConfigData file. Mod-created configs are kept separate from user-created configs (and one another) so as to not overwrite them. These configs are loaded during the `ModuleLoading/StatsLoaded` event in accordance with the Mod Load-Order. This functionality exists because I wanted some sort of framework to create Mod-Config-Menus for my other mods and did not want to write the same code 14 billion times. So while the Mod-Interface is something I created primarily for myself, technically any mod can use to delegate the stat-overriding tasks.

### Quick-Menu

The mod comes with a dynamic-MCM that allows modders to setup a dependency-free integration. Modders just need to provide the modName, modUUID, globalFlagName along with the set of stats and attributes they want to be able to configure using the MCM through Osiris Databases. The stats-configurator will create a dynamic MCM for you! The mod will listen for the globalFlagName you provided and start the MCM as soon as it is set.

The second half of the following video preview showcases the dynamic-quick-menu in action.

[Video-Preview](https://youtu.be/gt-Dfrlh_1o?t=90)

You can check whether the player has the mod installed using the extender (`Ext.IsModLoaded("de8f15f2-65a2-4ee4-a25f-7a7ab0305a58")` or `NRD_IsModLoaded("de8f15f2-65a2-4ee4-a25f-7a7ab0305a58")`) or by checking for the flag `S7_ConfigActive`. You need to register your mod to the stats configurator by providing the `modName` and `modUUID`. This is required to display information to the user and also to check your mod against the load-order. You can register you mod by adding a DB entry in Osiris like `DB_S7_Config_ModRegistry("My_ModName", "1MOD2UUID3-65a2-X2gx-a25f-7a7ab0305a58", "My_ModSignal");`. This will register `My_ModName` with modUUID `1MOD2UUID3-65a2-X2gx-a25f-7a7ab0305a58` to the stats-configurator. The third parameter is the `flagName` that the stats-configurator will listen for, to start the dynamic-quick-menu.

Once registered, you need to specify the stats and attributes you want the quick-menu to list as options. You do this by registering them to `DB_S7_Config_ModInterface((STRING)_ModName, (STRING)_StatName, (STRING)_AttributeName);`. For example:

```
DB_S7_Config_ModInterface("MyModName", "Projectile_MySkillName", "ActionPoints");
DB_S7_Config_ModInterface("MyModName", "Projectile_MySkillName", "IgnoreSlience");
DB_S7_Config_ModInterface("MyModName", "WPN_MySpecialWeapon", "AttackAPCost");
```

Here's an example from my [Channel-Source](https://steamcommunity.com/sharedfiles/filedetails/?id=2028696492) mod:

```
INITSECTION

//  =================================================================================================================
//  DB_S7_Config_ModRegistry((STRING)_ModName,      (STRING)_ProjectUUID,                         (STRING)_FlagName);
    DB_S7_Config_ModRegistry("S7_ChannelSource",    "66d26dfa-db24-4388-99d5-1f1a5b323e3c",     "S7_CS_SkillConfig");
//  =================================================================================================================

//  =================================================================================================================
//  DB_S7_ChannelSource_SkillConfig((STRING)_SKILLNAME);
    DB_S7_ChannelSource_SkillConfig("Shout_S7_CS_ChannelSource_I");
    DB_S7_ChannelSource_SkillConfig("Shout_S7_CS_ChannelSource_II");
    DB_S7_ChannelSource_SkillConfig("Shout_S7_CS_ChannelSource_III");
    DB_S7_ChannelSource_SkillConfig("Shout_S7_CS_ChannelSource_IV");
    DB_S7_ChannelSource_SkillConfig("Target_S7_CS_SiphonSource_I");
//  DB_S7_ChannelSource_AttributeConfig((STRING)_ATTRIBUTENAME);
    DB_S7_ChannelSource_AttributeConfig("ActionPoints");
    DB_S7_ChannelSource_AttributeConfig("Cooldown");
    DB_S7_ChannelSource_AttributeConfig("TargetRadius");
    DB_S7_ChannelSource_AttributeConfig("AreaRadius");
    DB_S7_ChannelSource_AttributeConfig("Memory Cost");
    DB_S7_ChannelSource_AttributeConfig("Magic Cost");
    DB_S7_ChannelSource_AttributeConfig("Autocast");
    DB_S7_ChannelSource_AttributeConfig("IgnoreSilence");
//  =================================================================================================================

KBSECTION

//  ======================
//      REGISTER MOD
//  ======================

IF
GameStarted(_, _)                                                                                                       //  If GameStarted
AND
GlobalGetFlag("S7_ConfigActive", 1)                                                                                     //  If Stats-Configurator is active
AND
NOT DB_S7_Config_ModRegistry("S7_ChannelSource",    "66d26dfa-db24-4388-99d5-1f1a5b323e3c",     "S7_CS_SkillConfig")    //  Mod not registered to StatsConfigurator
THEN
DB_S7_Config_ModRegistry("S7_ChannelSource",    "66d26dfa-db24-4388-99d5-1f1a5b323e3c",     "S7_CS_SkillConfig");       //  Register Mod

IF
GameStarted(_, _)                                                                                                       //  Game-Started
AND
GlobalGetFlag("S7_ConfigActive", 1)                                                                                     //  If StatsConfigurator is active
AND
DB_S7_ChannelSource_SkillConfig(_SkillName)                                                                             //  Fetch SkillNames
AND
DB_S7_ChannelSource_AttributeConfig(_AttributeName)                                                                     //  Fetch AttributeNames
AND
NOT DB_S7_Config_ModInterface("S7_ChannelSource", _SkillName, _AttributeName)                                           //  If DB entry does not exist
THEN
DB_S7_Config_ModInterface("S7_ChannelSource", _SkillName, _AttributeName);                                              //  Create DB entry

EXITSECTION

ENDEXITSECTION

```

The dynamic-quick-menu is just me being lazy. I did not want to make a MCM each and everytime I make a mod. For more flexibility and options, you may want to create your own. If for some reason you absolutely hate coding in Lua and/or just want to assert dominance by string-concatenating a json from the ground up in osiris, you can make use of this mod's Lua functions instead.

## Diagnostics

### ConfigLog

Everything the mod prints to the _debug-console_, it can log to an _external tsv file_ aswell. This is extremely helpful if you are **diagnosing problems** or just trying to keep a **history** of the config-changes you've made. However, the file can get ridiculously large (and cause performance issues), thus it is `disabled` by default. I encourage you keep it disabled unless you absoulutely need it to diagnose a problem or keep a persistent-record of changes (especially if `SyncStatPersistence` is `true`). If you do this, I'd advise you to manually backup ConfigLogs somewhere else and empty the file or change its name every now-and-then. Keeping the file size small will prevent a lot of headache. You can toggle the logging functionality using the mod-menu, console-commands or custom-settings. You can also change the name of the tsv file using custom-settings.

### Inspect Skill

The **Inspect** skill is a special skill that the host-character can learn through the diagnostics menu. The skill does not cost any action-points or memory and you are completely free to use it whenever you chose. Targetting a character/Item by **Inspect** will print all the _active status-effects_ and _skills_ the target has to the debug-console. This is a quick and easy way to find out what the stat-names/statIDs of target's skills and statuses are. You can also target specific items, like armors and weapons to get their item-name/itemID aswell. When you are done with the skill you can "unlearn" it from the same menu. For a more comprehensive reference list, you can use the function described below.

### Export StatIDs for Reference

It may not always be possible to know the exact internal **stat-name/statID** of a stat, especially if you don't have access to **The Divinity Engine 2**. Even with the engine, opening the software just to check stat-names may not be the best use of your time. As such, a niche but useful function in the **diagnostics** section is `ExportStatToTSV`. This will save a `tsv` (tab-seperated-value) file in `Osiris Data` with **all** the stat-names along with their category. Unless new stats are created for your session (by adding new mods for example), this list will not change much. So you can just export it once and keep it around for reference forever. You can restrict what type of stats are exported using the [settings](#Setting-Details) - the field `RestrictStatTypeTo` in `ExportStatToTSV` takes a string seperated by commas and spaces. For example, if you want to restrict the export to Armor and Weapons only, then `S7_ConfigSettings.json` will have the following block:

```json
{
  "ExportStatToTSV": {
    "FileName": "S7_AllTheStat.tsv",
    "RestrictStatTypeTo": "Armor, Weapon"
  }
}
```

Now, `S7_AllTheStat.tsv` will only have stat of the _"Armor"_ and _"Weapon"_ type.
Possible values for stat-types are: `Character`, `Armor`, `Weapon`, `Potion`, `SkillData`, `StatusData` and `Shield` etc. Leaving `RestrictStatTypeTo` empty will export everything.

If you just wish to know the stat-names for a certain **skill** or **status** a character/item has on them, then you can also use the [Inspect Skill](#inspect-skill). It will print out the relevant **stat-names** to the debug-console. This way you can quickly reference the stat-name/statID without having to export 7000+ stat entries.

You can also use the [console-command](#Console-Commands) `!S7_Config SearchStat YourSearchQueryHere OptionalTypeRestriction`. This will search any stats that have `YourSearchQueryHere` in their name. The optional argument `OptionalTypeRestriction` will restrict the search to that stat-type only - it can be omitted to search everything. e.g. `!S7_Config SearchStat Dallis` will search all stat-entries for the string `Dallis` and return any matches. To narrow down the search to her character we can use `!S7_Config SearchStat Dallis Character` will only search for the string `Dallis` in stat-entries of the `Character` type.

## Console-Commands

The mod comes with a suite of console-commands for a variety of purposes. Console-commands can allow the user to bypass the boring mod-menu entirely. You input console-commands through the script-extender's [debug-console](#debug-console) window. Press enter while the debug-console is in focus to initiate the command-line.

All console-commands from this mod are accessed by using the `!S7_Config` prefix. For example: `!S7_Config Help` will bring up the following list of useful commands in the debug-console window.

| Command             | Argument 1       | Argument 2    | Comments                                                      | Examples                                           |
| ------------------- | ---------------- | ------------- | ------------------------------------------------------------- | -------------------------------------------------- |
| **Help**            |                  |               | Prints a helpful list of console-commands.                    | `!S7_Config Help` or simply `!S7_Config`           |
| **AddConfigurator** |                  |               | Adds the configurator item to the host-character.             | `!S7_Config AddConfigurator`                       |
| **StartModMenu**    |                  |               | Starts the Mod-Menu Dialog.                                   | `!S7_Config StartModMenu`                          |
| **AddSkill**        | **SkillID**      | Character-key | Adds skill (skillID) to character (character-key).            | `!S7_Config AddSkill Projectile_Fireball Host`     |
| **RemoveSkill**     | **SkillID**      | Character-key | Removes skill (skillID) to character (character-key).         | `!S7_Config RemoveSkill Shout_InspireStart`        |
| **SearchStat**      | **SearchString** | StatType      | Search for (SearchString) in category (StatType).             | `!S7_Config SearchStat Summon_Incarnate SkillData` |
| **SyncStat**        | **StatID**       | Persistence   | Synchronize (StatID) with (Persistence) for all clients.      | `!S7_Config SyncStat Projectile_PyroclasticRock`   |
| **SnapshotVars**    | VariableType     | Variable      | Prints info about the relevant variable to the debug-console. | `!S7_Config SnapshotVars`                          |
| **Reference**       | statType         | attributeType | Lookup (StatType) and (AttributeType) in References           | `Reference Weapon IsTwoHanded`                     |
| **DeepDive**        | **statsID**      |               | Print all valid attributes and their values.                  | `DeepDive Shout_ShedSkin`                          |
| **Relay**           | Signal           |               | Relay to ModMenu. `!S7_Config Relay Help` for more.           | `!S7_Config Relay S7_BroadcastConfigData`          |

>**NOTE**:
>
> - Non-bold arguments are optional.
> - Character-key accepts the following values: Host, Clients, [Character's Name e.g. Beast, Fane], [Empty-String to select all players]

The following signals can be passed to the `Relay`.

| Signal                       | Purpose                                                                            |
| ---------------------------- | ---------------------------------------------------------------------------------- |
| S7_StatsConfigurator         | Loads and applies configuration-profile. (default: S7_Config.json)                 |
| S7_BuildConfigData           | Builds ConfigData file using configuration-profile. (default: S7_Config.json)      |
| S7_BroadcastConfigData       | Broadcasts serialized ConfigData to all active clients.                            |
| S7_ValidateClientConfig      | Calls for client ConfigData validation. Check response in debug-console.           |
| S7_ToggleStatsLoader         | Toggle StatsLoader setting. Responsible for loading ConfigData on ModuleLoad.      |
| S7_ToggleSyncStatPersistence | Toggles Sync-Stat Persistence. Stat-edits will be saved persistently if enabled.   |
| S7_ToggleSafetyCheck         | Toggles safe-to-modify attribute check. Will prevent modification of certain keys. |
| S7_SetDefaultSettings        | Reset ConfigSettings to default values. Export to save persistently.               |
| S7_ExportCurrentSettings     | Export current ConfigSettings. Saves settings in a json file in OsirisData.        |
| S7_RefreshSettings           | Reloads settings from OsirisData folder. if unavailable, loads defaults.           |
| S7_StatsExportTSV            | Export a list of all stat-entries to a TSV file in OsirisData folder.              |
| S7_Config_CHANGELOG          | Request in-game changelog.                                                         |
| S7_PrintModRegistry          | Prints a list of all mods registered to Stats-Configurator.                        |
| S7_RebuildCollections        | Rebuilds collections using presets and custom settings.                            |
| S7_ToggleConfigLog           | Toggles logging to external file.                                                  |

## References

If you wish to know the _stat-name/stat-ID_ of something specific, you can target it in-game using the [Inspect skill](#inspect-skill) or you can use the `SearchStat` [console-command](#console-commands) to search for it. `!S7_Config SearchStat Cone_` will return a list of all stat-IDs with the string `Cone_` in them.
If you want a complete list of stat-IDs, you can [export them to a .tsv file](#export-statids-for-reference).

Each stat-name/stat-ID has a corresponding _stat-type_. Each stat-type has a set of _attributes_ associated with them as defined in the `StatObjectDefinitions.xml` file. Furthermore, some of those attributes can be _enumerations_ that have an associated list of values of their own as defined in `Enumerations.xml` file. Both of these files have been provided for your convenience.

- [**StatObjectDefinitions**](../References/StatObjectDefinitions.md)
- [**Enumerations**](../References/Enumerations.md)

This information can also be printed to the debug-console using the `Reference` [console-command](#console-commands).

> **NOTE:** The data is taken straight from the game-engine files `StatObjectDefinitions.xml` and `Enumerations.xml`. Which is to say that all this is provided by **Larian**. I've just converted them into (human-readable) markdown. The reference sheets may seem incomplete, but it is what it is. So feel free to ask if you are still unsure about something.

If you wish to retrieve all attributes and their corresponding values for a given stat you can use the `DeepDive` [console-command](#console-commands). `!S7_Config DeepDive Projectile_Fireball` will print absolutely everything related to stat `Projectile_Fireball`.

---
