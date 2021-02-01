# **Stats Configurator**

## Divinity Original Sin 2: Definitive Edition

---

The **_Stats Configurator_** allows you to modify and customize stats by creating _config files_. Through the configuration file, you can change attributes like _action-points costs, cooldowns_ and _memory costs_ of **skills**; _gold-value, damage-values_ and _damage type_ of **weapons**; _resistances_ and _item-color_ of **armors**; _talents, accuracy_ and _dodge_ of **characters**; and many more.

## Releases

- [ ] ~~**_[Steam Workshop](#SteamWorkshop)_**~~
- [ ] ~~**_[Nexus](#NexusMods)_**~~
- [x] **_[Github](https://github.com/Shresht7/Stats-Configurator/releases)_**

## Requirements

- **_[Norbyte's Script-Extender](https://github.com/Norbyte/ositools)_**

## Features

### Configure to your heart's desire

Users can override stats by creating a **json file** (Default: `Config.json`) like so:

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

> All config-files are created in the \*\*Osiris Data\StatsConfigurator\*\* folder. - i.e. `..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\Osiris Data\StatsConfigurator\`.

When this configuration loads, it will override `Projectile_Fireball`. The **Fireball** skill will now cost **_4 ActionPoints_**, have a **_7 turn Cooldown_**, _explode_ in a **_10m radius_** and will be called **_BOOMER_**.

![Fireball-Example](https://imgur.com/Vc3NkF8.png)

**_Checkout more [examples!](Documentation/Examples.md)_**

### Easily share your config in multiplayer

All configuration-profiles, _user-created_ or _mod-created_, are compiled into a single **ConfigData** file (Default: `ConfigData.json`). The mod applies these _stat-modifications_ when the game loads. Since this operation takes place locally on the `client-side`, all peers connected to the same game-session must have the same ConfigData file loaded. Having different ConfigData will mean that each client has different stats. For stats to be _synchronized_ between all clients, it is recommended that everyone loads the same ConfigData file. The host can manually share this file with their friends or send it to them from the in-game mod-menu.

### Settings

[Settings](Documentation/Extensive-Documentation.md#Settings) allow you to fine tune your experience and provide greater control over the mod's functionality. You can edit the `S7Central.json` file to change settings.

```json
{
  "ConfigFile": "S7_Config.json",
  "StatsLoader": { "Enable": true, "FileName": "S7_ConfigData.json" },
  "SyncStatPersistence": false
}
```

============================

**_[READ THE EXTENSIVE DOCUMENTATION](Documentation/Extensive-Documentation.md)_**

============================

---

## Thanks and Credits

- **[Divinity: Original Sin 2](http://store.steampowered.com/app/435150/Divinity_Original_Sin_2/)**, a game by **[Larian Studios](http://larian.com/)**.
- **LaughingLeader** for the **[Source Control Generator](https://github.com/LaughingLeader/SourceControlGenerator)**.
- **Norbyte** for the **[Script-Extender](https://github.com/Norbyte/ositools)**.
