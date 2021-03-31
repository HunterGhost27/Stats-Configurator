# **Stats Configurator**

## Divinity Original Sin 2: Definitive Edition

---

The **_Stats Configurator_** allows you to modify and customize stats by creating _config files_. Through the configuration file, you can change attributes like _action-points costs, cooldowns_ and _memory costs_ of **skills**; _gold-value, damage-values_ and _damage type_ of **weapons**; _resistances_ and _item-color_ of **armors**; _talents, accuracy_ and _dodge_ of **characters**; and many more.

## Releases

- ~~**_[Steam Workshop](#SteamWorkshop)_**~~
- **_[Github](https://github.com/Shresht7/Stats-Configurator/releases)_**

## Requirements

- **_[Norbyte's Script-Extender](https://github.com/Norbyte/ositools)_**

## Features

### Configure to your heart's desire

Users can override stats by creating **json files** (Default: `Config.json`) like so:

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

> Create your config-files in the Osiris Data\StatsConfigurator\ folder. - i.e. `..\Documents\Larian Studios\Divinity Original Sin 2 Definitive Edition\Osiris Data\StatsConfigurator\`.

When this configuration loads, it will override `Projectile_Fireball`. The **Fireball** skill will now cost **_4 ActionPoints_**, have a **_7 turn Cooldown_**, _explode_ in a **_10m radius_** and will be called **_BOOMER_**.

![Fireball-Example](https://imgur.com/Vc3NkF8.png)

**_Checkout more [examples!](Documentation/Examples.md)_**

### Quick Start

1. Create/Edit `Config.json` in `Osiris Data\StatsConfigurator\`.
2. `Load Configuration` from the in-game **mod-menu**.
3. `Rebuild ConfigData` once you're happy with your edits.
4. `Broadcast` your **ConfigData** to any peers. (Multiplayer)
5. `Verify` client configs to ensure everyone is on the same page.
6. **Done** - your **ConfigData** will automatically reload your edits whenever the game loads. Repeat the aforementioned options as necessary.
7. Restart the game for changes to apply.

============================

**_[READ THE EXTENSIVE DOCUMENTATION](Documentation/Extensive-Documentation.md)_**

============================

## Complementary Mods

- [**EXIM**](https://steamcommunity.com/sharedfiles/filedetails/?id=2006677782) by **_Luxen_** - EXIM allows you to export/import and modify characters stats, skills, inventory and hotbar.
- [**UI Components Library**](https://steamcommunity.com/sharedfiles/filedetails/?id=2337228868) - Enables the ContextMenu option to _apply configurations_.

---

## Thanks and Credits

- **[Divinity: Original Sin 2](http://store.steampowered.com/app/435150/Divinity_Original_Sin_2/)**, a game by **[Larian Studios](http://larian.com/)**.
- **LaughingLeader** for the **[Source Control Generator](https://github.com/LaughingLeader/SourceControlGenerator)**.
- Huge thanks to **Norbyte** for the **[Script-Extender](https://github.com/Norbyte/ositools)**, for valuable advice and for having a fix for every problem.
