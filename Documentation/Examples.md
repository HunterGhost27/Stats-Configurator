# Example Configurations

Here are a few examples to show you what's possible using the **Stats-Configurator**. This list is by no means exhaustive, and you can do a whole lot more. Read the [extensive-documentation](Extensive-Documentation.md) to get into the nitty-gritty. If you're ever unsure about anything, you can always check out the [reference sheets](Extensive-Documentation.md#References). Experiment with these examples, use your imagination and creativity, and don't forget to share your awesome configs with everyone.

---

- **[Fireball Modification](#Fireball-Modification)**
- **[Less Armor, More Vitality](#Less-Armor-More-Vitality)**
- **[Fashionista](#Fashionista)**
- **[Nullify-Resistances' Saving-Throws Nullified](#nullify-resistances-saving-throws-nullified)**
- **[That's XCOM Baby](#Thats-XCOM-Baby)**
- **[Rivellon's Got Talent](#rivellons-got-talent)**
- **[Summons Galore](#summons-galore)**
- **[Light and Heavy Weapons](#light-and-heavy-weapons)**
- **[Translated String Handle](#translated-strings)**

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

The **_Fireball_** skill is now called **_BOOMER_**. It costs **4 Action-Points** and has a **7 turn Cooldown**. It _explodes_ in a **10m Radius**.

![Fireball-Example](https://imgur.com/Vc3NkF8.png)

## Less Armor, More Vitality

```json
{
  "#NonPlayerCharacters": {
    "*Armor": 0.5,
    "*MagicArmor": 0.5,
    "*Vitality": 2
  }
}
```

Every **_Non-Player-Character_** will have their **Physical** and **Magic-Armor** _halved_ and their **Vitality** _doubled_.

> **NOTE:** this affects **Maximum-Vitality** and not **Current-Vitality**. Characters that have already been _"loaded"_ in-game will have their max-HP increased but they will be wounded. Do this _before_ starting a new-game or use a mod that heals partially-wounded NPCs.

![Dallis-Armor-Config](https://imgur.com/i6uw3Ky.png)

## Fashionista

```json
{
  "ARM_UNIQUE_AirRobe": {
    "ItemColor": "Red"
  }
}
```

This will change the color of **Gawin's Robes** _(ARM_UNIQUE_AirRobe)_ to **Red**.

> **NOTE:** ItemColor labels can be weird, like `"DefaultGray", "Shelob", "MagisterRed"` etc.).

![Item-Color-Config](https://imgur.com/hvb9DYM.png)

## Nullify-Resistances' Saving-Throws Nullified

```json
{
  "NULLIFY_RESISTANCE": {
    "SavingThrow": "None"
  }
}
```

The status **Nullified Resistance** applied by the _Flay Skin_ skill will _no longer be resisted_ by **Magic Armor**.

![Flay-Skin](https://i.imgur.com/zr4YcAO.png)

> **P.S.:** Using `#StatusData` will remove _saving-throws_ from **all** status-effects!

## That's XCOM Baby

```json
{
  "#Character": {
    "Accuracy": 65,
    "-APMaximum": 2,
    "/APRecovery": 2
  },
  "#SkillData": {
    "ActionPoints": 2
  }
}
```

All **Characters** have their base **Accuracy** set at **65%**. **AP Recovery** is **halved** and **Max AP** is reduced by **2AP**. All Skill now cost **2AP**.

![Accuracy-AP-Config](https://imgur.com/glX91qP.png)

## Rivellon's Got Talent

```json
{
  "#Character": {
    "Talents": "AttackOfOpportunity;Rastilin"
  }
}
```

All **Characters** now only have **_Opportunist_** and **_Glass-Cannon_** talents.

![RivellonsGotTalent](https://imgur.com/XYIfDM2.png)

> **NOTE:** This replaced the old talent _WalkItOff_. While collections are super useful, you'd want to avoid making bulk edits like this if possible.

> Using the special attribute "+Talents" will append your config to the original list without replacing the original talents.

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
  "#WeaponTypeKnife": {
    "-AttackAPCost": 1,
    "+Initiative": 10,
    "+DodgeBoost": 15,
    "Damage Type": "Piercing"
  },
  "#WeaponIsTwoHanded": {
    "+AttackAPCost": 1,
    "CleaveAngle": 60,
    "CleavePercentage": 50,
    "AccuracyBoost": -25
  },
  "#WeaponTypeSpear": {
    "Damage Type": "Piercing"
  }
}
```

![LightAndHeavyWeapons](https://imgur.com/u58ACuM.png)

This example showcases how you can use this mod to make overhauls worth of changes. **_Daggers_** now cost **1AP to attack** and deal **Piercing damage**. They also grant the user **+10 initiative** and **+15% dodge**. **All TwoHanded Weapons** now cost **3AP to attack** at a _reduced_ **accuracy** but have a **60 degree cleave-angle** and deal **50% cleave-damage**. In addition, **spears** also deal **Piercing damage**.

## Translated Strings

```json
{
  "h0d186aeag65feg4ecdgb910g011dcaf0e4a7:TranslatedStringHandle" : "アレクサンダー司教はカモメに殺されました！"
}
```

![TranslatedStringHandle](https://imgur.com/tEZXdHt.png)

This example modifies `h0d186aeag65feg4ecdgb910g011dcaf0e4a7`, the *translated string handle* for Inspect's displayName.
> Notice how the key is suffixed with `:TranslatedStringHandle`. This is necessary for special stats like `:DeltaMod`, `:ItemCombo` etc.