# Example Configurations

---

- **[Fireball Modification](#Fireball-Modification)**
- **[Less Armor, More Vitality](#Less-Armor,-More-Vitality)**
- **[That's-XCOM-Baby](#That's-XCOM-Baby)**

---

## Fireball Modification

```json
{
    "Projectile_Fireball": {
        "ActionPoints": 4,
        "Cooldown": 7,
        "ExplosionRadius": 10,
        "DisplayName": "BOOMER"
    }
}
```

The ***Fireball*** skill is now called ***BOOMER***. It costs **4 Action-Points** and has a **7 turn Cooldown**. It explodes in a **10m Radius**.

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

Every **Non-Player-Character** will have their **Physical** and **Magic Armor** _reduced_ by **25%** and their **Vitality** _increased_ by **100%**. (**Note:** This affects **Max-Vitality**. Characters that have already been loaded in-game will be wounded. Do this before starting a game.)

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
