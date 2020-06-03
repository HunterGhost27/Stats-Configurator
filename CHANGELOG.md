# Stats Configurator Changelog

----------

## [0.5.2.0] --- 3rd June 2020 --- **_Smart-Logger_**

### FIX

* _Changed_ scope of `dialogCase` to **Global**. Fixed issue where dialog-vars weren't being updated. Gave me a headache this one.

### META

* _Merged_ `S7_ConfigSettings.lua` into `S7_ConfigAuxiliary.lua`. Both files were highly interdependent.

## [0.5.1.0] --- 3rd June 2020 --- **_Improved ModMenu_**

### NEW

* _Added_ a settings toggle for `S7_StatsLoader()`.
* _Added_ **ModMenu** toggles for `StatsLoader`, `SyncStatPersistence` and `BypassSafetyCheck`.
* _Created_ `S7_UpdateSettingVars()` to reapply dialog-vars when necessary.
* _Created_ a **How-To** book item.

### META

* _Renamed_ `SCG/S7_Config_CHANGELOG.tsv` to `SCG/S7_Config_Items.tsv` to better represent its purpose.

## [0.5.0.0] --- 2nd June 2020 --- **_The Return of the Client_**

### NEW

* `BootstrapClient.lua` returns. Loads json during `StatsLoaded` event.
* _Created_ `S7_SetDialogVars()` to apply ***dialog-var*** changes whenever the **ModMenu** throws a flag. Allows dialog-vars to be set even when ***osiris*** is unavailable as changes are stashed in table and only applied when **ModMenu** is accessed.

### CHANGED

* `S7_InspectStats()` moved in `BootstrapServer.lua`. `Ext.NewCall()` needs to be in that file.
* `SyncStat()` save-game persistence is set to `false` by default now.

### META

* `BootstrapServer.lua` split into multiple files.

## [0.4.2.0] --- 1st June 2020 --- **_Changelog_**

### NEW

* _Created_ **CHANGELOG** item.
* _Added_ dialog options to obtain **CHANGELOG**.

### META

* _Created_ NOTES.md

## [0.4.1.0] --- 1st June 2020 --- **_Still Setting Up_**

### NEW

* _Added_ a ModMenu option to **export** current **ConfigSettings** to `S7_ConfigSettings.json`.

### CHANGED

* `S7_ReapplySettings()` renamed to `S7_RefreshSettings()`.
* `RefreshSettings()` now properly works with a mix of default and custom imported settings.
* `S7_Config_CustomSettings.json` file renamed to `S7_ConfigSettings.json`.
* _Improved_ File Error-Handling.

## [0.4.0.0] --- 29th May 2020 --- **_Setting Up_**

### NEW

* Started working on custom settings.
* `SyncStat()` persistence can be toggled.
* `StatsConfigurator()` can read from **multiple config files**.
* `StatExportTSV()` can be **restricted** to certain `StatTypes`.
* Can bypass `SafeToModify()` function.

## [0.3.0.0] --- 28th May 2020 --- **_Minor Refactoring_**

### CHANGED

* Minor ***Refactoring*** pass. Renamed **FetchAll** to **ExportTSV**.

## [0.3.0.0] --- 27th May 2020 --- **_File I/O_**

### NEW

* _Created_ an ModMenu option to export all stats to a **TSV** file.

## [0.3.0.0] --- 26th May 2020 --- **_Code Clean-up_**

### NEW

* _Added_ dialog variables for some flags.

### CHANGED

* _Refactored_ **Inspector** item as a gear instead of an identifying-glass. Name changed to **Stats-Configurator**.
* _Changed_ **Inspect** skill-icon to the standard identifying-glass.
* _Moved_ dialog options around. Manual **Synchronization** moved inside **diagnostics** options. -still pretty useless, but hey peace of mind.

## [0.3.0.0] --- 25th May 2020 --- **_Inspector_**

### NEW

* _Created_ **Inspector** item. Using opens mod-menu.
* _Created_ **Inspect** skill that returns the ***stat-type*** and ***stat-name/stat-id*** of the target.

### CHANGED

* ***Loading*** JSON files is done by the ModMenu functions. Moving this out of `S7_StatsConfigurator()` allows other mods to pass a ***stringified JSON (JSONstring)***  to the function.

### REMOVED

* _Removed_ **BootstrapClient.lua**. It was just sitting there doing nothing at all.

## [0.3.0.0] --- 24th May 2020 --- **_Stats, Sync U_**

### NEW

* _Created_ manual ***synchronize*** option in the **ModMenu**.
* _Created_ thumbnail for the mod.

### CHANGED

* _Moved_ JSON loading and stats-modification to `BootstrapServer.lua`
* `BootstrapClient.lua` is now deprecated as a result of the above.

## [0.2.0.0] --- 24th May 2020 --- **_JSON-Bourne_**

### NEW

* _Created_ `BootstrapClient.lua` - Reads `S7_Config.json` and applies stat-modifications.
* _Created_ basic **ModMenu**.

## [0.1.0.0] --- 24th May 2020 --- **_Osiris Init and ModVersioning_**

### NEW

* _Created_ `Initializer` and `ModVersioning` scripts.

## [0.1.0.0] --- 24th May 2020 --- **_Initial Commit_**

### NEW

* Initial Commit.
