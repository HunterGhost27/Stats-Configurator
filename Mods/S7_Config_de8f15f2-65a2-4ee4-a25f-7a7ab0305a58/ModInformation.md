# Stats Configurator

=====================

## Mod Details

### Stats Configurator

- ***Mod Version***: *?ModVersion*
- ***Author***: ?ModAuthor
- ***Description***: The **Stats Configurator** allows you to *modify* and *customize* stats by creating ***config files***. Through the configuration file, you can change attributes like `action-points costs`, `cooldowns` and `memory costs` of *skills*; `gold-value`, `damage-values` and `damage type` of *weapons*; `resistances` and `item-color` of *armors*; `talents`, `accuracy` and `dodge` of *characters*; and many more.
- ===
- **CURRENT MOD SETTINGS**
- `ConfigFiles`: ?SettingsConfigFiles
- `SyncStatPersistence`: ?SettingsSyncStatPersistence
- `StatsLoader`: ?SettingsStatsLoader

## General Information

### Osiris Data

- The ***script-extender*** *reads from* and *writes* files to the `Osiris Data` folder (`..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\`). All **config-files** for this mod are located in the `StatsConfigurator\` subdirectory inside `Osiris Data`.

### Debug Console

- The mod uses the script-extender's *debug-console* to display a lot of useful information. The console is also used to input console-commands.
- ===
- The *debug-console* can be enabled by setting `CreateConsole` to `true` in `OsirisExtenderSettings.json`.
- Alternatively, if you use **LaughingLeader's Mod-Manager**, you can go to _Settings > Preferences > Script-Extender_, check `Enable Console Window`and then `Export Settings`.

### Config Files and ConfigData File

- **Config-Files** (default: `Config.json`) are what users write their configurations in. These files are used to apply configurations from the mod-menu.
- The **ConfigData File** (default: `ConfigData.json`) on the other hand is compiled by the mod. The **ConfigData** file is not meant to be directly edited by the user, it is used to store data in a more consolidated format and read automatically during `ModuleLoading` (provided **StatsLoader** is `enabled`). ConfigData is also where the mod stores any persistent cache.

### Host and Client Contexts

- The game is split into two contexts - the `server` and the `client`. There are significant differences between the two and they are completely isolated from one another. Due to these differences not all functionality is available to both contexts.
- The document will refer to the player that creates the `server` context as the `host`, and all other peers as `clients`.

## Stats-Configurator

### Stats-Configurator Items

- The *"Stats-Configurator"* item is granted to the **host-character** automatically as soon as they load into a game after activating this mod. The item is used to activate the *mod-menu dialog*. If you lose the item somehow, you can reacquire it using the `!S7_Config AddConfigurator` *console-command*.

### Stats-Configurator Mod-Menu

- The **mod-menu** allows you access most of the functionality of this mod; like *loading and sharing configurations* or changing *settings* etc.
- Since most of these functions require the `server` context, only the **host-character** is allowed to interact with the item. Any attempts, by the clients to use the item will redirect the dialog to the host-character.

### Stats-Configurator Context-Menu

- If you have the **UI-Components-Library** you can use the Context-Menu. The Context-Menu provides a one-click solution to *load and apply configs*.

### Applying Configurations

- Users create their configs in `json` files. These config-files can be loaded-in at any time by the **host-character** using the mod-menu's `Load Configuration` option. Users can safely test their configs before they _rebuild_ their **ConfigData** file. Some stat-edits (like skills) are applied instantaneously and most (like characters) will require a _save-and-reload_.
- ===
- These configurations are **not** saved persistently by _default_ (this can be changed in the **settings**); meaning, they'll be lost after the session closes. Stat-overrides can be made persistent by rebuilding the ConfigData file after loading a configuration (**recommended**) or loading the configuration when `SyncStatPersistence` is `enabled`.
- ===
- Stat-modifications from this file are loaded in the `server` context and are automatically synchronized to the clients afterwards. Clients connecting after this process may not have their stat synchronized to the server - you must reload the configuration if that is the case. You can also manually synchronize stats by using **console-commands**. Edited stats remain in memory until the game is closed, allowing you to synchronize all of them at will, should a client join after loading a configuration.
- ===
- Applying configurations this way is great for **prototyping** or making **temporary changes**. But otherwise, instead of re-applying configurations every session or making irreversible changes to your save-file (using `SyncStatPersistence`), you should export the configs to **ConfigData**. This will allow the StatsLoader(Read more below) to apply those edits automatically when the game loads.

### StatsLoader

- The **StatsLoader** is responsible for loading **ConfigData** during the `ModuleLoading`. Stat-modifications applied through the StatsLoader do not require additional synchronization.
- The only caveat here is that all clients **need** to have a local copy of the same ConfigData; otherwise, they will not have the same stats. The host-player can share their ConfigData file manually or *broadcast* it in-game from the mod-menu.
- ===
- **Broadcasting** the configuration profile will send the host's ConfigData file to all *connected clients* and save (/overwrite) it on their local system; however, all peer must then restart their game for the changes to apply.
- ===
- If the host wishes to check if their peers have the same ConfigData as them or not, they can **Verify Client Configs** to print out a response from the client's game to their debug-console. This way, the host can check if any peer is *out-of-sync* (or is deliberately cheating :P).
- ===
- Preferably, all custom stat-modifications should be applied through the **StatsLoader**, while active-loading should only be used for prototyping and testing. Users should export their configs to it if they wish them to apply automatically when the game loads.
- With the **default settings**, stat-overrides will not be stored persistently in the save-file, i.e. you'll lose those changes and will have to re-load the configuration file every game-session. You can enable stat-synchronization persistence using the **settings** and console-commands, however, the recommended approach is to save your configs to the ConfigData file. This can easily be done using the **Rebuild ConfigData** option in the Mod-Menu.

### Stat Persistence

- Stat-overrides can be saved persistently in the save-file so that those overrides are baked into the game-session. This will make sure those changes are always active for the server and the client. Norbyte did tell me this has hidden caveats but I forgot to ask for details.
- By default, `SyncStatPersistence` is disabled. This essentially means that all configs must be reloaded every game session. StatsLoader can do this automatically for you.

### Relative Changes

- By prefixing an stat-attribute with special characters you can modify the behaviour of the config-variable. This allows you to make relative changes instead of absolute ones.
- Please read the **extensive-documentation** for more details.

### Collections

- Trying to edit stats en-masse with the same values is both a redundant and time-consuming process. To solve this issue, stats can be grouped in a **collection** and configurations can be applied to all of them in-tandem. A collection is basically a list of stat-names/statIDs; whenever you apply stat-modifications to a collection, the modifications are applied to all stat-entries associated with the collection. For more details, please read the **extensive-documentation**.

### Modification of Special Stat-Types

- Certain stat-types like `DeltaMods`, `TreasureTables` and `TranslatedStrings` cannot be modified without the use of special functions. Such special statIDs should be suffixed with `:SpecialStatType` in the configs for the mod to know how to handle them. Checkout the **extensive-documentation** for more details.
- ===
- General stats like `Character`, `Armor` etc can also be suffixed with the corresponding types (`:Character`, `:Armor` etc) however it is not necessary.
- ===
- *A list of Special Stats*:
- DeltaMods
- EquipmentSets
- SkillSets
- Item Combination
- TranslatedString
- TranslatedStringHandle
- Treasure Table
- Treasure Category


## Additional Information

### Current Settings

- `ConfigFiles`: ?SettingsConfigFiles
- `SyncStatPersistence`: ?SettingsSyncStatPersistence
- `StatsLoader`: ?SettingsStatsLoader
- ===
- Custom Settings are loaded from `S7Central.json` in `Osiris Data`. Custom settings are applied automatically when `ModuleLoadStarted` event triggers, but can be reapplied whenever the host-user wants, using the mod-menu. Collections are automatically rebuilt everytime settings are refreshed. The mod-menu shows whether you're using the **default** settings or **custom** ones. Some simple settings can be toggled on-or-off from the mod-menu itself.

### Default Settings

- `ConfigFiles`: ["Config.json"]
- `SyncStatPersistence`: `false`
- `StatsLoader`: {
- `Enable`: `true`,
- `FileName`: "ConfigData.json"
- }
- ===
- These are the mod's **default settings**. The user can override these settings in `S7Central.json` in `Osiris Data`. Changes made in this file will take precedence over the default values when the mod loads. You can **Reapply Custom Settings** or **Reset To Default** from the stats-configurator ***mod-menu***.

### Reference

- Use `!S7_Config Help` for a detailed list of **console-commands**.
- ===
- If you wish to know the `statName`/`statID` of something specific, you can target it in-game using the ***Inspect skill***. The Inspect skill is a special skill that the host-character can learn through the miscellaneous option in the mod-menu.
- The skill does not cost any action-points or memory and you are completely free to use it whenever you chose. Targetting a character/Item by **Inspect** will print all the *statID*, *active status-effects* and *skills* the target has to the debug-console.
- When you are done with the skill you can "unlearn" it from the same menu. For a more comprehensive reference list, you can use the function described below.
- ===
- Alternatively, You can use the **console-command** `!S7_Config SearchStat SearchString SearchType`. This will search any stats that have `SearchStat` in their name. The optional argument `SearchType` will restrict the search to that stat-type only - it can be omitted to search everything. e.g. `!S7_Config SearchStat Dallis` will search all stat-entries for `Dallis` and return any matches. To narrow down the search to her character we can use `!S7_Config SearchStat Dallis Character`; this will only search for `Dallis` in stat-entries of the `Character` type.
- ===
- If you wish to retrieve all *attributes* and their corresponding *values* for a given stat you can use the `DeepDive` ***console-command***. `!S7_Config DeepDive Projectile_Fireball` will print absolutely everything related to stat `Projectile_Fireball`.
- ===
- Checkout the ***online documentation*** on the mod-page for more details.

## <font color='#3F784C'>Changelog</font>

### [v1.0.0.0]<font color='#888888'>: 1-Mar-2021</font>

- Initial Release.
