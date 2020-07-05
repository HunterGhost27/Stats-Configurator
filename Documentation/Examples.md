# Example Configurations

Here are a few examples to show you what's possible using the **stats-configurator**. This list is by no means exhaustive and the mod is capable of a whole lot more. Take the [Quick-Tour](Documentation/QuickTour.md) if you're new to the mod or read the [extensive-documentation](Documentation/Extensive-Documentation.md) to get into the nitty gritty. Experiment with these examples, use your imagination and creativity, and don't forget to share your awesome configurations with me and the community.

---

- **[Fireball Modification](#Fireball-Modification)**
- **[Less Armor, More Vitality](#Less-Armor-More-Vitality)**
- **[Fashionista](#Fashionista)**
- **[That's-XCOM-Baby](#Thats-XCOM-Baby)**

---

## Fireball Modification

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

The ***Fireball*** skill is now called ***BOOMER***. It costs **4 Action-Points** and has a **7 turn Cooldown**. It explodes in a **10m Radius**.

![Fireball-Example](https://imgur.com/Vc3NkF8.png)

## Less Armor, More Vitality

```json
{
    "COLLECTION NonPlayerCharacters": {
        "Armor": 75,
        "MagicArmor": 75,
        "Vitality": 200
    }
}
```

Every **Non-Player-Character** will have their **Physical** and **Magic Armor** _reduced_ by **25%** and their **Vitality** _increased_ by **100%**. (**Note:** This affects **Max-Vitality**. Characters that have already been _"loaded"_ in-game will be wounded. Do this before starting a game or use a mod that heals partially-wounded NPCs.)

![Dallis-Armor-Config](https://imgur.com/DBhUcSK.png)

## Fashionista

```json
{
    "ARM_UNIQUE_AirRobe": {
        "ItemColor": "Red"
    }
}
```

This will change the color of **Gawin's Robes (ARM_UNIQUE_AirRobe)** to **Red**. **NOTE**: `ItemColor` names can be wierd, like `"DefaultGray", "Shelob", "MagisterRed"` etc.

![Item-Color-Config](https://imgur.com/ar7xTzX.png)

## That's XCOM Baby

```json
{
    "COLLECTION Character": {
        "Accuracy": 65,
        "APMaximum": 2,
        "APRecovery": 2
    },
    "COLLECTION SkillData": {
        "ActionPoints": 2
    }
}
```

All **Characters** have their base **Accuracy** set at **65%** and they _recover_ **2AP per turn** upto **2AP Maximum**. All Skill cost **2AP**.

![Accuracy-AP-Config](https://imgur.com/B9vRYbt.png)
