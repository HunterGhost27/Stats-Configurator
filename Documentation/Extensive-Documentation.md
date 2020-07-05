# Extensive-Documentation

---

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
    "ExportStatIDtoTSV": {"FileName": "S7_AllTheStats.tsv" "RestrictStatTypeTo": ""},
    "CustomCollections": {}
}
```

#### Setting Details

|Setting|Default Value|Purpose|
|-------|-------------|-------|
|`ConfigFile`|`S7_Config.json`|Name of the user created configuration file.|
|`StatsLoader.Enable`|`true`|StatsLoader is responsible for loading **ConfigData** during `ModuleLoading` event.|
|`StatsLoader.FileName`|`S7_ConfigData.json`|Name of the mod created **ConfigData** file.|
|`ConfigLog.Enable`|`false`|Enables logging to an external tsv file.|
|`ConfigLog.FileName`|`S7_ConfigLog.tsv`|Name of said external tsv file.|
|`CreateStats`|`false`|Enables stat-creation if `true`.|
|`SyncStatPersistence`|`false`|Stat-edits will be saved **persistently** if `true`.|
|`BypassSafetyCheck`|`false`|Allows modification of any stat and attribute.|
|`ExportStatIDtoTSV.FileName`|`S7_AllTheStats.tsv`|Name of the tsv file to which `StatID`s are exported.|
|`ExportStatIDtoTSV.RestrictStatTypeTo`|`""`|Stats of only these types will be exported.|
|`CustomCollections`|`{}`|Allows users to create custom-collections.|

#### Custom Settings

Custom Settings are applied from `S7_ConfigSettings.json` in `Osiris Data`. If that file doesn't exist, you can create one manually or export current settings from the mod-menu.

### Mod-Integration

### Diagnostics
