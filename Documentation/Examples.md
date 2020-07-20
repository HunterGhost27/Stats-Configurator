# Example Configurations

Here are a few examples to show you what's possible using the **Stats-Configurator**. This list is by no means exhaustive, and the mod is capable of a lot more. Take the [quick-tour](Documentation/QuickTour.md) if you're new to the mod or read the [extensive-documentation](Documentation/Extensive-Documentation.md) to get into the nitty-gritty. If you're unsure about the in-engine names of certain attributes you can check out the [reference sheets](Extensive-Documentation.md#References). Experiment with these examples, use your imagination and creativity, and don't forget to share your awesome configs with everyone.

---

- **[Fireball Modification](#Fireball-Modification)**
- **[Less Armor, More Vitality](#Less-Armor-More-Vitality)**
- **[Fashionista](#Fashionista)**
- **[Nullify-Resistances' Saving-Throws Nullified](#nullify-resistances-saving-throws-nullified)**
- **[That's XCOM Baby](#Thats-XCOM-Baby)**
- **[Rivellon's Got Talent](#rivellons-got-talent)**
- **[Summons Galore](#summons-galore)**
- **[Light and Heavy Weapons](#light-and-heavy-weapons)**

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

The ***Fireball*** skill is now called ***BOOMER***. It costs **4 Action-Points** and has a **7 turn Cooldown**. It _explodes_ in a **10m Radius**.

![Fireball-Example](https://imgur.com/Vc3NkF8.png)

## Less Armor, More Vitality

```json
{
    "COLLECTION NonPlayerCharacters": {
        "Armor": 50,
        "MagicArmor": 50,
        "Vitality": 200
    }
}
```

Every **Non-Player-Character** will have their **Physical** and **Magic-Armor** reduced by **50%** and their **Vitality** increased by **100%**. (**Note:** this affects **Maximum-Vitality** and not **Current-Vitality**. Characters that have already been _"loaded"_ in-game will have their max-HP increaased but they will be wounded. Do this _before_ starting a new-game or use a mod that heals partially-wounded NPCs.) (***Also Note:** It is not uncommon to have the default values to these attributes be something other than 100. In such instances, changing these percentages may yield unintuitive results. For example: **Vitality: 200** is a nerf for a character that originally had **Vitality: 250**.)

![Dallis-Armor-Config](https://imgur.com/i6uw3Ky.png)

## Fashionista

```json
{
    "ARM_UNIQUE_AirRobe": {
        "ItemColor": "Red"
    }
}
```

This will change the color of **Gawin's Robes (ARM_UNIQUE_AirRobe)** to **Red**. (**Note**: ItemColor labels can be wierd, like `"DefaultGray", "Shelob", "MagisterRed"` etc.)

![Item-Color-Config](https://imgur.com/hvb9DYM.png)

## Nullify-Resistances' Saving-Throws Nullified

```json
{
    "NULLIFY_RESISTANCE": {
        "SavingThrow": "None"
    }
}
```

The status _Nullified Resistance_ applied by the **Flay Skin** skill will _no longer be resisted_ by **Magic Armor**.

![Flay-Skin](https://i.imgur.com/zr4YcAO.png)

**P.S.**: Using `COLLECTION StatusData` will remove _saving-throws_ from **all** status-effects!

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

All **Characters** have their base **Accuracy** set at **65%** and they recover **2AP per turn** upto **2AP Maximum**. All Skill now cost **2AP**.

![Accuracy-AP-Config](https://imgur.com/glX91qP.png)

## Rivellon's Got Talent

```json
{
    "COLLECTION Character": {
        "Talents": "AttackOfOpportunity;Rastilin"
    }
}
```

All **Characters** have the ***Opportunist*** and ***Glass-Cannon*** talent.

![RivellonsGotTalent](https://imgur.com/XYIfDM2.png)

**NOTE:** This replaced the old talent _WalkItOff_. While collections are super useful, you'd want to avoid making bulk edits like this if possible.

## Summons Galore

```json
{
    "Player_Fane": {
        "MaxSummons": 3,
        "APStart": 2,
        "APRecovery": 2
    }
}
```

![FaneSummoner](https://imgur.com/ujR8YjD.png)

**Fane** can now _summon_ upto 3 times. But only starts with **2AP** and _recovers_ **2AP per turn**.

## Light and Heavy Weapons

```json
{
    "COLLECTION WeaponTypeKnife": {
        "AttackAPCost": 1,
        "Initiative": 10,
        "DodgeBoost": 15,
        "Damage Type": "Piercing"
    },
    "COLLECTION IsTwoHandedWeapon": {
        "AttackAPCost": 3,
        "CleaveAngle": 60,
        "CleavePercentage": 50,
        "AccuracyBoost": -25
    },
    "COLLECTION WeaponTypeSpear": {
        "Damage Type": "Piercing"
    }
}
```

![LightAndHeavyWeapons](https://imgur.com/u58ACuM.png)

**Daggers** now cost **1AP to attack** and deal **Piercing damage**. They also grant the user **10 initiative** and **15% dodge**. **All TwoHanded Weapons** now cost **3AP to attack** at a _reduced_ **accuracy** but have a **60 degree cleave-angle** and deal **50% cleave-damage**. In addition, **spears** deal **Piercing damage**.
