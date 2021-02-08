# Extensive-Documentation

---

This document is a work-in-progress!

- [Extensive-Documentation](#extensive-documentation)
  - [Osiris Data](#osiris-data)
  - [Debug Console](#debug-console)
  - [Config Files and ConfigData File](#config-files-and-configdata-file)
  - [Host and Client Contexts](#host-and-client-contexts)
  - [Stats-Configurator](#stats-configurator)
    - [Stats-Configurator Items](#stats-configurator-items)
    - [Stats-Configurator Mod-Menu](#stats-configurator-mod-menu)
    - [Stats-Configurator Context-Menu](#stats-configurator-context-menu)
    - [Applying Configurations](#applying-configurations)
    - [StatsLoader](#statsloader)
      - [StatLoader Settings](#statloader-settings)
      - [StatsLoader and Load-Order](#statsloader-and-load-order)
    - [Stat Persistence](#stat-persistence)
  - [Relative Changes](#relative-changes)
    - [Attribute Tokens for Numbers](#attribute-tokens-for-numbers)
    - [Attribute Tokens for Strings](#attribute-tokens-for-strings)
    - [Attribute Tokens for Enumerations](#attribute-tokens-for-enumerations)
  - [Collections](#collections)
  - [Modification of Special Stat-Types](#modification-of-special-stat-types)
  - [Settings](#settings)
    - [Default Settings](#default-settings)
    - [Setting Details](#setting-details)
    - [Custom Settings](#custom-settings)
  - [UI-Components-Library Integration](#ui-components-library-integration)
  - [Console-Commands](#console-commands)
  - [References](#references)

---

## Osiris Data

The [**_script-extender_**](https://github.com/Norbyte/ositools) _reads from_ and _writes_ files to the `Osiris Data` folder (`..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\`). All **config-files** for this mod are located in the `StatsConfigurator\` subdirectory inside `Osiris Data`.

> **NOTE:** Throughout this document, `Osiris Data` will refer to the `..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\Osiris Data\StatsConfigurator\` directory.

## Debug Console

The mod uses the script-extender's _debug-console_ to display a lot of useful information. The console is also used to input [console-commands](#console-commands).
To enable the _debug-console_ you have to set `CreateConsole` to `true` in `OsirisExtenderSettings.json`.
Alternatively, if you use [LaughingLeader's Mod-Manager](https://github.com/LaughingLeader-DOS2-Mods/DivinityModManager), you can go to `Settings>Preferences>Script-Extender` and `Enable Console Window`. Then `Export Settings`.

## Config Files and ConfigData File

**Config-Files** (default: `Config.json`) are what users write their configurations in. These files are used to apply configurations from the mod-menu. The **ConfigData File** (default: `ConfigData.json`) on the other hand is compiled from all available configuration data. The **ConfigData** file is not meant to be directly edited by the user, it is used to store data in a more consolidated format and read automatically during `ModuleLoading` event if [**StatsLoader**](#statsloader) is `enabled`. ConfigData is also where the mod stores any persistent cache.

## Host and Client Contexts

Each game session has two contexts - the `server` and the `client`. There are significant differences between the two and they are completely isolated from one-another. Due to these differences not all functionality is available to both contexts. You can read more about this [here](https://github.com/Norbyte/ositools/blob/master/LuaAPIDocs.md#client--server-states).

The document will refer to the player that creates the `server` context as the `host` and their controlled-character as `host-character`, and all other peers are refered to as `clients`.

## Stats-Configurator

### Stats-Configurator Items

![stats-configurator-item](https://imgur.com/BagN95a.png)

The _"Stats-Configurator"_ item is granted to the player ([host-character](#host-and-client-contexts)) automatically as soon as they load into a game after activating this mod. The item is used to activate the _mod-menu dialog_. If you lose the item somehow, you can reacquire it using the `!S7_Config AddConfigurator` [console-command](#console-commands).

### Stats-Configurator Mod-Menu

![ModMenu](https://imgur.com/sADorrm.png)

The **mod-menu** allows you access most of the functionality of this mod; like [loading and sharing configurations](#Applying-Configurations) or changing [settings](#Settings) etc. This is how most people will interact with the mod.

Since most of these functions require the `server` context, only the [**host-character**](#host-and-client-contexts) is allowed to interact with the item. Any attempts, by the clients to use the item will redirect the dialog to the host-character.

### Stats-Configurator Context-Menu

If you have the [**UI-Components-Library**](https://github.com/HunterGhost27/UI-Components-Library) you can use the Context-Menu. The Context-Menu provides a one-click solution to load and apply configs. You can also access the mod-manual from there.

### Applying Configurations

Users create their configs in `json` files. These config-files can be loaded-in at any time by the [host-character](#host-and-client-contexts) using the mod-menu's `Load Configuration` option. Users can safely test their configs before they rebuild their [**ConfigData**](#config-file-and-configdata-file) file. Some stat-edits (like skills) are applied instantaneously and some (like characters) will require a _save-and-reload_. These configurations are **not** saved persistently by _default_ (this can be changed in the [settings](#Custom-Settings)); meaning, they'll be lost after the session closes. Stat-overrides can be made persistent by rebuilding the ConfigData file after loading a configuration (**recommended**) or loading the configuration when `SyncStatPersistence` is `enabled`.

Stat-modifications from this file are loaded in the `server` context and are automatically synchronized to the clients afterwards. Clients connecting after this process may not have their stat synchronized to the server - you must reload the configuration if that is the case. You can also manually synchronize stats by using [console-commands](#Console-Commands). Edited stats remain in memory until the game is closed, allowing you to synchronize all of them at will, should a client join after loading a configuration.

Applying configurations this way is great for **prototyping** or making **temporary changes**. But otherwise, instead of re-applying configurations every session or making irreversible changes to your save-file (using `SyncStatPersistence`), you should export the configs to **ConfigData**. This will allow the StatsLoader(Read more below) to apply those edits automatically when the game loads.

### StatsLoader

The **StatsLoader** is responsible for loading **ConfigData** during the `ModuleLoading` event. Stat-modifications applied through the StatsLoader do not require additional synchronization as they are loaded just after the `StatsLoaded` event (but before `GameStart`) and on the client context. The only caveat here is that all clients **need** to have a local copy of the same ConfigData; otherwise, they will not have the same stats. The host-player can share their ConfigData file manually or _broadcast_ it in-game from the mod-menu. **Broadcasting** the configuration profile will send the host's ConfigData file to all _connected clients_ and save (/overwrite) it on their local system; however, all peer must then restart their game for the changes to apply. If the host wishes to check if their peers have the same ConfigData as them or not, they can **Verify Client Configs** to print out a response from the client's game to their debug-console. This way, the host can check if any peer is _out-of-sync_ (or is deliberately cheating :P).

Preferably, all custom stat-modifications should be applied through the **StatsLoader**, while active-loading should only be used for prototyping and testing. All configurations made by mods are already stored in ConfigData. Users should also export their configs to if they wish them to apply automatically when the game loads. With the [default settings](#Default-Settings), stat-overrides will not be stored persistently in the save-file, i.e. you'll lose those changes and will have to re-load the configuration file every game-session. You can enable stat-synchronization persistence using the [settings](#Setting-Details) and console-commands, however, the recommended approach is to save your configs to the ConfigData file. This can easily be done using the **Rebuild ConfigData** option in the Mod-Menu.

#### StatLoader Settings

You can stop the StatsLoader from applying _any_ stat-modification through the [setting](#Custom-Settings):

```json
{
  "StatsLoader": { "Enable": false, "FileName": "ConfigData.json" }
}
```

or by using the `ToggleStatsLoader` option in the Mod-Menu's setting page, or through console-commands (`!S7_Config ToggleStatsLoader`). Setting this to `false` will completely disable the **StatsLoader**.

There can be only one **ConfigData** file but its name can be changed to whatever you like using the [settings](#Custom-Settings).

```json
{
  "StatsLoader": { "Enable": true, "FileName": "YOLO_ConfigData.json" }
}
```

This can be useful if you are playing with different groups and want to seperate the ConfigData files or keep a backup. The StatsLoader will load whichever `FileName` is specified in the settings.

#### StatsLoader and Load-Order

The StatsLoader loads config-data from mods in accordance to the load-order. i.e. stat-modifications from mods higher up in the load-order are loaded before mods at the bottom. Stat-edits that come from mods loaded late in the load-order override the previous stat-edits (if any). This information is crucial for conflict-resolution. If two mods edit the same stat, the mod that's placed lower in the load-order will win the conflict. This let's you exercise some degree of control over the outcome, but Ideally, modder should avoid conflicts if possible. Keep in mind that dependencies are always loaded before that mod, even if the dependency is technically lower in the load-order. Thus, any mod will always override their dependencies. I advise everyone to put this mod, **Stats-Configurator**, as low in their load order as they can. This mod will only hold config-data that's created by the user. As such, those changes are probably meant to be final. Putting this mod at the bottom will ensure that user-created configs always win the conflict.

### Stat Persistence

Stat-overrides can be saved persistently in the save-file so that those overrides are baked into the game-session. This will make sure those changes are always active for the server and the client. Norbyte did tell me this has hidden caveats but I forgot to ask for details.

By default, `SyncStatPersistence` is disabled. This essentially means that all configs must be reloaded every game session. StatsLoader can do this automatically for you.

## Relative Changes

By prefixing an stat-attribute with special characters you can modify the behaviour of the config-variable. This allows you to make relative changes instead of absolute ones.
For example,

```json
{
  "Shout_InspireStart": {
    "-Cooldown": 1,
    "+ActionPoints": 2
  }
}
```

This will reduce `InspireStart`'s cooldown by 1 and increase AP cost by 2 (Relative to their original/current stat values).

### Attribute Tokens for Numbers

| Attribute Token | Function              | Expected Parameter |
| --------------: | --------------------- | ------------------ |
|             `+` | Increase value        | `number`           |
|             `-` | Decrease value        | `number`           |
|             `*` | Multiply value        | `number`           |
|             `/` | Divide value          | `number`           |
|             `%` | Modulo of value       | `number`           |
|             `^` | Exponent of value     | `number`           |
|             `$` | Copy value            | `statID`           |
|             `?` | Random value (0 to X) | `number`           |

### Attribute Tokens for Strings

| Attribute Token | Function      | Expected Parameter |
| --------------: | ------------- | ------------------ |
|             `+` | Append String | `string`           |
|             `-` | Remove String | `string`           |

### Attribute Tokens for Enumerations

| Attribute Token | Function           | Expected Paramter |
| --------------: | ------------------ | ----------------- |
|             `+` | Increase EnumIndex | `EnumIndex`       |
|             `-` | Decrease EnumIndex | `EnumIndex`       |
|             `$` | Copy EnumIndex     | `EnumIndex`       |

## Collections

Trying to edit stats en-masse with the same values is both a redundant and time-consuming process. To solve this issue, stats can be grouped in a **collection** and configurations can be applied to all of them in-tandem. A collection is basically a list of stat-names/statIDs; whenever you apply stat-modifications to a collection, the modifications are applied to all stat-entries associated with the collection. For e.g.

```json
"#Shield" {
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

To use this feature, you just need the key to be in the following format: `"#<CollectionName>"`.

Users can create and define their own collections using the ConfigCollections.json.

## Modification of Special Stat-Types

Certain stat-types like `DeltaMods`, `TreasureTables` and `TranslatedStrings` cannot be modified without the use of special functions. Such special statIDs should be suffixed with `:<SpecialStatType>` in the configs for the mod to know how to handle them. For example, in order to modify a translated string handle:

```json
{
  "h2072d626g225eg4fa9g9577g47716c44a7d7:TranslatedStringHandle": "<-- Take Note of :TranslatedStringHandle"
}
```

> General stats like `Character`, `Armor` etc can also be suffixed with the corresponding types (`:Character`, `:Armor` etc) however it is not necessary.

A list of Special Stats:

- DeltaMods
- EquipmentSets
- SkillSets
- Item Combination
- TranslatedString
- TranslatedStringHandle
- Treasure Table
- Treasure Category

Configs for these stats must follow a [specific template](../References/md/Templates.md).

## Settings

### Default Settings

```json
{
  "ConfigFile": ["Config.json"],
  "StatsLoader": { "Enable": true, "FileName": "ConfigData.json" },
  "SyncStatPersistence": false
}
```

These are the mod's **default settings**. The user can override these settings in `S7Central.json` in `Osiris Data`. Changes made in this file will take precedence over the default values when the mod loads. You can **Reapply Custom Settings** or **Reset To Default** from the stats-configurator **_mod-menu_**.

### Setting Details

Here's a quick summary of all the settings:

| Setting                | Default Value     | Purpose                                                                                                          |
| ---------------------- | ----------------- | ---------------------------------------------------------------------------------------------------------------- |
| `ConfigFiles`          | `["Config.json"]` | Array of the user-created configuration files. These are the file that users will write their configurations in. |
| `StatsLoader.Enable`   | `true`            | StatsLoader is responsible for loading **ConfigData** when the game loads.                                       |
| `StatsLoader.FileName` | `ConfigData.json` | Name of the mod-created **ConfigData** file. This is the compiled configuration profile.                         |
| `SyncStatPersistence`  | `false`           | Stat-edits will be saved **persistently** in the savefile if `true`.                                             |

### Custom Settings

Custom Settings are loaded from `S7Central.json` in `Osiris Data`. Custom settings are applied automatically when `ModuleLoadStarted` event triggers, but can be reapplied whenever the host-user wants, using the modmenu. Collections are automatically rebuilt everytime settings are refreshed. The mod-menu shows whether you're using the **default** settings or **custom** ones. Some simple settings can be toggled on-or-off from the mod-menu itself.

## UI-Components-Library Integration

If you have the [**UI-Components-Library**](https://github.com/HunterGhost27/UI-Components-Library) installed, you can **apply configurations** and access the **mod-manual** from the **Context-Menu**. The Context-Menu option is a one-click solution that _loads_, _rebuilds_, _broadcasts_ and _verifies_ configs automatically.

@TODO: Context-Menu Image

## Console-Commands

The mod comes with a suite of console-commands for a variety of purposes. Console-commands can allow the user to bypass the boring mod-menu entirely. You input console-commands through the script-extender's [debug-console](#debug-console) window. Press enter while the debug-console is in focus to initiate the command-line.

All console-commands from this mod are accessed by using the `!S7_Config` prefix. For example: `!S7_Config Help` will bring up the following list of useful commands in the debug-console window.

| Command                | Argument 1       | Argument 2  | Comments                                                 | Examples                                           |
| ---------------------- | ---------------- | ----------- | -------------------------------------------------------- | -------------------------------------------------- |
| **Help**               |                  |             | Prints a helpful list of console-commands.               | `!S7_Config Help` or simply `!S7_Config`           |
| **AddConfigurator**    |                  |             | Adds the configurator item to the host-character.        | `!S7_Config AddConfigurator`                       |
| **StartModMenu**       |                  |             | Starts the Mod-Menu Dialog.                              | `!S7_Config StartModMenu`                          |
| **SearchStat**         | **SearchString** | StatType    | Search for (SearchString) in category (StatType).        | `!S7_Config SearchStat Summon_Incarnate SkillData` |
| **SyncStat**           | **StatID**       | Persistence | Synchronize (StatID) with (Persistence) for all clients. | `!S7_Config SyncStat Projectile_PyroclasticRock`   |
| **DeepDive**           | **statsID**      |             | Print all valid attributes of (stat) and their values.   | `!S7_Config DeepDive Shout_ShedSkin`               |
| **ClearCache**         |                  |             | Clears the ConfigData Cache.                             | `!S7_Config ClearCache`                            |
| **RebuildCollections** |                  |             | Rebuilds Custom-Collections data.                        | `!S7_Config RebuildCollections`                    |

## References

If you wish to know the `statName`/`statID` of something specific, you can target it in-game using the [Inspect skill](#inspect-skill). The **Inspect** skill is a special skill that the host-character can learn through the diagnostics menu. The skill does not cost any action-points or memory and you are completely free to use it whenever you chose. Targetting a character/Item by **Inspect** will print all the _statID_, _active status-effects_ and _skills_ the target has to the debug-console. When you are done with the skill you can "unlearn" it from the same menu. For a more comprehensive reference list, you can use the function described below.

Alternatively, You can use the [console-command](#Console-Commands) `!S7_Config SearchStat SearchString SearchType`. This will search any stats that have `Search` in their name. The optional argument `SearchType` will restrict the search to that stat-type only - it can be omitted to search everything. e.g. `!S7_Config SearchStat Dallis` will search all stat-entries for `Dallis` and return any matches. To narrow down the search to her character we can use `!S7_Config SearchStat Dallis Character`; this will only search for `Dallis` in stat-entries of the `Character` type.

Each `stat` has a corresponding `statType`. Each `statType` has a set of _attributes_ associated with them as defined in the `StatObjectDefinitions.xml` file. Furthermore, some of those attributes can be _enumerations_ that have an associated list of values of their own as defined in `Enumerations.xml` file. Both of these files have been provided for your convenience.

- [**StatObjectDefinitions**](../References/StatObjectDefinitions.md)
- [**Enumerations**](../References/Enumerations.md)

> **NOTE:** The data is taken straight from the game-engine files `StatObjectDefinitions.xml` and `Enumerations.xml`. Which is to say that all this is provided by **Larian**. I've just converted them into (human-readable) markdown. The reference sheets may seem incomplete, but it is what it is. So feel free to ask if you are still unsure about something.

If you wish to retrieve all _attributes_ and their corresponding _values_ for a given stat you can use the `DeepDive` [console-command](#console-commands). `!S7_Config DeepDive Projectile_Fireball` will print absolutely everything related to stat `Projectile_Fireball`.

---
