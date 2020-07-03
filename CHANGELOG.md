# Stats Configurator Changelog

---

## [0.6.4.0] --- 3rd July 2020 --- **Logging Performance Improvement**

### NEW

- _Added_ `ExportLog()` at the end of independent functions. Should cover all cases.

### CHANGED

- `S7_ConfigLog()` only exports to the TSV file on function call `ExportLog()`. So it doesn't spam `Ext.LoadFile()` and `Ext.SaveFile()` 4 million times in a loop. Still hogs performance but nowhere nearly as much. - Will strategically place `ExportLog()` throughout the program later.

## [0.6.3.0] --- 1st July 2020 --- **_What's up doc?_**

### NEW

- _Started_ working on **documentation**. - I hate this stuff.
- _Updated_ the mod's description in `meta.lsx`.
- _Created_ `CONTRIBUTING.md` file.

## [0.6.2.0] --- 1st July 2020 --- **_Rework Time!_**

### NEW

- _Created_ a console command `S7_StatSearch` to search statIDs.
- New **Stat-Collections** for all-characters, npcs and statTypes.
- `StatsLoader` now respects **Load-Order**.
- **Stat-Creation** is back. Only works under specific conditions.
- console commands can pass signals to `S7_Config_ModMenuRelay()`.
- _Created_ help message for `Relay` console command.
- Github and Discord integration.

### CHANGED

- _Renamed_ `S7_ActiveConfig` broadcast channel to `S7_ConfigData`.
- _Moved_ user information stuff in `S7_ConfigAuxiliary.lua` from `S7_ConsoleCommander.lua`.
- `S7_InspectStats` **Reborn**.
- `S7_ExportStatIDtoTSV` simplified.
- _Dropped_ prefix from `table ConfigSettings`, `table DefaultSettings`, `func StatsLoader`, `func CatchBroadcast`, `func ValidJSONFile` and more. You get the idea.
- _Revamped_ networking.
- _Rebuilt_ `BuildConfigData()`.
- _Changed_ `S7_ConfigLog`, `S7_InspectStats` and `S7_SetDialogVars` to `NRD_ModCall`.
- _Dropped_ prefixes from `InspectStats` and `SetDialogVars`.
- _Reworked_ existing console commands to make use of client and host information.
- _Fake_ `DB_S7_Config_ModRegistry` entry. Just so its not empty.
- `ConfigLog` is disabled by default now.

## [0.6.1.0] --- 28th June 2020 --- **_Message-Boxes!_**

### NEW

- ~~Version updates now prompt a **message-box** for the host player, informing them about the update. I'll try to bind all mod-updates to a single prompt if possible in the future.~~ Will handle separately in `S7_Foundations` mod.
- ~~Results of `S7_InspectStats` are also shown in a **message-box** prompt.~~ Forgot how stupid the implementation of `S7_InspectStats` was. Reverted.

### CHANGED

- _Moved_ `S7_ConfigActive` flag from `S7_Config_ModVersioning` to `S7_Config_Initializer`. Needs to happen only once.

### COMMENTS

- Forget to create a new branch and all hell breaks loose.

## [0.6.1.0] --- 28th June 2020 --- **_Console Commanders_**

### NEW

- _Created_ `S7_AddSkill` console command.
- _Created_ `S7_RemoveSkill` console command.

## [0.6.0.0] --- 27th June 2020 --- **_Collections_**

### NEW

- _Created_ `S7_ConfigCollections.lua`.
- _Added_ functionality to `S7_StatsConfigurator` to handle **collections**. Not very happy with `S7_StatsConfigurator`. Will refactor later.
- _Added_ the ability to _create_ new stats in `S7_Config.json`. Once created stats can be exported to `S7_ConfigData.json`.

## [0.6.0.0] --- 27th June 2020 --- **_Finishing Quick-Menu_**

### NEW

- Dynamic Menu displays selected stat, attribute and value.
- Extensive commentary on `S7_ModInterface.lua`.
- `displayMessage` now reflects important `quickMenuVars.selectedActions`.

### FIXES

- `ModInterface.lua` required `S7_ConfigData.json` to exist before it did anything. Fixed.
- `quickMenuVars.selectedStat` selection was overwriting `quickMenuVars.configData`'s entries. Fixed.

### COMMENTS

- Everytime I take a break and return, I swear none of this makes any sense to me.

## [0.6.0.0] --- 15th June 2020 --- **_Interfacing_**

### NEW

- _Added_ dialog option to print **registered Mods**.
- _Added_ a flag `S7_ConfigActive` to notify that the mod is active.
- _Created_ prototype dynamic MCM for dependancy free, quick-setup mod-integrations.
- QuickMenu accounts for multiple pages if there are more than 5 options.

## [0.5.6.0] --- 12th June 2020 --- **_Still Fixing Stuff_**

### NEW

- _Added_ `Ref_Enumerations.xml` and `Ref_StatObjectDefinitions.xml` for reference.

### FIXED

- _Fixed_ `S7_BuildConfigData()`.

### COMMENT

- When does all this stuff even break? - I'm stuck in a perpetual loop of bug-fixing.

## [0.5.5.0] --- 10th June 2020 --- **_Rework Time_**

### NEW

- _Created_ `S7_Config_Inspect.txt`. Separated `Inspect` skill stuff from the `Mod-Menu`.

### CHANGED

- _Renamed_ `S7_DebugLog()` to `S7_ConfigLog()`.
- _Added_ Toggle option for `S7_ConfigLog`. - cuz options.
- _Changed_ how `S7_SafeToModify()` works. - Well, more like, _fixed_. as it probably never worked in the first place.
- Localization pass.

### COMMENTS

- More stuff that I forgot to document. As the saying goes, _"If you don't remember, it probably wasn't important. Probably."_

## [0.5.4.0] --- 6th June 2020 --- **_Broadcast_**

### NEW

- The `Server` can now broadcast the config file to all `clients`. The file is then saved locally on the client's machine.

### REMOVED

- `Notes.md` - wasn't that useful tbh.

### META

- _Created_ VSCode Workspace. _Added_ `*.code-workspace` to `.gitignore`.
- _Upped_ Extender Requirement to v47.

## [0.5.3.0] --- 5th June 2020 --- **_Restructuring_**

### NEW

- _Created_ `S7_Rematerialize()` for immediate translation of tables. No more `for-loop` spam.
- _Added_ the option to change `ActiveConfiguration`.
- Stat-edits are now staged before being exported to Active Configuration. Player can unstage changes.

## [0.5.2.5] --- 4th June 2020 --- **_Bad Day_**

### CHANGED

- _Renamed_ `dialogVarToSet` to `toSetDialogVar` for consistency.
- _Moved_ `S7_CustomOrDefaultSettings()` inside `S7_RefreshSettings()`. No need for it to be a global function.
- _Gutted_ `S7_UpdateSettingsVars()`. Redundant. [Update] - Not so redundant actually :P
- _Switched_ out switch-case from `S7_DebugLog()` for traditional `if-else lists`. Stopped working for whatever reason. I'm having a bad day. [Update] - I declared the variable `logType` and had been calling it `LogType` this whole time wondering why stuff didn't work.
- Anti-globalization movement. Made a whole lot of stuff `local`.
- Switch-case is back in! - Two dozen `LogType` typos executed for INSUBORDINATION.
- _Moved_ `S7_SetDialogVars()` to the bottom of `S7_ModMenuRelay()` as its the only place where `dialogVars` are needed and `Osiris` is guaranteed to be available. Also figured out why `S7_UpdateSettingVars()` and `S7_SetDialogVars()` were different functions - to make sure updates only happened when `Osiris` was ready.
- I think that's a complete circle. 14 hours I've spent doing this and I am essentially back to the code I started with. Atleast it works now.

## [0.5.2.0] --- 4th June 2020 --- **_Uh What?_**

### NEW

- Instead of loading and parsing json immediately, `StatsConfigurator()` now processes a queue of json strings stored in a table `toConfigure`. Decoupling should theoretically allow a more flexible and compatible approach. ~~(Buzzwords for: I done goofed.)~~

### COMMENTS

- _Merged_ `SAL` branch with `queue-loader` branch. Stuff of nightmares. I honestly don't know what I'm doing anymore.
- TFW you wake up one day and don't remember what half your code does.

## [0.5.2.0] --- 3rd June 2020 --- **_Smart-Logger_**

### NEW

- _Created_ `S7_DebugLog()` codenamed `SAL`.
- `SAL` logs messages to `DebugConsole`, to an external `tsv` and also sets dialog-vars all from one function.

### FIX

- _Changed_ scope of `dialogCase` to **Global**. Fixed issue where dialog-vars weren't being updated. Gave me a headache this one.

### META

- _Merged_ `S7_ConfigSettings.lua` into `S7_ConfigAuxiliary.lua`. Both files were highly interdependent.

## [0.5.1.0] --- 3rd June 2020 --- **_Improved ModMenu_**

### NEW

- _Added_ a settings toggle for `S7_StatsLoader()`.
- _Added_ **ModMenu** toggles for `StatsLoader`, `SyncStatPersistence` and `BypassSafetyCheck`.
- _Created_ `S7_UpdateSettingVars()` to reapply dialog-vars when necessary.
- _Created_ a **How-To** book item.

### META

- _Renamed_ `SCG/S7_Config_CHANGELOG.tsv` to `SCG/S7_Config_Items.tsv` since it now has multiple keys.

## [0.5.0.0] --- 2nd June 2020 --- **_The Return of the Client_**

### NEW

- `BootstrapClient.lua` returns. Loads json during `StatsLoaded` event.
- _Created_ `S7_SetDialogVars()` to apply **_dialog-var_** changes whenever the **ModMenu** throws a flag. Allows dialog-vars to be set even when **_osiris_** is unavailable as changes are stashed in table and only applied when **ModMenu** is accessed.

### CHANGED

- `S7_InspectStats()` moved in `BootstrapServer.lua` - `Ext.NewCall()` needs to be in that file.
- `SyncStat()` save-game persistence is set to `false` by default now.

### META

- `BootstrapServer.lua` split into multiple files.

## [0.4.2.0] --- 1st June 2020 --- **_Changelog_**

### NEW

- _Created_ **CHANGELOG** item.
- _Added_ dialog options to obtain **CHANGELOG**.

### META

- _Created_ NOTES.md - Cause nobody got time for Alt-Tabs

## [0.4.1.0] --- 1st June 2020 --- **_Still Setting Up_**

### NEW

- _Added_ a ModMenu option to **export** current **ConfigSettings** to `S7_ConfigSettings.json`.

### CHANGED

- `S7_ReapplySettings()` renamed to `S7_RefreshSettings()`.
- `RefreshSettings()` now properly works with a mix of default and custom imported settings.
- `S7_Config_CustomSettings.json` file renamed to `S7_ConfigSettings.json`.
- _Improved_ File Error-Handling.

## [0.4.0.0] --- 29th May 2020 --- **_Setting Up_**

### NEW

- Started working on custom settings.
- `SyncStat()` persistence can be toggled.
- `StatsConfigurator()` can read from **multiple config files**.
- `StatExportTSV()` can be **restricted** to certain `StatTypes`.
- Can bypass `SafeToModify()` function.

## [0.3.0.0] --- 28th May 2020 --- **_Minor Refactoring_**

### CHANGED

- Minor **_Refactoring_** pass. Renamed **FetchAll** to **ExportTSV**.

## [0.3.0.0] --- 27th May 2020 --- **_File I/O_**

### NEW

- _Created_ an ModMenu option to export all stats to a **TSV** file.

## [0.3.0.0] --- 26th May 2020 --- **_Code Clean-up_**

### NEW

- _Added_ dialog variables for some flags.

### CHANGED

- _Refactored_ **Inspector** item as a gear instead of an identifying-glass. Name changed to **Stats-Configurator**.
- _Changed_ **Inspect** skill-icon to the standard identifying-glass.
- _Moved_ dialog options around. Manual **Synchronization** moved inside **diagnostics** options. -still pretty useless, but hey peace of mind.

## [0.3.0.0] --- 25th May 2020 --- **_Inspector_**

### NEW

- _Created_ **Inspector** item. Using opens mod-menu.
- _Created_ **Inspect** skill that returns the **_stat-type_** and **_stat-name/stat-id_** of the target.

### CHANGED

- Loading JSON files is done by the ModMenu functions. Moving this out of `S7_StatsConfigurator()` allows other mods to pass a **_stringified JSON_** to the function.

### REMOVED

- _Removed_ **BootstrapClient.lua**. It was just sitting there doing nothing at all.

## [0.3.0.0] --- 24th May 2020 --- **_Stats Sync Up_**

### NEW

- _Created_ manual **_synchronize_** option in the **ModMenu**.
- _Created_ thumbnail for the mod.

### CHANGED

- _Moved_ JSON loading and stats-modification to `BootstrapServer.lua`
- `BootstrapClient.lua` is now deprecated as a result of the above.

## [0.2.0.0] --- 24th May 2020 --- **_JSON-Bourne_**

### NEW

- _Created_ `BootstrapClient.lua` - Reads `S7_Config.json` and applies stat-modifications.
- _Created_ basic **ModMenu**.

## [0.1.0.0] --- 24th May 2020 --- **_Osiris Init and ModVersioning_**

### NEW

- _Created_ `Initializer` and `ModVersioning` story-scripts.

## [0.1.0.0] --- 24th May 2020 --- **_Initial Commit_**

### NEW

- Initial Commit.
