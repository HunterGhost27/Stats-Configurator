# **Stats Configurator**

## Divinity Original Sin 2: Definitive Edition

----------

The **Stats Configurator** allows you to modify and customize stats. It's a tool for users to make changes to stat-entries by creating config files. It also allows other mods to interface with its functionality to achieve the same. Through configuration files, you can change attributes like action-points cost, cooldown, gold-value, display-name, damage-values and resistances, memory cost and many more.

## Releases

* ***[Steam Workshop](#SteamWorkshop)***
* ***[Nexus](#NexusMods)***

## Requirements

* ***[Script-Extender](https://github.com/Norbyte/ositools)***

## Mod at a Glance

* **Edit stats dynamically.** _Modify_, _customize_ and _rebalance_ the game as you see fit.
* _Edit_ a group of stats at the same time with **collections**. Use the **presets** or **create your own**.
* _Share_ your **config-data** with your **peers**. So everyone's on the same page.
* _Save_ your stat-overrides **persistently** in the save-file, or change them up each session.
* _Export_ a list of every single stat-entry for reference.
* _Use_ the _Inspect Skill_ to print stat-entries relevent to a target.
* Comprehensive _in-game_ diagnostics, changelogs and instructions.
* Can _interface_ with **other mods** and provide them the same power. Create **MCMs** for your mods!
* Dependency-free integration allows **quick setup** of mod-config-menus for your mod with some basic functionality.
* For more _advanced control_, the mod's functionality is available through **Lua**.
* Hate fiddling with _menus_ and _UI_. Use **console commands!** - Add or Remove Skills, Search for stats, and more.
* The mod is **highly configurable**. :)

## Features

### Configuration

Let's create a file in `Osiris Data` folder called `S7_Config.json` with the following content.

```json
{
    "Projectile_Fireball": {
        "ActionPoints": 4,
        "Cooldown": 7,
        "ExplodeRadius": 10,
        "DisplayName": "BOOMER"
    },
    "COLLECTION NonPlayerCharacters": {
        "Initiative": 10,
        "Constitution": 7,
        "Armor": 75,
        "MagicArmor": 75,
        "Vitality": 150
    },
    "COLLECTION PlayerCharacters": {
        "Accuracy": 75,
        "APMaximum": 4
    },
    "CON_Food_Pie_Apple_A": {
        "Value": "9001",
        "IsConsumable": "No",
        "Barter": 2
    },
    "ARM_UNIQUE_TeleportationGloves": {
        "Telekinesis": 5,
        "ItemColor": "Gold",
        "AirSpecialist": 2
    }
}
```

* The **Fireball** skill will now be called **BOOMER**, cost 4**AP** and have a 7-turn **cooldown**. It will also **explode** with a 10m radius.
* All **NPCs** will get 10 **initiative**, a level appropriate **constitution** based (weighted on 0 to 10 scale). Reduces **Physical** and **Magic Armors** by 25% but increases **Vitality** by 50%.
* **Accuracy** of all **Player-characters** is reduced to 75% (down from the vanilla 95%) and restricts the **maximum AP** to 4. No more AP abuse.
* **Apple-Pies** are now **unconsumable** and grant 2 **Barter** on-consumption (makes perfect sense, trust me). It's **value** is now **over 9000**.
* **Teleportation gloves** are now **gold** in color, grant 2 **aerotheurge** and 5 **telekinesis**.

----------

## My Other Mods

* ***[Scribe Scrolls and Skillbooks](https://steamcommunity.com/sharedfiles/filedetails/?id=2012742114)***
* ***[Declutter Skill-Panel](https://steamcommunity.com/sharedfiles/filedetails/?id=2049313850)***
* ***[Channel Source](https://steamcommunity.com/sharedfiles/filedetails/?id=2028696492)***

## Thanks and Credits

* **[Divinity: Original Sin 2](http://store.steampowered.com/app/435150/Divinity_Original_Sin_2/)**, a game by **[Larian Studios](http://larian.com/)**.
* **LaughingLeader** for the **[Source Control Generator](https://github.com/LaughingLeader/SourceControlGenerator)**.
* **Norbyte** for the **[Script-Extender](https://github.com/Norbyte/ositools)**.
