# Extensive-Documentation

---

This document is a work-in-progress.

## Table of Contents

- [Stats-Configurator](#Stats-Configurator)
- [Settings](#Settings)
  - [Default Settings](#Default-Settings)
  - [Setting Details](#Setting-Details)
  - [Custom Settings](#Custom-Settings)
- [Mod-Integration](#ModIntegration)
- [Diagnostics](#Diagnostics)

---

### Stats-Configurator

### Settings

#### Default Settings

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

These are the **default** settings the mod loads with. The user can override these settings by creating `S7_ConfigSettings.json` in `Osiris Data`. Settings overriden in this file will take precedence over the default values. You can **reapply custom-settings** or **revert to default settings** from the **mod-menu**.

#### Setting Details

|Setting|Default Value|Purpose|
|-------|-------------|-------|
|`ConfigFile`|`S7_Config.json`|Name of the user-created configuration file. This is the file that users will write their configurations in.|
|`StatsLoader.Enable`|`true`|StatsLoader is responsible for loading **ConfigData** during `ModuleLoading` event.|
|`StatsLoader.FileName`|`S7_ConfigData.json`|Name of the mod-created **ConfigData** file. This is the compiled configuration profile.|
|`ConfigLog.Enable`|`false`|Enables logging to an external tsv file in `Osiris Data`. Useful for diagnostics and record-keeping. [Use with care](Documentation/Extensive-Documentation.md#ConfigLog)|
|`ConfigLog.FileName`|`S7_ConfigLog.tsv`|Name of said external tsv file.|
|`CreateStats`|`false`|Enables stat-creation if `true`. Stat-creation only happens in the `server` context.|
|`SyncStatPersistence`|`false`|Stat-edits will be saved **persistently** in the savefile if `true`.|
|`BypassSafetyCheck`|`false`|The mod prevents the modification of certain stats and keys. `BypassSafetyCheck` will allow unrestricted modification of these keys if `true`.|
|`ExportStatIDtoTSV.FileName`|`S7_AllTheStats.tsv`|Name of the tsv file to which `StatID`s are exported.|
|`ExportStatIDtoTSV.RestrictStatTypeTo`|`""`|Stats of only these types will be exported.|
|`CustomCollections`|`{}`|Allows users to create custom-collections.|

#### Custom Settings

Custom Settings are applied from `S7_ConfigSettings.json` in `Osiris Data`. If that file doesn't exist, you can create one manually or **export current-settings** from the mod-menu. Custom settings are applied automatically when the game loads, but can be reapplied whenever the host-user wants, using the modmenu. The mod-menu shows whether you're using **default** settings or **custom** ones. Some simple settings can be toggled from the mod-menu itself. They can also be toggled using [console-commands](Documentation/Extensive-Docuementation.md#Console-Commands).

### Mod-Integration

### Diagnostics

#### ConfigLog

Everything the mod prints to the _debug-console_, it can log to an _external tsv file_ aswell. This is extremely helpful if you are **diagnosing problems** or just trying to keep a **history** of the config-changes you've made. However, the file can get ridiculously large (and cause performance issues), thus it is `disabled` by default. I encourage you keep it disabled unless you absoulutely need it to diagnose a problem or keep a persistent-record of changes (especially if `SyncStatPersistence` is `true`). If you do this, I'd advise you to manually backup ConfigLogs somewhere else and empty the file or change its name every now-and-then. Keeping the file size small will prevent a lot of issues.

#### Mod Registry

Using the `Mod Registry` option in the **diagnostics menu** will print a list of mods that are **registered** to the **stats-configurator**. This currently is only used if the mod uses the dynamic-quick-menu functionality.

#### Inspect Skill

The **Inspect** skill is a special skill that the host-character can learn through the diagnostics menu. The skill does not cost any action-points or memory and you are completely free to use it whenever you chose. Targetting a character/Item by **Inspect** will print all the _active status-effects_ and _skills_ the target has to the debug-console. This is a quick and easy way to find out what the stat-names/statIDs of target's skills and statuses are. You can also target specific items, like armors and weapons to get their item-name/itemID aswell. When you are done with the skill you can "unlearn" it from the same menu. For a more comprehensive reference list, you can use the function described below.

#### Export StatIDs for Reference

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
