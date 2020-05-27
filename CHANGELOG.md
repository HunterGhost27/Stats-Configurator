# Stats Configurator Changelog

----------

## [0.3.0.0] --- 27th May 20202 --- **_File I/O_**

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

* ***Loading*** JSON files is done by the ModMenu functions. Moving this out of **S7_StatsConfigurator()** allows other mods to pass a ***stringified JSON (JSONstring)***  to the function.

### REMOVED

* _Removed_ **BootstrapClient.lua**. It was just sitting there doing nothing at all.

## [0.3.0.0] --- 24th May 2020 --- **_Stats, Sync U_**

### NEW

* _Created_ manual ***synchronize*** option in the **ModMenu**.
* _Created_ thumbnail for the mod.

### CHANGED

* _Moved_ JSON loading and stats-modification to **BootstrapServer.lua**
* **BootstrapClient.lua** is now deprecated as a result of the above.

## [0.2.0.0] --- 24th May 2020 --- **_JSON-Bourne_**

### NEW

* _Created_ **BootstrapClient.lua** - Reads **S7_Config.json** and applies stat-modifications.
* _Created_ basic **ModMenu**.

## [0.1.0.0] --- 24th May 2020 --- **_Osiris Init and ModVersioning_**

### NEW

* _Created_ Initializer and ModVersioning scripts.

## [0.1.0.0] --- 24th May 2020 --- **_Initial Commit_**

### NEW

* Initial Commit.
