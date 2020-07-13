# Reference: Stat Object Definitions

---

## Table of Contents

- [Reference: Stat Object Definitions](#reference-stat-object-definitions)
  - [Table of Contents](#table-of-contents)
  - [Stats: Character](#stats-character)
  - [Stats: Potion](#stats-potion)
  - [Stats: Armor](#stats-armor)
  - [Stats: Object](#stats-object)
  - [Stats: Shield](#stats-shield)
  - [Stats: Weapon](#stats-weapon)
  - [TreasureTable: TreasureTable](#treasuretable-treasuretable)
  - [SkillData: SkillSet](#skilldata-skillset)
  - [Equipment: Equipment](#equipment-equipment)
  - [ItemCombos: ItemCombos](#itemcombos-itemcombos)
  - [ItemCombos: ItemComboProperties](#itemcombos-itemcomboproperties)
  - [ItemCombos: ObjectCategoriesItemComboPreviewData](#itemcombos-objectcategoriesitemcombopreviewdata)
  - [ItemCombos: CraftingStationsItemComboPreviewData](#itemcombos-craftingstationsitemcombopreviewdata)
  - [ItemProgression: ItemProgressionVisuals](#itemprogression-itemprogressionvisuals)
  - [ExtraData: Requirements](#extradata-requirements)
  - [Crimes: Crimes](#crimes-crimes)
  - [TreasureTable: TreasureGroups](#treasuretable-treasuregroups)
  - [DeltaModifier: DeltaModifier](#deltamodifier-deltamodifier)
  - [ItemColor: ItemColor](#itemcolor-itemcolor)
  - [ItemProgression: ItemProgressionNames](#itemprogression-itemprogressionnames)
  - [ExtraData: Data](#extradata-data)
  - [ItemTypes: ItemTypes](#itemtypes-itemtypes)
  - [SkillData: Projectile](#skilldata-projectile)
  - [SkillData: ProjectileStrike](#skilldata-projectilestrike)
  - [SkillData: Target](#skilldata-target)
  - [SkillData: Cone](#skilldata-cone)
  - [SkillData: Zone](#skilldata-zone)
  - [SkillData: MultiStrike](#skilldata-multistrike)
  - [SkillData: Quake](#skilldata-quake)
  - [SkillData: Storm](#skilldata-storm)
  - [SkillData: Rush](#skilldata-rush)
  - [SkillData: Jump](#skilldata-jump)
  - [SkillData: Tornado](#skilldata-tornado)
  - [SkillData: Wall](#skilldata-wall)
  - [SkillData: Teleportation](#skilldata-teleportation)
  - [SkillData: Path](#skilldata-path)
  - [SkillData: Rain](#skilldata-rain)
  - [SkillData: Summon](#skilldata-summon)
  - [SkillData: Shout](#skilldata-shout)
  - [SkillData: Dome](#skilldata-dome)
  - [StatusData: Status_CONSUME](#statusdata-status_consume)
  - [StatusData: Status_DAMAGE](#statusdata-status_damage)
  - [StatusData: Status_HEAL](#statusdata-status_heal)
  - [StatusData: Status_HEALING](#statusdata-status_healing)
  - [StatusData: Status_FEAR](#statusdata-status_fear)
  - [StatusData: Status_POLYMORPHED](#statusdata-status_polymorphed)
  - [StatusData: Status_KNOCKED_DOWN](#statusdata-status_knocked_down)
  - [StatusData: Status_STANCE](#statusdata-status_stance)
  - [StatusData: Status_INCAPACITATED](#statusdata-status_incapacitated)
  - [StatusData: Status_BLIND](#statusdata-status_blind)
  - [StatusData: Status_GUARDIAN_ANGEL](#statusdata-status_guardian_angel)
  - [StatusData: Status_DAMAGE_ON_MOVE](#statusdata-status_damage_on_move)
  - [StatusData: Status_DEMONIC_BARGAIN](#statusdata-status_demonic_bargain)
  - [StatusData: Status_CHALLENGE](#statusdata-status_challenge)
  - [StatusData: Status_FLOATING](#statusdata-status_floating)
  - [StatusData: Status_THROWN](#statusdata-status_thrown)
  - [StatusData: Status_DISARMED](#statusdata-status_disarmed)
  - [StatusData: Status_HEAL_SHARING](#statusdata-status_heal_sharing)
  - [StatusData: Status_HEAL_SHARING_CASTER](#statusdata-status_heal_sharing_caster)
  - [StatusData: Status_ACTIVE_DEFENSE](#statusdata-status_active_defense)
  - [StatusData: Status_SPARK](#statusdata-status_spark)
  - [StatusData: Status_PLAY_DEAD](#statusdata-status_play_dead)
  - [StatusData: Status_INVISIBLE](#statusdata-status_invisible)
  - [StatusData: Status_DEACTIVATED](#statusdata-status_deactivated)
  - [StatusData: Status_EFFECT](#statusdata-status_effect)
  - [StatusData: Status_EXTRA_TURN](#statusdata-status_extra_turn)
  - [StatusData: Status_CHARMED](#statusdata-status_charmed)
  - [StatusData: Status_MUTED](#statusdata-status_muted)
  - [StatusData: Status_DECAYING_TOUCH](#statusdata-status_decaying_touch)

---

## Stats: Character

|      | @name                         | @type           | @enumeration_type_name | @description                                                                                                                                                                                            |
| ---: | :---------------------------- | :-------------- | :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|    0 | Name                          | Name            |                        |                                                                                                                                                                                                         |
|    1 | Using                         | BaseClass       |                        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                                                                                               |
|    2 | Act                           | Enumeration     | Act                    |                                                                                                                                                                                                         |
|    3 | Act part                      | Enumeration     | ActPart                |                                                                                                                                                                                                         |
|    4 | Act strength                  | Enumeration     | Penalty Qualifier      |                                                                                                                                                                                                         |
|    5 | Strength                      | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 |
|    6 | Finesse                       | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 |
|    7 | Intelligence                  | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 |
|    8 | Constitution                  | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 |
|    9 | Memory                        | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 |
|   10 | Wits                          | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 |
|   11 | Armor                         | Integer         |                        | Enter a positive percentage value. 100 will give you average Armour amount for a heavy character of corresponding level.                                                                                |
|   12 | ArmorBoost                    | Integer         |                        | Enter a percentage value that will modify base Armour. E.g. -50 will halve current armour, 50 will produce 150% base armour. Helpful if you are inheriting and need 200% Armour compared to the parent. |
|   13 | ArmorBoostGrowthPerLevel      | Integer         |                        | This parameter increases ArmorBoost by (Level-1)*param*0.1                                                                                                                                              |
|   14 | MagicArmor                    | Integer         |                        | Enter a positive percentage value. 100 will give you average Armour amount for a heavy character of corresponding level.                                                                                |
|   15 | MagicArmorBoost               | Integer         |                        | Enter a percentage value that will modify base Armour. E.g. -50 will halve current armour, 50 will produce 150% base armour. Helpful if you are inheriting and need 200% Armour compared to the parent. |
|   16 | MagicArmorBoostGrowthPerLevel | Integer         |                        | This parameter increases MagicArmorBoost by (Level-1)*param*0.1                                                                                                                                         |
|   17 | Reflexes                      | String          |                        |                                                                                                                                                                                                         |
|   18 | Vitality                      | Integer         |                        | Enter a positive percentage value. 100 will give you average Vitality amount for a character of corresponding level.                                                                                    |
|   19 | DamageBoost                   | Integer         |                        | Enter a percentage value, can be negative. E.g. -30 will reduce all damage inflicted by this character by 30%.                                                                                          |
|   20 | DamageBoostGrowthPerLevel     | Integer         |                        | This parameter increase DamageBoost by (Level-1)*param*0.1                                                                                                                                              |
|   21 | MagicPoints                   | Integer         |                        | Maximum amount of Source Points the character can hold                                                                                                                                                  |
|   22 | ChanceToHitBoost              | Integer         |                        |                                                                                                                                                                                                         |
|   23 | APMaximum                     | Integer         |                        |                                                                                                                                                                                                         |
|   24 | APStart                       | Integer         |                        | AP granted at the start of combat.                                                                                                                                                                      |
|   25 | APRecovery                    | Integer         |                        | AP restored each turn                                                                                                                                                                                   |
|   26 | MPStart                       | Integer         |                        | Source Points amount on character creation                                                                                                                                                              |
|   27 | Movement                      | Integer         |                        | Distance in centimeters per AP spent on movement in combat.                                                                                                                                             |
|   28 | MovementSpeedBoost            | Integer         |                        | Percentage value, 50 produces a character with 150% base Movement.                                                                                                                                      |
|   29 | Gain                          | Enumeration     | BigQualifier           | Enter a positive percentage value. E.g. level 3 character with '5' Gain will produce enough XP to cover 5% of experience needed to advance from level 3 to level 4.                                     |
|   30 | Sight                         | Enumeration     | Penalty Qualifier      |                                                                                                                                                                                                         |
|   31 | Hearing                       | Enumeration     | Penalty Qualifier      |                                                                                                                                                                                                         |
|   32 | Initiative                    | Integer         |                        |                                                                                                                                                                                                         |
|   33 | FOV                           | Integer         |                        |                                                                                                                                                                                                         |
|   34 | Weight                        | Integer         |                        | In grams, relevant for some types of puzzles.                                                                                                                                                           |
|   35 | StepsType                     | Enumeration     | StepsType              |                                                                                                                                                                                                         |
|   36 | PiercingResistance            | Integer         |                        | Enter a percentage value, can be negative.                                                                                                                                                              |
|   37 | PhysicalResistance            | Integer         |                        | Enter a percentage value, can be negative.                                                                                                                                                              |
|   38 | CriticalChance                | Enumeration     | Penalty Qualifier      |                                                                                                                                                                                                         |
|   39 | MaxResistance                 | Integer         |                        | Enter a positive percentage value. Default cap is 200.                                                                                                                                                  |
|   40 | FireResistance                | Integer         |                        | Enter a percentage value, can be negative.                                                                                                                                                              |
|   41 | EarthResistance               | Integer         |                        | Enter a percentage value, can be negative.                                                                                                                                                              |
|   42 | WaterResistance               | Integer         |                        | Enter a percentage value, can be negative.                                                                                                                                                              |
|   43 | AirResistance                 | Integer         |                        | Enter a percentage value, can be negative.                                                                                                                                                              |
|   44 | PoisonResistance              | Integer         |                        | Enter a percentage value, can be negative.                                                                                                                                                              |
|   45 | SingleHanded                  | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   46 | TwoHanded                     | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   47 | Ranged                        | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   48 | DualWielding                  | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   49 | Leadership                    | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   50 | PainReflection                | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   51 | Perseverance                  | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   52 | RogueLore                     | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   53 | WarriorLore                   | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   54 | RangerLore                    | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   55 | FireSpecialist                | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   56 | WaterSpecialist               | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   57 | AirSpecialist                 | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   58 | EarthSpecialist               | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   59 | Sourcery                      | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   60 | Necromancy                    | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   61 | Polymorph                     | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   62 | Summoning                     | Integer         |                        | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     |
|   63 | Telekinesis                   | Integer         |                        | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     |
|   64 | Sneaking                      | Integer         |                        | Enter a flat value. Civil Ability cap is 5.                                                                                                                                                             |
|   65 | Thievery                      | Integer         |                        | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     |
|   66 | Loremaster                    | Integer         |                        | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     |
|   67 | Repair                        | Integer         |                        | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     |
|   68 | Barter                        | Integer         |                        | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     |
|   69 | Persuasion                    | Integer         |                        | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     |
|   70 | Luck                          | Integer         |                        | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     |
|   71 | Accuracy                      | Integer         |                        | Enter a percentage value                                                                                                                                                                                |
|   72 | Dodge                         | Integer         |                        | Enter a percentage value                                                                                                                                                                                |
|   73 | Reflection                    | String          |                        |                                                                                                                                                                                                         |
|   74 | MaxSummons                    | Integer         |                        |                                                                                                                                                                                                         |
|   75 | ExtraProperties               | String          |                        |                                                                                                                                                                                                         |
|   76 | Flags                         | EnumerationList | AttributeFlags         |                                                                                                                                                                                                         |
|   77 | Talents                       | String          |                        |                                                                                                                                                                                                         |
|   78 | Traits                        | String          |                        |                                                                                                                                                                                                         |
|   79 | PathInfluence                 | String          |                        |                                                                                                                                                                                                         |
|   80 | Comment                       | Comment         |                        |                                                                                                                                                                                                         |

## Stats: Potion

|      | @name                      | @type           | @enumeration_type_name   | @description                                                                                                                                                        |
| ---: | :------------------------- | :-------------- | :----------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|    0 | Name                       | Name            |                          |                                                                                                                                                                     |
|    1 | Using                      | BaseClass       |                          | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                                                           |
|    2 | RootTemplate               | RootTemplate    |                          |                                                                                                                                                                     |
|    3 | Act                        | Enumeration     | Act                      |                                                                                                                                                                     |
|    4 | Act part                   | Enumeration     | ActPart                  |                                                                                                                                                                     |
|    5 | Act strength               | String          |                          |                                                                                                                                                                     |
|    6 | StackId                    | String          |                          |                                                                                                                                                                     |
|    7 | ComboCategory              | String          |                          |                                                                                                                                                                     |
|    8 | AuraRadius                 | Integer         |                          |                                                                                                                                                                     |
|    9 | AuraSelf                   | String          |                          |                                                                                                                                                                     |
|   10 | AuraAllies                 | String          |                          |                                                                                                                                                                     |
|   11 | AuraNeutrals               | String          |                          |                                                                                                                                                                     |
|   12 | AuraEnemies                | String          |                          |                                                                                                                                                                     |
|   13 | AuraItems                  | String          |                          |                                                                                                                                                                     |
|   14 | AuraFX                     | String          |                          |                                                                                                                                                                     |
|   15 | Weight                     | Integer         |                          |                                                                                                                                                                     |
|   16 | Value                      | Integer         |                          |                                                                                                                                                                     |
|   17 | Strength                   | Enumeration     | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      |
|   18 | Finesse                    | Enumeration     | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      |
|   19 | Intelligence               | Enumeration     | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      |
|   20 | Constitution               | Enumeration     | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      |
|   21 | Memory                     | Enumeration     | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      |
|   22 | Wits                       | Enumeration     | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      |
|   23 | SingleHanded               | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   24 | TwoHanded                  | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   25 | Ranged                     | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   26 | DualWielding               | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   27 | PhysicalArmorMastery       | String          |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   28 | MagicArmorMastery          | String          |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   29 | VitalityMastery            | String          |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   30 | PainReflection             | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   31 | WarriorLore                | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   32 | RangerLore                 | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   33 | RogueLore                  | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   34 | Sourcery                   | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   35 | Telekinesis                | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   36 | FireSpecialist             | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   37 | WaterSpecialist            | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   38 | AirSpecialist              | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   39 | EarthSpecialist            | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   40 | Necromancy                 | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   41 | Polymorph                  | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   42 | Summoning                  | Integer         |                          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       |
|   43 | Sneaking                   | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   44 | Thievery                   | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   45 | Loremaster                 | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   46 | Repair                     | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   47 | Barter                     | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   48 | Persuasion                 | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   49 | Leadership                 | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   50 | Luck                       | Integer         |                          | Enter a flat value. Civil Ability cap is 5.                                                                                                                         |
|   51 | FireResistance             | Integer         |                          | Enter a percentage value, can be negative.                                                                                                                          |
|   52 | EarthResistance            | Integer         |                          | Enter a percentage value, can be negative.                                                                                                                          |
|   53 | WaterResistance            | Integer         |                          | Enter a percentage value, can be negative.                                                                                                                          |
|   54 | AirResistance              | Integer         |                          | Enter a percentage value, can be negative.                                                                                                                          |
|   55 | PoisonResistance           | Integer         |                          | Enter a percentage value, can be negative.                                                                                                                          |
|   56 | PiercingResistance         | Integer         |                          | Enter a percentage value, can be negative.                                                                                                                          |
|   57 | PhysicalResistance         | Integer         |                          | Enter a percentage value, can be negative.                                                                                                                          |
|   58 | Sight                      | Integer         |                          |                                                                                                                                                                     |
|   59 | Hearing                    | Enumeration     | Penalty Qualifier        |                                                                                                                                                                     |
|   60 | Initiative                 | Integer         |                          |                                                                                                                                                                     |
|   61 | Movement                   | Integer         |                          | Enter a flat value in centimeters.                                                                                                                                  |
|   62 | MovementSpeedBoost         | Integer         |                          | Enter a percentage value, can be negative.                                                                                                                          |
|   63 | Vitality                   | Integer         |                          | Enter a percentage value. Potion will heal the character for Vitality amount provided by code. E.g. 100 is the standard heal amount for the level of the character. |
|   64 | VitalityBoost              | Integer         |                          | Enter a percentage value, can be negative. E.g. '10' produces you +10% character's base maximum Vitality.                                                           |
|   65 | VitalityPercentage         | Integer         |                          | Enter a positive percentage value. Potion will heal the character for Vitality amount equal to the percentage of their maximum Vitality.                            |
|   66 | ChanceToHitBoost           | Integer         |                          |                                                                                                                                                                     |
|   67 | AccuracyBoost              | Integer         |                          |                                                                                                                                                                     |
|   68 | DodgeBoost                 | Integer         |                          |                                                                                                                                                                     |
|   69 | DamageBoost                | Integer         |                          |                                                                                                                                                                     |
|   70 | RangeBoost                 | Integer         |                          |                                                                                                                                                                     |
|   71 | APCostBoost                | Integer         |                          |                                                                                                                                                                     |
|   72 | SPCostBoost                | Integer         |                          |                                                                                                                                                                     |
|   73 | APMaximum                  | Integer         |                          |                                                                                                                                                                     |
|   74 | APStart                    | Integer         |                          |                                                                                                                                                                     |
|   75 | APRecovery                 | Integer         |                          |                                                                                                                                                                     |
|   76 | CriticalChance             | Integer         |                          |                                                                                                                                                                     |
|   77 | Gain                       | Enumeration     | BigQualifier             |                                                                                                                                                                     |
|   78 | Armor                      | Integer         |                          | Enter a percentage value, can be negative. Code will turn it into a flat bonus\malus. E.g. '50' produces half of an average Armour buff.                            |
|   79 | ArmorBoost                 | Integer         |                          | Enter a percentage value, can be negative. This value modifies character's maximum Armour by a percentage. E.g. '10' produces +10% of character's maximum Armour.   |
|   80 | MagicArmor                 | Integer         |                          | Enter a percentage value, can be negative. Code will turn it into a flat bonus\malus. E.g. '50' produces half of an average Armour buff.                            |
|   81 | MagicArmorBoost            | Integer         |                          | Enter a percentage value, can be negative. This value modifies character's maximum Armour by a percentage. E.g. '10' produces +10% of character's maximum Armour.   |
|   82 | Duration                   | Integer         |                          |                                                                                                                                                                     |
|   83 | UseAPCost                  | Integer         |                          |                                                                                                                                                                     |
|   84 | Reflection                 | String          |                          |                                                                                                                                                                     |
|   85 | LifeSteal                  | Integer         |                          | Enter a positive percentage value. Any damage to Vitality that owner character inflicts will turn into a heal modified by this percentage value.                    |
|   86 | Damage                     | Enumeration     | Qualifier                | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage.                                 |
|   87 | Damage Multiplier          | Integer         |                          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                                                           |
|   88 | Damage Range               | Integer         |                          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                                                  |
|   89 | DamageType                 | Enumeration     | Damage Type              |                                                                                                                                                                     |
|   90 | ActionPoints               | Integer         |                          |                                                                                                                                                                     |
|   91 | MagicPoints                | Integer         |                          |                                                                                                                                                                     |
|   92 | BloodSurfaceType           | String          |                          |                                                                                                                                                                     |
|   93 | MaxSummons                 | Integer         |                          |                                                                                                                                                                     |
|   94 | AddToBottomBar             | Enumeration     | YesNo                    |                                                                                                                                                                     |
|   95 | ExtraProperties            | String          |                          |                                                                                                                                                                     |
|   96 | BoostConditions            | String          |                          |                                                                                                                                                                     |
|   97 | Flags                      | EnumerationList | AttributeFlags           |                                                                                                                                                                     |
|   98 | BonusWeapon                | String          |                          | Enter a stat name from Weapon file.                                                                                                                                 |
|   99 | StatusEffect               | String          |                          |                                                                                                                                                                     |
|  100 | StatusIcon                 | String          |                          |                                                                                                                                                                     |
|  101 | StatusMaterial             | String          |                          |                                                                                                                                                                     |
|  102 | SavingThrow                | Enumeration     | SavingThrow              |                                                                                                                                                                     |
|  103 | InventoryTab               | Enumeration     | InventoryTabs            |                                                                                                                                                                     |
|  104 | UnknownBeforeConsume       | Enumeration     | YesNo                    |                                                                                                                                                                     |
|  105 | IsConsumable               | Enumeration     | YesNo                    |                                                                                                                                                                     |
|  106 | IsFood                     | Enumeration     | YesNo                    |                                                                                                                                                                     |
|  107 | SummonLifelinkModifier     | Integer         |                          |                                                                                                                                                                     |
|  108 | IgnoredByAI                | Enumeration     | YesNo                    |                                                                                                                                                                     |
|  109 | AiCalculationStatsOverride | String          |                          |                                                                                                                                                                     |
|  110 | RuneLevel                  | Integer         |                          |                                                                                                                                                                     |
|  111 | RuneEffectWeapon           | String          |                          |                                                                                                                                                                     |
|  112 | RuneEffectUpperbody        | String          |                          |                                                                                                                                                                     |
|  113 | RuneEffectAmulet           | String          |                          |                                                                                                                                                                     |
|  114 | ObjectCategory             | String          |                          |                                                                                                                                                                     |
|  115 | MinAmount                  | Integer         |                          |                                                                                                                                                                     |
|  116 | MaxAmount                  | Integer         |                          |                                                                                                                                                                     |
|  117 | Priority                   | Integer         |                          |                                                                                                                                                                     |
|  118 | Unique                     | Integer         |                          |                                                                                                                                                                     |
|  119 | MinLevel                   | Integer         |                          |                                                                                                                                                                     |
|  120 | MaxLevel                   | Integer         |                          |                                                                                                                                                                     |
|  121 | Comment                    | Comment         |                          |                                                                                                                                                                     |

## Stats: Armor

|      | @name                  | @type           | @enumeration_type_name | @description                                                                                                        |
| ---: | :--------------------- | :-------------- | :--------------------- | :------------------------------------------------------------------------------------------------------------------ |
|    0 | Name                   | Name            |                        |                                                                                                                     |
|    1 | Using                  | BaseClass       |                        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.           |
|    2 | ItemGroup              | String          |                        |                                                                                                                     |
|    3 | ModifierType           | Enumeration     | ModifierType           |                                                                                                                     |
|    4 | Act                    | Enumeration     | Act                    |                                                                                                                     |
|    5 | Act part               | Enumeration     | ActPart                |                                                                                                                     |
|    6 | Slot                   | Enumeration     | Itemslot               |                                                                                                                     |
|    7 | Requirements           | String          |                        |                                                                                                                     |
|    8 | Armor Defense Value    | Integer         |                        | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |
|    9 | ArmorBoost             | Integer         |                        | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base.              |
|   10 | Magic Armor Value      | Integer         |                        | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |
|   11 | MagicArmorBoost        | Integer         |                        | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base.              |
|   12 | Durability             | Integer         |                        |                                                                                                                     |
|   13 | DurabilityDegradeSpeed | Enumeration     | Qualifier              |                                                                                                                     |
|   14 | Value                  | Integer         |                        |                                                                                                                     |
|   15 | Weight                 | Integer         |                        |                                                                                                                     |
|   16 | Movement               | Integer         |                        | Enter a flat value in centimeters.                                                                                  |
|   17 | Initiative             | Integer         |                        |                                                                                                                     |
|   18 | Fire                   | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   19 | Air                    | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   20 | Water                  | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   21 | Earth                  | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   22 | Poison                 | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   23 | Piercing               | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   24 | Physical               | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   25 | StrengthBoost          | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   26 | FinesseBoost           | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   27 | IntelligenceBoost      | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   28 | ConstitutionBoost      | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   29 | MemoryBoost            | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   30 | WitsBoost              | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   31 | SingleHanded           | Integer         |                        |                                                                                                                     |
|   32 | TwoHanded              | Integer         |                        |                                                                                                                     |
|   33 | Ranged                 | Integer         |                        |                                                                                                                     |
|   34 | DualWielding           | Integer         |                        |                                                                                                                     |
|   35 | Perseverance           | Integer         |                        |                                                                                                                     |
|   36 | Leadership             | Integer         |                        |                                                                                                                     |
|   37 | PainReflection         | Integer         |                        |                                                                                                                     |
|   38 | WarriorLore            | Integer         |                        |                                                                                                                     |
|   39 | RangerLore             | Integer         |                        |                                                                                                                     |
|   40 | RogueLore              | Integer         |                        |                                                                                                                     |
|   41 | Sourcery               | Integer         |                        |                                                                                                                     |
|   42 | FireSpecialist         | Integer         |                        |                                                                                                                     |
|   43 | WaterSpecialist        | Integer         |                        |                                                                                                                     |
|   44 | AirSpecialist          | Integer         |                        |                                                                                                                     |
|   45 | EarthSpecialist        | Integer         |                        |                                                                                                                     |
|   46 | Necromancy             | Integer         |                        |                                                                                                                     |
|   47 | Polymorph              | Integer         |                        |                                                                                                                     |
|   48 | Summoning              | Integer         |                        |                                                                                                                     |
|   49 | Telekinesis            | Integer         |                        |                                                                                                                     |
|   50 | Sneaking               | Integer         |                        |                                                                                                                     |
|   51 | Thievery               | Integer         |                        |                                                                                                                     |
|   52 | Loremaster             | Integer         |                        |                                                                                                                     |
|   53 | Repair                 | Integer         |                        |                                                                                                                     |
|   54 | Barter                 | Integer         |                        |                                                                                                                     |
|   55 | Persuasion             | Integer         |                        |                                                                                                                     |
|   56 | Luck                   | Integer         |                        |                                                                                                                     |
|   57 | SightBoost             | Enumeration     | Penalty Qualifier      |                                                                                                                     |
|   58 | HearingBoost           | Enumeration     | Penalty Qualifier      |                                                                                                                     |
|   59 | VitalityBoost          | Integer         |                        |                                                                                                                     |
|   60 | MagicPointsBoost       | Enumeration     | Penalty Qualifier      |                                                                                                                     |
|   61 | ChanceToHitBoost       | Integer         |                        |                                                                                                                     |
|   62 | APMaximum              | Integer         |                        |                                                                                                                     |
|   63 | APStart                | Integer         |                        |                                                                                                                     |
|   64 | APRecovery             | Integer         |                        |                                                                                                                     |
|   65 | AccuracyBoost          | Integer         |                        |                                                                                                                     |
|   66 | DodgeBoost             | Integer         |                        |                                                                                                                     |
|   67 | CriticalChance         | Integer         |                        |                                                                                                                     |
|   68 | Reflection             | String          |                        |                                                                                                                     |
|   69 | MaxSummons             | Integer         |                        |                                                                                                                     |
|   70 | Skills                 | String          |                        |                                                                                                                     |
|   71 | Talents                | String          |                        |                                                                                                                     |
|   72 | Tags                   | String          |                        |                                                                                                                     |
|   73 | ExtraProperties        | String          |                        |                                                                                                                     |
|   74 | Flags                  | EnumerationList | AttributeFlags         |                                                                                                                     |
|   75 | Boosts                 | String          |                        |                                                                                                                     |
|   76 | ComboCategory          | String          |                        |                                                                                                                     |
|   77 | InventoryTab           | Enumeration     | InventoryTabs          |                                                                                                                     |
|   78 | ArmorType              | Enumeration     | ArmorType              |                                                                                                                     |
|   79 | ItemColor              | String          |                        |                                                                                                                     |
|   80 | NeedsIdentification    | Enumeration     | YesNo                  |                                                                                                                     |
|   81 | Charges                | Integer         |                        |                                                                                                                     |
|   82 | MaxCharges             | Integer         |                        |                                                                                                                     |
|   83 | RuneSlots              | Integer         |                        |                                                                                                                     |
|   84 | RuneSlots_V1           | Integer         |                        |                                                                                                                     |
|   85 | ObjectCategory         | String          |                        |                                                                                                                     |
|   86 | MinAmount              | Integer         |                        |                                                                                                                     |
|   87 | MaxAmount              | Integer         |                        |                                                                                                                     |
|   88 | Priority               | Integer         |                        |                                                                                                                     |
|   89 | Unique                 | Integer         |                        |                                                                                                                     |
|   90 | MinLevel               | Integer         |                        |                                                                                                                     |
|   91 | MaxLevel               | Integer         |                        |                                                                                                                     |
|   92 | Comment                | Comment         |                        |                                                                                                                     |

## Stats: Object

|      | @name               | @type           | @enumeration_type_name | @description                                                                                              |
| ---: | :------------------ | :-------------- | :--------------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                | Name            |                        |                                                                                                           |
|    1 | Using               | BaseClass       |                        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | RootTemplate        | RootTemplate    |                        |                                                                                                           |
|    3 | ModifierType        | Enumeration     | ModifierType           |                                                                                                           |
|    4 | Act                 | Enumeration     | Act                    |                                                                                                           |
|    5 | Act part            | Enumeration     | ActPart                |                                                                                                           |
|    6 | UseAPCost           | Integer         |                        |                                                                                                           |
|    7 | Value               | Integer         |                        |                                                                                                           |
|    8 | Weight              | Integer         |                        |                                                                                                           |
|    9 | ComboCategory       | String          |                        |                                                                                                           |
|   10 | Requirements        | String          |                        |                                                                                                           |
|   11 | Strength            | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              |
|   12 | Finesse             | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              |
|   13 | Intelligence        | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              |
|   14 | Constitution        | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              |
|   15 | Memory              | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              |
|   16 | Wits                | Enumeration     | PreciseQualifier       | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              |
|   17 | Vitality            | Integer         |                        |                                                                                                           |
|   18 | Armor               | Enumeration     | PreciseQualifier       |                                                                                                           |
|   19 | PiercingResistance  | Integer         |                        |                                                                                                           |
|   20 | PhysicalResistance  | Integer         |                        |                                                                                                           |
|   21 | FireResistance      | Integer         |                        |                                                                                                           |
|   22 | EarthResistance     | Integer         |                        |                                                                                                           |
|   23 | WaterResistance     | Integer         |                        |                                                                                                           |
|   24 | AirResistance       | Integer         |                        |                                                                                                           |
|   25 | PoisonResistance    | Integer         |                        |                                                                                                           |
|   26 | Flags               | EnumerationList | AttributeFlags         |                                                                                                           |
|   27 | InventoryTab        | Enumeration     | InventoryTabs          |                                                                                                           |
|   28 | AddToBottomBar      | Enumeration     | YesNo                  |                                                                                                           |
|   29 | IgnoredByAI         | Enumeration     | YesNo                  |                                                                                                           |
|   30 | RuneLevel           | Integer         |                        |                                                                                                           |
|   31 | RuneEffectWeapon    | String          |                        |                                                                                                           |
|   32 | RuneEffectUpperbody | String          |                        |                                                                                                           |
|   33 | RuneEffectAmulet    | String          |                        |                                                                                                           |
|   34 | ObjectCategory      | String          |                        |                                                                                                           |
|   35 | MinAmount           | Integer         |                        |                                                                                                           |
|   36 | MaxAmount           | Integer         |                        |                                                                                                           |
|   37 | Priority            | Integer         |                        |                                                                                                           |
|   38 | Unique              | Integer         |                        |                                                                                                           |
|   39 | MinLevel            | Integer         |                        |                                                                                                           |
|   40 | MaxLevel            | Integer         |                        |                                                                                                           |
|   41 | Comment             | Comment         |                        |                                                                                                           |

## Stats: Shield

|      | @name                  | @type           | @enumeration_type_name | @description                                                                                                        |
| ---: | :--------------------- | :-------------- | :--------------------- | :------------------------------------------------------------------------------------------------------------------ |
|    0 | Name                   | Name            |                        |                                                                                                                     |
|    1 | Using                  | BaseClass       |                        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.           |
|    2 | ItemGroup              | String          |                        |                                                                                                                     |
|    3 | ModifierType           | Enumeration     | ModifierType           |                                                                                                                     |
|    4 | Act                    | Enumeration     | Act                    |                                                                                                                     |
|    5 | Act part               | Enumeration     | ActPart                |                                                                                                                     |
|    6 | Requirements           | String          |                        |                                                                                                                     |
|    7 | Armor Defense Value    | Integer         |                        | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |
|    8 | ArmorBoost             | Integer         |                        | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base.              |
|    9 | Magic Armor Value      | Integer         |                        | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |
|   10 | MagicArmorBoost        | Integer         |                        | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base.              |
|   11 | Blocking               | Integer         |                        |                                                                                                                     |
|   12 | Durability             | Integer         |                        |                                                                                                                     |
|   13 | DurabilityDegradeSpeed | Enumeration     | Qualifier              |                                                                                                                     |
|   14 | Value                  | Integer         |                        |                                                                                                                     |
|   15 | Weight                 | Integer         |                        |                                                                                                                     |
|   16 | Movement               | Integer         |                        | Enter a flat value in centimeters.                                                                                  |
|   17 | Initiative             | Integer         |                        |                                                                                                                     |
|   18 | Slot                   | Enumeration     | Itemslot               |                                                                                                                     |
|   19 | Fire                   | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   20 | Air                    | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   21 | Water                  | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   22 | Earth                  | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   23 | Poison                 | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   24 | Piercing               | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   25 | Physical               | Integer         |                        | Enter a percentage resistance value.                                                                                |
|   26 | StrengthBoost          | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   27 | FinesseBoost           | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   28 | IntelligenceBoost      | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   29 | ConstitutionBoost      | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   30 | MemoryBoost            | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   31 | WitsBoost              | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      |
|   32 | SingleHanded           | Integer         |                        |                                                                                                                     |
|   33 | TwoHanded              | Integer         |                        |                                                                                                                     |
|   34 | Ranged                 | Integer         |                        |                                                                                                                     |
|   35 | DualWielding           | Integer         |                        |                                                                                                                     |
|   36 | Perseverance           | Integer         |                        |                                                                                                                     |
|   37 | Leadership             | Integer         |                        |                                                                                                                     |
|   38 | PainReflection         | Integer         |                        |                                                                                                                     |
|   39 | RogueLore              | Integer         |                        |                                                                                                                     |
|   40 | WarriorLore            | Integer         |                        |                                                                                                                     |
|   41 | RangerLore             | Integer         |                        |                                                                                                                     |
|   42 | FireSpecialist         | Integer         |                        |                                                                                                                     |
|   43 | WaterSpecialist        | Integer         |                        |                                                                                                                     |
|   44 | AirSpecialist          | Integer         |                        |                                                                                                                     |
|   45 | EarthSpecialist        | Integer         |                        |                                                                                                                     |
|   46 | Sourcery               | Integer         |                        |                                                                                                                     |
|   47 | Necromancy             | Integer         |                        |                                                                                                                     |
|   48 | Polymorph              | Integer         |                        |                                                                                                                     |
|   49 | Summoning              | Integer         |                        |                                                                                                                     |
|   50 | Telekinesis            | Integer         |                        |                                                                                                                     |
|   51 | Sneaking               | Integer         |                        |                                                                                                                     |
|   52 | LockPicking            | String          |                        |                                                                                                                     |
|   53 | Loremaster             | Integer         |                        |                                                                                                                     |
|   54 | Repair                 | Integer         |                        |                                                                                                                     |
|   55 | Barter                 | Integer         |                        |                                                                                                                     |
|   56 | Persuasion             | Integer         |                        |                                                                                                                     |
|   57 | Luck                   | Integer         |                        |                                                                                                                     |
|   58 | SightBoost             | Enumeration     | Penalty Qualifier      |                                                                                                                     |
|   59 | HearingBoost           | Enumeration     | Penalty Qualifier      |                                                                                                                     |
|   60 | VitalityBoost          | Integer         |                        |                                                                                                                     |
|   61 | MagicPointsBoost       | Enumeration     | Penalty Qualifier      |                                                                                                                     |
|   62 | ChanceToHitBoost       | Integer         |                        |                                                                                                                     |
|   63 | APMaximum              | Integer         |                        |                                                                                                                     |
|   64 | APStart                | Integer         |                        |                                                                                                                     |
|   65 | APRecovery             | Integer         |                        |                                                                                                                     |
|   66 | AccuracyBoost          | Integer         |                        |                                                                                                                     |
|   67 | DodgeBoost             | Integer         |                        |                                                                                                                     |
|   68 | CriticalChance         | Enumeration     | Penalty Qualifier      |                                                                                                                     |
|   69 | Reflection             | String          |                        |                                                                                                                     |
|   70 | Bodybuilding           | String          |                        |                                                                                                                     |
|   71 | Willpower              | String          |                        |                                                                                                                     |
|   72 | MaxSummons             | Integer         |                        |                                                                                                                     |
|   73 | Skills                 | String          |                        |                                                                                                                     |
|   74 | Talents                | String          |                        |                                                                                                                     |
|   75 | Tags                   | String          |                        |                                                                                                                     |
|   76 | ExtraProperties        | String          |                        |                                                                                                                     |
|   77 | Flags                  | EnumerationList | AttributeFlags         |                                                                                                                     |
|   78 | ComboCategory          | String          |                        |                                                                                                                     |
|   79 | InventoryTab           | Enumeration     | InventoryTabs          |                                                                                                                     |
|   80 | ItemColor              | String          |                        |                                                                                                                     |
|   81 | NeedsIdentification    | Enumeration     | YesNo                  |                                                                                                                     |
|   82 | Charges                | String          |                        |                                                                                                                     |
|   83 | MaxCharges             | String          |                        |                                                                                                                     |
|   84 | RuneSlots              | Integer         |                        |                                                                                                                     |
|   85 | RuneSlots_V1           | Integer         |                        |                                                                                                                     |
|   86 | ObjectCategory         | String          |                        |                                                                                                                     |
|   87 | MinAmount              | Integer         |                        |                                                                                                                     |
|   88 | MaxAmount              | Integer         |                        |                                                                                                                     |
|   89 | Priority               | Integer         |                        |                                                                                                                     |
|   90 | Unique                 | Integer         |                        |                                                                                                                     |
|   91 | MinLevel               | Integer         |                        |                                                                                                                     |
|   92 | MaxLevel               | Integer         |                        |                                                                                                                     |
|   93 | Comment                | Comment         |                        |                                                                                                                     |

## Stats: Weapon

|      | @name                  | @type           | @enumeration_type_name | @description                                                                                                                        |
| ---: | :--------------------- | :-------------- | :--------------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                   | Name            |                        |                                                                                                                                     |
|    1 | Using                  | BaseClass       |                        |                                                                                                                                     |
|    2 | ItemGroup              | String          |                        |                                                                                                                                     |
|    3 | ModifierType           | Enumeration     | ModifierType           |                                                                                                                                     |
|    4 | Act                    | Enumeration     | Act                    |                                                                                                                                     |
|    5 | Act part               | Enumeration     | ActPart                |                                                                                                                                     |
|    6 | Requirements           | String          |                        |                                                                                                                                     |
|    7 | IsTwoHanded            | Enumeration     | YesNo                  |                                                                                                                                     |
|    8 | AttackAPCost           | Integer         |                        |                                                                                                                                     |
|    9 | Damage Type            | Enumeration     | Damage Type            |                                                                                                                                     |
|   10 | Damage                 | Integer         |                        | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   11 | Damage Range           | Integer         |                        | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   12 | DamageBoost            | Integer         |                        | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | DamageFromBase         | Integer         |                        | Used by boosts, percentage value.                                                                                                   |
|   14 | CriticalDamage         | Integer         |                        |                                                                                                                                     |
|   15 | CriticalChance         | Integer         |                        |                                                                                                                                     |
|   16 | WeaponRange            | Integer         |                        |                                                                                                                                     |
|   17 | CleavePercentage       | Integer         |                        |                                                                                                                                     |
|   18 | CleaveAngle            | Integer         |                        |                                                                                                                                     |
|   19 | Durability             | Integer         |                        |                                                                                                                                     |
|   20 | DurabilityDegradeSpeed | Enumeration     | Qualifier              |                                                                                                                                     |
|   21 | Value                  | Integer         |                        |                                                                                                                                     |
|   22 | Weight                 | Integer         |                        |                                                                                                                                     |
|   23 | Movement               | Integer         |                        |                                                                                                                                     |
|   24 | Initiative             | Integer         |                        |                                                                                                                                     |
|   25 | WeaponType             | Enumeration     | WeaponType             |                                                                                                                                     |
|   26 | AnimType               | Enumeration     | AnimType               |                                                                                                                                     |
|   27 | Slot                   | Enumeration     | Itemslot               |                                                                                                                                     |
|   28 | Projectile             | String          |                        |                                                                                                                                     |
|   29 | IgnoreVisionBlock      | Enumeration     | YesNo                  |                                                                                                                                     |
|   30 | StrengthBoost          | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   31 | FinesseBoost           | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   32 | IntelligenceBoost      | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   33 | ConstitutionBoost      | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   34 | MemoryBoost            | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   35 | WitsBoost              | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   36 | TwoHanded              | Integer         |                        |                                                                                                                                     |
|   37 | SingleHanded           | Integer         |                        |                                                                                                                                     |
|   38 | Ranged                 | Integer         |                        |                                                                                                                                     |
|   39 | DualWielding           | Integer         |                        |                                                                                                                                     |
|   40 | Perseverance           | Integer         |                        |                                                                                                                                     |
|   41 | Leadership             | Integer         |                        |                                                                                                                                     |
|   42 | PainReflection         | Integer         |                        |                                                                                                                                     |
|   43 | WarriorLore            | Integer         |                        |                                                                                                                                     |
|   44 | RangerLore             | Integer         |                        |                                                                                                                                     |
|   45 | RogueLore              | Integer         |                        |                                                                                                                                     |
|   46 | FireSpecialist         | Integer         |                        |                                                                                                                                     |
|   47 | WaterSpecialist        | Integer         |                        |                                                                                                                                     |
|   48 | AirSpecialist          | Integer         |                        |                                                                                                                                     |
|   49 | EarthSpecialist        | Integer         |                        |                                                                                                                                     |
|   50 | Necromancy             | Integer         |                        |                                                                                                                                     |
|   51 | Polymorph              | Integer         |                        |                                                                                                                                     |
|   52 | Summoning              | Integer         |                        |                                                                                                                                     |
|   53 | Sourcery               | Integer         |                        |                                                                                                                                     |
|   54 | Telekinesis            | Integer         |                        |                                                                                                                                     |
|   55 | Sneaking               | Integer         |                        |                                                                                                                                     |
|   56 | Thievery               | Integer         |                        |                                                                                                                                     |
|   57 | Loremaster             | Integer         |                        |                                                                                                                                     |
|   58 | Repair                 | Integer         |                        |                                                                                                                                     |
|   59 | Barter                 | Integer         |                        |                                                                                                                                     |
|   60 | Persuasion             | Integer         |                        |                                                                                                                                     |
|   61 | Luck                   | Integer         |                        |                                                                                                                                     |
|   62 | Fire                   | Integer         |                        |                                                                                                                                     |
|   63 | Earth                  | Integer         |                        |                                                                                                                                     |
|   64 | Water                  | Integer         |                        |                                                                                                                                     |
|   65 | Air                    | Integer         |                        |                                                                                                                                     |
|   66 | Poison                 | Integer         |                        |                                                                                                                                     |
|   67 | SightBoost             | Enumeration     | Penalty Qualifier      |                                                                                                                                     |
|   68 | HearingBoost           | Enumeration     | Penalty Qualifier      |                                                                                                                                     |
|   69 | VitalityBoost          | Integer         |                        |                                                                                                                                     |
|   70 | ChanceToHitBoost       | Integer         |                        |                                                                                                                                     |
|   71 | APMaximum              | Integer         |                        |                                                                                                                                     |
|   72 | APStart                | Integer         |                        |                                                                                                                                     |
|   73 | APRecovery             | Integer         |                        |                                                                                                                                     |
|   74 | AccuracyBoost          | Integer         |                        |                                                                                                                                     |
|   75 | DodgeBoost             | Integer         |                        |                                                                                                                                     |
|   76 | ComboCategory          | String          |                        |                                                                                                                                     |
|   77 | Reflection             | String          |                        |                                                                                                                                     |
|   78 | MaxSummons             | Integer         |                        |                                                                                                                                     |
|   79 | LifeSteal              | Integer         |                        |                                                                                                                                     |
|   80 | Skills                 | String          |                        |                                                                                                                                     |
|   81 | Talents                | String          |                        |                                                                                                                                     |
|   82 | Tags                   | String          |                        |                                                                                                                                     |
|   83 | ExtraProperties        | String          |                        |                                                                                                                                     |
|   84 | Flags                  | EnumerationList | AttributeFlags         |                                                                                                                                     |
|   85 | Boosts                 | String          |                        |                                                                                                                                     |
|   86 | InventoryTab           | Enumeration     | InventoryTabs          |                                                                                                                                     |
|   87 | NeedsIdentification    | Enumeration     | YesNo                  |                                                                                                                                     |
|   88 | Charges                | Integer         |                        |                                                                                                                                     |
|   89 | MaxCharges             | Integer         |                        |                                                                                                                                     |
|   90 | ItemColor              | String          |                        |                                                                                                                                     |
|   91 | RuneSlots              | Integer         |                        |                                                                                                                                     |
|   92 | RuneSlots_V1           | Integer         |                        |                                                                                                                                     |
|   93 | ObjectCategory         | String          |                        |                                                                                                                                     |
|   94 | MinAmount              | Integer         |                        |                                                                                                                                     |
|   95 | MaxAmount              | Integer         |                        |                                                                                                                                     |
|   96 | Priority               | Integer         |                        |                                                                                                                                     |
|   97 | Unique                 | Integer         |                        |                                                                                                                                     |
|   98 | MinLevel               | Integer         |                        |                                                                                                                                     |
|   99 | MaxLevel               | Integer         |                        |                                                                                                                                     |
|  100 | Comment                | Comment         |                        |                                                                                                                                     |

## TreasureTable: TreasureTable

|      | @name             | @type       | @export_type       | @enumeration_type_name | @is_internal |
| ---: | :---------------- | :---------- | :----------------- | :--------------------- | :----------- |
|    0 | Name              | Name        | TreasureTableField |                        |              |
|    1 | CanMerge          | Enumeration | TreasureTableField | YesNo                  |              |
|    2 | MinLevelDiff      | Integer     | TreasureTableField |                        |              |
|    3 | MaxLevelDiff      | Integer     | TreasureTableField |                        |              |
|    4 | IgnoreLevelDiff   | Enumeration | TreasureTableField | YesNo                  |              |
|    5 | UseTreasureGroups | Enumeration | TreasureTableField | YesNo                  |              |
|    6 | StartLevel        | Integer     | SubTableField      |                        |              |
|    7 | EndLevel          | Integer     | SubTableField      |                        |              |
|    8 | DropCount         | String      | SubTableField      |                        |              |
|    9 | ObjectCategory    | String      | SubTableField      |                        |              |
|   10 | Frequency         | Integer     | SubTableField      |                        |              |
|   11 | Common            | Integer     | ItemType           |                        |              |
|   12 | Uncommon          | Integer     | ItemType           |                        |              |
|   13 | Rare              | Integer     | ItemType           |                        |              |
|   14 | Epic              | Integer     | ItemType           |                        |              |
|   15 | Legendary         | String      | ItemType           |                        |              |
|   16 | Divine            | Integer     | ItemType           |                        |              |
|   17 | Unique            | Integer     | ItemType           |                        |              |
|   18 | Comment           | Comment     |                    |                        |              |
|   19 | Using             | BaseClass   |                    |                        | true         |

## SkillData: SkillSet

|      | @name   | @type         | stat_descriptions                                                          | @is_internal |
| ---: | :------ | :------------ | :------------------------------------------------------------------------- | :----------- |
|    0 | Name    | Name          |                                                                            |              |
|    1 | Skills  | StatReference | OrderedDict([('description', OrderedDict([('@stat_type', 'SkillData')]))]) |              |
|    2 | Comment | Comment       |                                                                            |              |
|    3 | Using   | BaseClass     |                                                                            | true         |

## Equipment: Equipment

|      | @name   | @type         | stat_descriptions                                                                                                                                                                                                                                                                        |
| ---: | :------ | :------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name    | Name          |                                                                                                                                                                                                                                                                                          |
|    1 | 1       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|    2 | 2       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|    3 | 3       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|    4 | 4       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|    5 | 5       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|    6 | 6       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|    7 | 7       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|    8 | 8       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|    9 | 9       | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   10 | 10      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   11 | 11      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   12 | 12      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   13 | 13      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   14 | 14      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   15 | 15      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   16 | 16      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   17 | 17      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   18 | 18      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   19 | 19      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   20 | 20      | StatReference | OrderedDict([('description', [OrderedDict([('@stat_type', 'Armor')]), OrderedDict([('@stat_type', 'Character')]), OrderedDict([('@stat_type', 'Object')]), OrderedDict([('@stat_type', 'Potion')]), OrderedDict([('@stat_type', 'Shield')]), OrderedDict([('@stat_type', 'Weapon')])])]) |
|   21 | Comment | Comment       |                                                                                                                                                                                                                                                                                          |

## ItemCombos: ItemCombos

|      | @name           | @type            | @enumeration_type_name  | @export_type | @table_name      |
| ---: | :-------------- | :--------------- | :---------------------- | :----------- | :--------------- |
|    0 | Name            | Name             |                         |              |                  |
|    1 | Using           | BaseClass        |                         |              |                  |
|    2 | RecipeCategory  | Enumeration      | RecipeCategory          |              |                  |
|    3 | CraftingStation | Enumeration      | CraftingStationType     |              |                  |
|    4 | Type 1          | Enumeration      | IngredientType          |              |                  |
|    5 | Object 1        | String           |                         |              |                  |
|    6 | Transform 1     | Enumeration      | IngredientTransformType |              |                  |
|    7 | Type 2          | Enumeration      | IngredientType          |              |                  |
|    8 | Object 2        | String           |                         |              |                  |
|    9 | Transform 2     | Enumeration      | IngredientTransformType |              |                  |
|   10 | Type 3          | Enumeration      | IngredientType          |              |                  |
|   11 | Object 3        | String           |                         |              |                  |
|   12 | Transform 3     | Enumeration      | IngredientTransformType |              |                  |
|   13 | Type 4          | Enumeration      | IngredientType          |              |                  |
|   14 | Object 4        | String           |                         |              |                  |
|   15 | Transform 4     | Enumeration      | IngredientTransformType |              |                  |
|   16 | Type 5          | Enumeration      | IngredientType          |              |                  |
|   17 | Object 5        | String           |                         |              |                  |
|   18 | Transform 5     | Enumeration      | IngredientTransformType |              |                  |
|   19 | AutoLevel       | Integer          |                         |              |                  |
|   20 | Requirement     | String           |                         | ResultField  |                  |
|   21 | ReqLevel        | String           |                         | ResultField  |                  |
|   22 | ResultAmount 1  | Integer          |                         | ResultField  |                  |
|   23 | Result 1        | String           |                         | ResultField  |                  |
|   24 | Boost 1         | String           |                         | ResultField  |                  |
|   25 | ResultAmount 2  | Integer          |                         | ResultField  |                  |
|   26 | Result 2        | String           |                         | ResultField  |                  |
|   27 | Boost 2         | String           |                         | ResultField  |                  |
|   28 | ResultAmount 3  | Integer          |                         | ResultField  |                  |
|   29 | Result 3        | String           |                         | ResultField  |                  |
|   30 | Boost 3         | String           |                         | ResultField  |                  |
|   31 | PreviewStatsID  | String           |                         | ResultField  |                  |
|   32 | PreviewIcon     | String           |                         | ResultField  |                  |
|   33 | PreviewTooltip  | TranslatedString |                         | ResultField  | ItemCombinations |
|   34 | Comment         | Comment          |                         |              |                  |

## ItemCombos: ItemComboProperties

|      | @name          | @type            | @export_type       | @table_name      | @is_internal |
| ---: | :------------- | :--------------- | :----------------- | :--------------- | :----------- |
|    0 | Name           | Name             | PropertyField      |                  |              |
|    1 | PreviewIcon    | String           | PropertyField      |                  |              |
|    2 | PreviewTooltip | TranslatedString | PropertyField      | ItemCombinations |              |
|    3 | ObjectID       | String           | PropertyEntryField |                  |              |
|    4 | Type           | String           | PropertyEntryField |                  |              |
|    5 | Result         | String           | PropertyEntryField |                  |              |
|    6 | Comment        | Comment          | PropertyEntryField |                  |              |
|    7 | Using          | BaseClass        | PropertyEntryField |                  | true         |

## ItemCombos: ObjectCategoriesItemComboPreviewData

|      | @name   | @type            | @table_name      |
| ---: | :------ | :--------------- | :--------------- |
|    0 | Name    | Name             |                  |
|    1 | Type    | String           |                  |
|    2 | Icon    | String           |                  |
|    3 | Tooltip | TranslatedString | ItemCombinations |
|    4 | Comment | Comment          |                  |

## ItemCombos: CraftingStationsItemComboPreviewData

|      | @name   | @type            | @table_name      |
| ---: | :------ | :--------------- | :--------------- |
|    0 | Name    | Name             |                  |
|    1 | Type    | String           |                  |
|    2 | StatsID | String           |                  |
|    3 | Icon    | String           |                  |
|    4 | Tooltip | TranslatedString | ItemCombinations |
|    5 | Comment | Comment          |                  |

## ItemProgression: ItemProgressionVisuals

|      | @name        | @type        | @is_internal |
| ---: | :----------- | :----------- | :----------- |
|    0 | Name         | Name         |              |
|    1 | MinLevel     | Integer      |              |
|    2 | MaxLevel     | Integer      |              |
|    3 | Rarity       | String       |              |
|    4 | RootTemplate | RootTemplate |              |
|    5 | ItemColor    | String       |              |
|    6 | NameGroup    | String       |              |
|    7 | AffixType    | String       |              |
|    8 | Icon         | String       |              |
|    9 | Comment      | Comment      |              |
|   10 | Using        | BaseClass    | true         |

## ExtraData: Requirements

|      | @name        | @type   |
| ---: | :----------- | :------ |
|    0 | Name         | Name    |
|    1 | Requirements | String  |
|    2 | Comment      | Comment |

## Crimes: Crimes

|      | @name                    | @type       | @export_type     | @enumeration_type_name | @is_internal |
| ---: | :----------------------- | :---------- | :--------------- | :--------------------- | :----------- |
|    0 | Name                     | Name        | CrimeField       |                        |              |
|    1 | TensionWeight            | Integer     | CrimeField       |                        |              |
|    2 | Lifetime                 | Integer     | CrimeField       |                        |              |
|    3 | DetectionRange           | Integer     | CrimeField       |                        |              |
|    4 | AudibleRange             | Integer     | CrimeField       |                        |              |
|    5 | Audible                  | Enumeration | CrimeField       | YesNo                  |              |
|    6 | Continuous               | Enumeration | CrimeField       | YesNo                  |              |
|    7 | ContinuousDelayTimer     | Integer     | CrimeField       |                        |              |
|    8 | CreatesCrimescene        | Enumeration | CrimeField       | YesNo                  |              |
|    9 | CanRaiseAlarm            | Enumeration | CrimeField       | YesNo                  |              |
|   10 | CanMerge                 | Enumeration | CrimeField       | YesNo                  |              |
|   11 | MaxInvestigators         | Integer     | CrimeField       |                        |              |
|   12 | InterrogateDialog        | String      | CrimeField       |                        |              |
|   13 | SoundEvent               | String      | CrimeField       |                        |              |
|   14 | ReactionCategory_Tag     | String      | CrimeActionField |                        |              |
|   15 | Tension                  | String      | CrimeActionField |                        |              |
|   16 | Priority                 | String      | CrimeActionField |                        |              |
|   17 | DisableInvestigate       | String      | CrimeActionField |                        |              |
|   18 | StopsAndInterruptsCrimes | String      | CrimeActionField |                        |              |
|   19 | VictimReaction           | String      | CrimeActionField |                        |              |
|   20 | VictimDialog             | String      | CrimeActionField |                        |              |
|   21 | Dialog                   | String      | CrimeActionField |                        |              |
|   22 | PrimarySensibleAction    | String      | CrimeActionField |                        |              |
|   23 | SecondarySensibleAction  | String      | CrimeActionField |                        |              |
|   24 | NoticedAD                | String      | CrimeActionField |                        |              |
|   25 | Comment                  | Comment     |                  |                        |              |
|   26 | Using                    | BaseClass   |                  |                        | true         |

## TreasureTable: TreasureGroups

|      | @name                   | @type   | @export_type          |
| ---: | :---------------------- | :------ | :-------------------- |
|    0 | Name                    | Name    | CategoryMapField      |
|    1 | TreasureGroup           | String  | CategoryMapField      |
|    2 | WeaponTreasureGroup     | String  | WeaponCounterField    |
|    3 | WeaponDefaultCounter    | Integer | WeaponCounterField    |
|    4 | SkillbookTreasureGroup  | String  | SkillbookCounterField |
|    5 | SkillbookDefaultCounter | Integer | SkillbookCounterField |
|    6 | ArmorTreasureGroup      | String  | ArmorCounterField     |
|    7 | ArmorDefaultCounter     | Integer | ArmorCounterField     |
|    8 | Comment                 | Comment |                       |

## DeltaModifier: DeltaModifier

|      | @name        | @type     | @export_type | @is_internal |
| ---: | :----------- | :-------- | :----------- | :----------- |
|    0 | Name         | Name      |              |              |
|    1 | BoostType    | String    |              |              |
|    2 | MinLevel     | Integer   |              |              |
|    3 | MaxLevel     | Integer   |              |              |
|    4 | Frequency    | Integer   |              |              |
|    5 | ModifierType | String    |              |              |
|    6 | SlotType     | String    |              |              |
|    7 | ArmorType    | String    |              |              |
|    8 | WeaponType   | String    |              |              |
|    9 | Handedness   | Integer   |              |              |
|   10 | Boost        | String    | BoostField   |              |
|   11 | Multiplier   | Integer   | BoostField   |              |
|   12 | Comment      | Comment   |              |              |
|   13 | Using        | BaseClass |              | true         |

## ItemColor: ItemColor

|      | @name           | @type   |
| ---: | :-------------- | :------ |
|    0 | Name            | Name    |
|    1 | Primary Color   | Color   |
|    2 | Secondary Color | Color   |
|    3 | Tertiary Color  | Color   |
|    4 | Comment         | Comment |

## ItemProgression: ItemProgressionNames

|      | @name       | @type            | @table_name     | @is_internal |
| ---: | :---------- | :--------------- | :-------------- | :----------- |
|    0 | Name        | Name             |                 |              |
|    1 | ItemName    | TranslatedString | ItemProgression |              |
|    2 | NameCool    | TranslatedString | ItemProgression |              |
|    3 | Description | TranslatedString | ItemProgression |              |
|    4 | Comment     | Comment          |                 |              |
|    5 | Using       | BaseClass        |                 | true         |

## ExtraData: Data

|      | @name   | @type   |
| ---: | :------ | :------ |
|    0 | Name    | Name    |
|    1 | Value   | Float   |
|    2 | Comment | Comment |

## ItemTypes: ItemTypes

|      | @name               | @type     | @export_type | @is_internal |
| ---: | :------------------ | :-------- | :----------- | :----------- |
|    0 | Name                | Name      |              |              |
|    1 | Color               | String    |              |              |
|    2 | OverlayTexture      | String    |              |              |
|    3 | ValueMultiplier     | Float     |              |              |
|    4 | FirstItemTypeShift  | String    |              |              |
|    5 | SecondItemTypeShift | String    |              |              |
|    6 | UIBorderID          | String    |              |              |
|    7 | MinLevel            | Integer   |              |              |
|    8 | RowChance           | Integer   |              |              |
|    9 | BoostTypes          | String    | BoostField   |              |
|   10 | BoostType 2         | String    | BoostField   |              |
|   11 | BoostType 3         | String    | BoostField   |              |
|   12 | BoostType 4         | String    | BoostField   |              |
|   13 | BoostType 5         | String    | BoostField   |              |
|   14 | BoostType 6         | String    | BoostField   |              |
|   15 | BoostType 7         | String    | BoostField   |              |
|   16 | BoostType 8         | String    | BoostField   |              |
|   17 | BoostType 9         | String    | BoostField   |              |
|   18 | BoostType 10        | String    | BoostField   |              |
|   19 | BoostType 11        | String    | BoostField   |              |
|   20 | BoostType 12        | String    | BoostField   |              |
|   21 | Comment             | Comment   |              |              |
|   22 | Using               | BaseClass |              | true         |

## SkillData: Projectile

|      | @name                      | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :------------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                       | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                      | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                      | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster              | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill               | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                    | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                       | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement                | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints               | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                   | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                    | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                     | Enumeration      | DamageSourceType       |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier          | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range               | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType                 | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties            | String           |                        |                    |                                                                                                                                     |
|   16 | TargetRadius               | Integer          |                        |                    |                                                                                                                                     |
|   17 | AddRangeFromAbility        | Enumeration      | Ability                |                    |                                                                                                                                     |
|   18 | AreaRadius                 | Integer          |                        |                    |                                                                                                                                     |
|   19 | DeathType                  | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   20 | ExplodeRadius              | Integer          |                        |                    |                                                                                                                                     |
|   21 | CanTargetCharacters        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   22 | CanTargetItems             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   23 | CanTargetTerrain           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   24 | ForceTarget                | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   25 | AmountOfTargets            | Integer          |                        |                    |                                                                                                                                     |
|   26 | AutoAim                    | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   27 | TargetConditions           | String           |                        |                    |                                                                                                                                     |
|   28 | ForkingConditions          | String           |                        |                    |                                                                                                                                     |
|   29 | UseCharacterStats          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   30 | UseWeaponDamage            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   31 | UseWeaponProperties        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   32 | ProjectileCount            | Integer          |                        |                    |                                                                                                                                     |
|   33 | ProjectileDelay            | Integer          |                        |                    |                                                                                                                                     |
|   34 | Angle                      | Integer          |                        |                    |                                                                                                                                     |
|   35 | Template                   | String           |                        |                    |                                                                                                                                     |
|   36 | IgnoreVisionBlock          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   37 | TemplateCheck              | Enumeration      | CastCheckType          |                    |                                                                                                                                     |
|   38 | ChanceToPierce             | Integer          |                        |                    |                                                                                                                                     |
|   39 | MaxPierceCount             | Integer          |                        |                    |                                                                                                                                     |
|   40 | MaxForkCount               | Integer          |                        |                    |                                                                                                                                     |
|   41 | ForkLevels                 | Integer          |                        |                    |                                                                                                                                     |
|   42 | ForkChance                 | Integer          |                        |                    |                                                                                                                                     |
|   43 | Icon                       | String           |                        |                    |                                                                                                                                     |
|   44 | DisplayName                | TranslatedString |                        | Stats              |                                                                                                                                     |
|   45 | Description                | TranslatedString |                        | Stats              |                                                                                                                                     |
|   46 | StatsDescription           | TranslatedString |                        | Stats              |                                                                                                                                     |
|   47 | StatsDescriptionParams     | String           |                        |                    |                                                                                                                                     |
|   48 | PrepareAnimationInit       | String           |                        |                    |                                                                                                                                     |
|   49 | PrepareAnimationLoop       | String           |                        |                    |                                                                                                                                     |
|   50 | PrepareEffect              | String           |                        |                    |                                                                                                                                     |
|   51 | CastAnimation              | String           |                        |                    |                                                                                                                                     |
|   52 | CastAnimationCheck         | Enumeration      | CastCheckType          |                    |                                                                                                                                     |
|   53 | CastTextEvent              | String           |                        |                    |                                                                                                                                     |
|   54 | CastEffect                 | String           |                        |                    |                                                                                                                                     |
|   55 | PreviewEffect              | String           |                        |                    |                                                                                                                                     |
|   56 | Requirements               | String           |                        |                    |                                                                                                                                     |
|   57 | MemorizationRequirements   | String           |                        |                    |                                                                                                                                     |
|   58 | Memory Cost                | Integer          |                        |                    |                                                                                                                                     |
|   59 | Magic Cost                 | Integer          |                        |                    |                                                                                                                                     |
|   60 | DivideDamage               | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   61 | ProjectileTerrainOffset    | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   62 | MovingObject               | String           |                        |                    |                                                                                                                                     |
|   63 | ProjectileType             | Enumeration      | ProjectileType         |                    |                                                                                                                                     |
|   64 | OverrideMinAP              | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   65 | Stealth                    | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   66 | Stealth Damage Multiplier  | Integer          |                        |                    |                                                                                                                                     |
|   67 | Distance Damage Multiplier | Integer          |                        |                    |                                                                                                                                     |
|   68 | HeightOffset               | Integer          |                        |                    |                                                                                                                                     |
|   69 | SpawnObject                | String           |                        |                    |                                                                                                                                     |
|   70 | SpawnEffect                | String           |                        |                    |                                                                                                                                     |
|   71 | SpawnFXOverridesImpactFX   | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   72 | SpawnLifetime              | Integer          |                        |                    |                                                                                                                                     |
|   73 | AiCalculationSkillOverride | String           |                        |                    |                                                                                                                                     |
|   74 | CycleConditions            | String           |                        |                    |                                                                                                                                     |

## SkillData: ProjectileStrike

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | DamageSourceType       |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | TargetRadius             | Integer          |                        |                    |                                                                                                                                     |
|   17 | AddRangeFromAbility      | Enumeration      | Ability                |                    |                                                                                                                                     |
|   18 | AreaRadius               | Integer          |                        |                    |                                                                                                                                     |
|   19 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   20 | ExplodeRadius            | Integer          |                        |                    |                                                                                                                                     |
|   21 | StrikeCount              | Integer          |                        |                    |                                                                                                                                     |
|   22 | StrikeDelay              | Integer          |                        |                    |                                                                                                                                     |
|   23 | CanTargetCharacters      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   24 | CanTargetItems           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   25 | CanTargetTerrain         | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   26 | ForceTarget              | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   27 | TargetConditions         | String           |                        |                    |                                                                                                                                     |
|   28 | OverrideSkillLevel       | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   29 | UseCharacterStats        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   30 | UseWeaponDamage          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   31 | UseWeaponProperties      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   32 | TargetProjectiles        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   33 | ProjectileCount          | Integer          |                        |                    |                                                                                                                                     |
|   34 | ProjectileDelay          | Integer          |                        |                    |                                                                                                                                     |
|   35 | Angle                    | Integer          |                        |                    |                                                                                                                                     |
|   36 | Height                   | Integer          |                        |                    |                                                                                                                                     |
|   37 | SingleSource             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   38 | Template                 | String           |                        |                    |                                                                                                                                     |
|   39 | MaxForkCount             | Integer          |                        |                    |                                                                                                                                     |
|   40 | ForkLevels               | Integer          |                        |                    |                                                                                                                                     |
|   41 | ForkChance               | Integer          |                        |                    |                                                                                                                                     |
|   42 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   43 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   44 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   45 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   46 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   47 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   48 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   49 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   50 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   51 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   52 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   53 | PreviewEffect            | String           |                        |                    |                                                                                                                                     |
|   54 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   55 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   56 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   57 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   58 | ProjectileType           | Enumeration      | ProjectileType         |                    |                                                                                                                                     |
|   59 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   60 | Distribution             | Enumeration      | ProjectileDistribution |                    |                                                                                                                                     |
|   61 | Shuffle                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   62 | PreviewStrikeHits        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   63 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Target

|      | @name                      | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :------------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                       | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                      | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                      | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster              | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill               | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                    | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                       | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement                | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints               | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                   | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                    | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                     | Enumeration      | DamageSourceType       |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier          | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range               | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType                 | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties            | String           |                        |                    |                                                                                                                                     |
|   16 | TargetRadius               | Integer          |                        |                    |                                                                                                                                     |
|   17 | AreaRadius                 | Integer          |                        |                    |                                                                                                                                     |
|   18 | AddWeaponRange             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   19 | IsMelee                    | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   20 | DeathType                  | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   21 | Requirements               | String           |                        |                    |                                                                                                                                     |
|   22 | MemorizationRequirements   | String           |                        |                    |                                                                                                                                     |
|   23 | CanTargetCharacters        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   24 | CanTargetItems             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   25 | CanTargetTerrain           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   26 | Memory Cost                | Integer          |                        |                    |                                                                                                                                     |
|   27 | Magic Cost                 | Integer          |                        |                    |                                                                                                                                     |
|   28 | TargetConditions           | String           |                        |                    |                                                                                                                                     |
|   29 | AoEConditions              | String           |                        |                    |                                                                                                                                     |
|   30 | UseCharacterStats          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   31 | UseWeaponDamage            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   32 | UseWeaponProperties        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   33 | Icon                       | String           |                        |                    |                                                                                                                                     |
|   34 | DisplayName                | TranslatedString |                        | Stats              |                                                                                                                                     |
|   35 | Description                | TranslatedString |                        | Stats              |                                                                                                                                     |
|   36 | StatsDescription           | TranslatedString |                        | Stats              |                                                                                                                                     |
|   37 | StatsDescriptionParams     | String           |                        |                    |                                                                                                                                     |
|   38 | FXScale                    | Integer          |                        |                    |                                                                                                                                     |
|   39 | PrepareAnimationInit       | String           |                        |                    |                                                                                                                                     |
|   40 | PrepareAnimationLoop       | String           |                        |                    |                                                                                                                                     |
|   41 | PrepareEffect              | String           |                        |                    |                                                                                                                                     |
|   42 | CastAnimation              | String           |                        |                    |                                                                                                                                     |
|   43 | CastSelfAnimation          | String           |                        |                    |                                                                                                                                     |
|   44 | CastTextEvent              | String           |                        |                    |                                                                                                                                     |
|   45 | CastEffect                 | String           |                        |                    |                                                                                                                                     |
|   46 | PreviewEffect              | String           |                        |                    |                                                                                                                                     |
|   47 | WeaponBones                | String           |                        |                    |                                                                                                                                     |
|   48 | TargetEffect               | String           |                        |                    |                                                                                                                                     |
|   49 | TargetGroundEffect         | String           |                        |                    |                                                                                                                                     |
|   50 | PositionEffect             | String           |                        |                    |                                                                                                                                     |
|   51 | BeamEffect                 | String           |                        |                    |                                                                                                                                     |
|   52 | SkillEffect                | String           |                        |                    |                                                                                                                                     |
|   53 | CleanseStatuses            | String           |                        |                    |                                                                                                                                     |
|   54 | StatusClearChance          | Integer          |                        |                    |                                                                                                                                     |
|   55 | Autocast                   | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   56 | IgnoreVisionBlock          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   57 | Stealth                    | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   58 | Stealth Damage Multiplier  | Integer          |                        |                    |                                                                                                                                     |
|   59 | OverrideMinAP              | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   60 | AmountOfTargets            | Integer          |                        |                    |                                                                                                                                     |
|   61 | AiCalculationSkillOverride | String           |                        |                    |                                                                                                                                     |
|   62 | IgnoreHeight               | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   63 | CycleConditions            | String           |                        |                    |                                                                                                                                     |

## SkillData: Cone

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | DamageSourceType       |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | Range                    | Integer          |                        |                    |                                                                                                                                     |
|   17 | Angle                    | Integer          |                        |                    |                                                                                                                                     |
|   18 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   19 | SurfaceType              | Enumeration      | Surface Type           |                    |                                                                                                                                     |
|   20 | IgnoreCursed             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   21 | SurfaceLifetime          | Integer          |                        |                    |                                                                                                                                     |
|   22 | SurfaceStatusChance      | Integer          |                        |                    |                                                                                                                                     |
|   23 | SurfaceGrowStep          | Integer          |                        |                    |                                                                                                                                     |
|   24 | SurfaceGrowInterval      | Integer          |                        |                    |                                                                                                                                     |
|   25 | TargetConditions         | String           |                        |                    |                                                                                                                                     |
|   26 | UseWeaponDamage          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   27 | UseWeaponProperties      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   28 | CanTargetCharacters      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   29 | CanTargetItems           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   30 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   31 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   32 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   33 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   34 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   35 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   36 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   37 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   38 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   39 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   40 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   41 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   42 | CastEffectTextEvent      | String           |                        |                    |                                                                                                                                     |
|   43 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   44 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   45 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   46 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   47 | PushDistance             | Integer          |                        |                    |                                                                                                                                     |
|   48 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   49 | BackStart                | Integer          |                        |                    |                                                                                                                                     |
|   50 | FrontOffset              | Integer          |                        |                    |                                                                                                                                     |
|   51 | OverrideMinAP            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   52 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Zone

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | DamageSourceType       |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   17 | SurfaceType              | Enumeration      | Surface Type           |                    |                                                                                                                                     |
|   18 | IgnoreCursed             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   19 | SurfaceLifetime          | Integer          |                        |                    |                                                                                                                                     |
|   20 | SurfaceStatusChance      | Integer          |                        |                    |                                                                                                                                     |
|   21 | SurfaceGrowStep          | Integer          |                        |                    |                                                                                                                                     |
|   22 | SurfaceGrowInterval      | Integer          |                        |                    |                                                                                                                                     |
|   23 | TargetConditions         | String           |                        |                    |                                                                                                                                     |
|   24 | UseWeaponDamage          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   25 | UseWeaponProperties      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   26 | CanTargetCharacters      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   27 | CanTargetItems           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   28 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   29 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   30 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   31 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   32 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   33 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   34 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   35 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   36 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   37 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   38 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   39 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   40 | CastEffectTextEvent      | String           |                        |                    |                                                                                                                                     |
|   41 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   42 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   43 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   44 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   45 | PushDistance             | Integer          |                        |                    |                                                                                                                                     |
|   46 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   47 | Shape                    | String           |                        |                    |                                                                                                                                     |
|   48 | BackStart                | Integer          |                        |                    |                                                                                                                                     |
|   49 | FrontOffset              | Integer          |                        |                    |                                                                                                                                     |
|   50 | Range                    | Integer          |                        |                    |                                                                                                                                     |
|   51 | Base                     | Integer          |                        |                    |                                                                                                                                     |
|   52 | Angle                    | Integer          |                        |                    |                                                                                                                                     |
|   53 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: MultiStrike

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | TargetRadius             | Integer          |                        |                    |                                                                                                                                     |
|   17 | AreaRadius               | Integer          |                        |                    |                                                                                                                                     |
|   18 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   19 | MaxAttacks               | Integer          |                        |                    |                                                                                                                                     |
|   20 | NextAttackChance         | Integer          |                        |                    |                                                                                                                                     |
|   21 | NextAttackChanceDivider  | Integer          |                        |                    |                                                                                                                                     |
|   22 | EndPosRadius             | Integer          |                        |                    |                                                                                                                                     |
|   23 | JumpDelay                | Integer          |                        |                    |                                                                                                                                     |
|   24 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   25 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   26 | TargetConditions         | String           |                        |                    |                                                                                                                                     |
|   27 | UseWeaponDamage          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   28 | UseWeaponProperties      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   29 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   30 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   31 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   32 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   33 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   34 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   35 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   36 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   37 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   38 | PrepareEffectBone        | String           |                        |                    |                                                                                                                                     |
|   39 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   40 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   41 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   42 | CastEffectTextEvent      | String           |                        |                    |                                                                                                                                     |
|   43 | MaleImpactEffects        | String           |                        |                    |                                                                                                                                     |
|   44 | FemaleImpactEffects      | String           |                        |                    |                                                                                                                                     |
|   45 | ReappearEffect           | String           |                        |                    |                                                                                                                                     |
|   46 | ReappearEffectTextEvent  | String           |                        |                    |                                                                                                                                     |
|   47 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   48 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   49 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   50 | OverrideMinAP            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   51 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Quake

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | TotalSurfaceCells        | Integer          |                        |                    |                                                                                                                                     |
|   17 | AreaRadius               | Integer          |                        |                    |                                                                                                                                     |
|   18 | TargetConditions         | String           |                        |                    |                                                                                                                                     |
|   19 | OverrideSkillLevel       | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   20 | SurfaceMinSpawnRadius    | Integer          |                        |                    |                                                                                                                                     |
|   21 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   22 | ShockWaveDuration        | Integer          |                        |                    |                                                                                                                                     |
|   23 | MinSurfaces              | Integer          |                        |                    |                                                                                                                                     |
|   24 | MaxSurfaces              | Integer          |                        |                    |                                                                                                                                     |
|   25 | SurfaceType              | Enumeration      | Surface Type           |                    |                                                                                                                                     |
|   26 | SurfaceGrowStep          | Integer          |                        |                    |                                                                                                                                     |
|   27 | SurfaceGrowInterval      | Integer          |                        |                    |                                                                                                                                     |
|   28 | SurfaceLifetime          | Integer          |                        |                    |                                                                                                                                     |
|   29 | SurfaceStatusChance      | Integer          |                        |                    |                                                                                                                                     |
|   30 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   31 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   32 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   33 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   34 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   35 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   36 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   37 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   38 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   39 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   40 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   41 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   42 | CastEffectTextEvent      | String           |                        |                    |                                                                                                                                     |
|   43 | LandingEffect            | String           |                        |                    |                                                                                                                                     |
|   44 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   45 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   46 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   47 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   48 | Skillbook                | String           |                        |                    |                                                                                                                                     |
|   49 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   50 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Storm

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | TargetRadius             | Integer          |                        |                    |                                                                                                                                     |
|   17 | AreaRadius               | Integer          |                        |                    |                                                                                                                                     |
|   18 | TargetConditions         | String           |                        |                    |                                                                                                                                     |
|   19 | OverrideSkillLevel       | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   20 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   21 | HitRadius                | Integer          |                        |                    |                                                                                                                                     |
|   22 | Lifetime                 | Integer          |                        |                    |                                                                                                                                     |
|   23 | MinHitsPerTurn           | Integer          |                        |                    |                                                                                                                                     |
|   24 | MaxHitsPerTurn           | Integer          |                        |                    |                                                                                                                                     |
|   25 | HitDelay                 | Integer          |                        |                    |                                                                                                                                     |
|   26 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   27 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   28 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   29 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   30 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   31 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   32 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   33 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   34 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   35 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   36 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   37 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   38 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   39 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   40 | CastEffectTextEvent      | String           |                        |                    |                                                                                                                                     |
|   41 | TargetEffect             | String           |                        |                    |                                                                                                                                     |
|   42 | StormEffect              | String           |                        |                    |                                                                                                                                     |
|   43 | ImpactEffect             | String           |                        |                    |                                                                                                                                     |
|   44 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   45 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   46 | Skillbook                | String           |                        |                    |                                                                                                                                     |
|   47 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   48 | ProjectileSkills         | String           |                        |                    |                                                                                                                                     |
|   49 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Rush

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   17 | TargetRadius             | Integer          |                        |                    |                                                                                                                                     |
|   18 | HitRadius                | Integer          |                        |                    |                                                                                                                                     |
|   19 | CanTargetCharacters      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   20 | CanTargetItems           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   21 | CanTargetTerrain         | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   22 | TargetConditions         | String           |                        |                    |                                                                                                                                     |
|   23 | UseCharacterStats        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   24 | UseWeaponDamage          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   25 | UseWeaponProperties      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   26 | ContinueOnKill           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   27 | ContinueEffect           | String           |                        |                    |                                                                                                                                     |
|   28 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   29 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   30 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   31 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   32 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   33 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   34 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   35 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   36 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   37 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   38 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   39 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   40 | CastEffectTextEvent      | String           |                        |                    |                                                                                                                                     |
|   41 | WeaponBones              | String           |                        |                    |                                                                                                                                     |
|   42 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   43 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   44 | TargetEffect             | String           |                        |                    |                                                                                                                                     |
|   45 | TargetCastEffect         | String           |                        |                    |                                                                                                                                     |
|   46 | TargetHitEffect          | String           |                        |                    |                                                                                                                                     |
|   47 | StartTextEvent           | String           |                        |                    |                                                                                                                                     |
|   48 | StopTextEvent            | String           |                        |                    |                                                                                                                                     |
|   49 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   50 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   51 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   52 | OverrideMinAP            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   53 | SurfaceType              | Enumeration      | Surface Type           |                    |                                                                                                                                     |
|   54 | SurfaceRadius            | Integer          |                        |                    |                                                                                                                                     |
|   55 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Jump

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | TargetRadius             | Integer          |                        |                    |                                                                                                                                     |
|   17 | HitRadius                | Integer          |                        |                    |                                                                                                                                     |
|   18 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   19 | Damage On Jump           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   20 | Damage On Landing        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   21 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   22 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   23 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   24 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   25 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   26 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   27 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   28 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   29 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   30 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   31 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   32 | TeleportTextEvent        | String           |                        |                    |                                                                                                                                     |
|   33 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   34 | PreviewEffect            | String           |                        |                    |                                                                                                                                     |
|   35 | LandingEffect            | String           |                        |                    |                                                                                                                                     |
|   36 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   37 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   38 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   39 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   40 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   41 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Tornado

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | TargetRadius             | Integer          |                        |                    |                                                                                                                                     |
|   17 | HitRadius                | Integer          |                        |                    |                                                                                                                                     |
|   18 | RandomPoints             | Integer          |                        |                    |                                                                                                                                     |
|   19 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   20 | SurfaceType              | Enumeration      | Surface Type           |                    |                                                                                                                                     |
|   21 | SurfaceRadius            | Integer          |                        |                    |                                                                                                                                     |
|   22 | SurfaceLifetime          | Integer          |                        |                    |                                                                                                                                     |
|   23 | SurfaceStatusChance      | Integer          |                        |                    |                                                                                                                                     |
|   24 | PointsMaxOffset          | Integer          |                        |                    |                                                                                                                                     |
|   25 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   26 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   27 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   28 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   29 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   30 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   31 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   32 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   33 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   34 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   35 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   36 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   37 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   38 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   39 | CastEffectTextEvent      | String           |                        |                    |                                                                                                                                     |
|   40 | TargetEffect             | String           |                        |                    |                                                                                                                                     |
|   41 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   42 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   43 | CleanseStatuses          | String           |                        |                    |                                                                                                                                     |
|   44 | StatusClearChance        | Integer          |                        |                    |                                                                                                                                     |
|   45 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   46 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Wall

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   16 | TargetRadius             | Integer          |                        |                    |                                                                                                                                     |
|   17 | MaxDistance              | Integer          |                        |                    |                                                                                                                                     |
|   18 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   19 | Lifetime                 | Integer          |                        |                    |                                                                                                                                     |
|   20 | GrowSpeed                | Integer          |                        |                    |                                                                                                                                     |
|   21 | GrowTimeout              | Integer          |                        |                    |                                                                                                                                     |
|   22 | SurfaceType              | Enumeration      | Surface Type           |                    |                                                                                                                                     |
|   23 | TotalSurfaceCells        | Integer          |                        |                    |                                                                                                                                     |
|   24 | SurfaceGrowStep          | Integer          |                        |                    |                                                                                                                                     |
|   25 | SurfaceGrowInterval      | Integer          |                        |                    |                                                                                                                                     |
|   26 | SurfaceLifetime          | Integer          |                        |                    |                                                                                                                                     |
|   27 | SurfaceStatusChance      | Integer          |                        |                    |                                                                                                                                     |
|   28 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   29 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   30 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   31 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   32 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   33 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   34 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   35 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   36 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   37 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   38 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   39 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   40 | CastEffectTextEvent      | String           |                        |                    |                                                                                                                                     |
|   41 | SourceTargetEffect       | String           |                        |                    |                                                                                                                                     |
|   42 | TargetTargetEffect       | String           |                        |                    |                                                                                                                                     |
|   43 | Template1                | String           |                        |                    |                                                                                                                                     |
|   44 | Template2                | String           |                        |                    |                                                                                                                                     |
|   45 | Template3                | String           |                        |                    |                                                                                                                                     |
|   46 | SpawnEffect              | String           |                        |                    |                                                                                                                                     |
|   47 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   48 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   49 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   50 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   51 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   52 | PreviewEffect            | String           |                        |                    |                                                                                                                                     |
|   53 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Teleportation

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                    | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                   | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier        | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range             | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType               | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | Memory Cost              | Integer          |                        |                    |                                                                                                                                     |
|   16 | Magic Cost               | Integer          |                        |                    |                                                                                                                                     |
|   17 | TargetRadius             | Integer          |                        |                    |                                                                                                                                     |
|   18 | AreaRadius               | Integer          |                        |                    |                                                                                                                                     |
|   19 | DeathType                | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   20 | HitRadius                | Integer          |                        |                    |                                                                                                                                     |
|   21 | Height                   | Integer          |                        |                    |                                                                                                                                     |
|   22 | Acceleration             | Integer          |                        |                    |                                                                                                                                     |
|   23 | TeleportDelay            | Integer          |                        |                    |                                                                                                                                     |
|   24 | SkillProperties          | String           |                        |                    |                                                                                                                                     |
|   25 | TargetConditions         | String           |                        |                    |                                                                                                                                     |
|   26 | TeleportSelf             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   27 | TeleportSurface          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   28 | CanTargetCharacters      | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   29 | CanTargetItems           | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   30 | CanTargetTerrain         | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   31 | Requirements             | String           |                        |                    |                                                                                                                                     |
|   32 | MemorizationRequirements | String           |                        |                    |                                                                                                                                     |
|   33 | Icon                     | String           |                        |                    |                                                                                                                                     |
|   34 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   35 | Description              | TranslatedString |                        | Stats              |                                                                                                                                     |
|   36 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                                                     |
|   37 | StatsDescriptionParams   | String           |                        |                    |                                                                                                                                     |
|   38 | FXScale                  | Integer          |                        |                    |                                                                                                                                     |
|   39 | PrepareAnimationInit     | String           |                        |                    |                                                                                                                                     |
|   40 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                                                     |
|   41 | PrepareEffect            | String           |                        |                    |                                                                                                                                     |
|   42 | CastAnimation            | String           |                        |                    |                                                                                                                                     |
|   43 | CastTextEvent            | String           |                        |                    |                                                                                                                                     |
|   44 | CastEffect               | String           |                        |                    |                                                                                                                                     |
|   45 | PreviewEffect            | String           |                        |                    |                                                                                                                                     |
|   46 | SelectedCharacterEffect  | String           |                        |                    |                                                                                                                                     |
|   47 | SelectedObjectEffect     | String           |                        |                    |                                                                                                                                     |
|   48 | SelectedPositionEffect   | String           |                        |                    |                                                                                                                                     |
|   49 | DisappearEffect          | String           |                        |                    |                                                                                                                                     |
|   50 | ReappearEffect           | String           |                        |                    |                                                                                                                                     |
|   51 | ImpactEffect             | String           |                        |                    |                                                                                                                                     |
|   52 | IgnoreVisionBlock        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   53 | ForceMove                | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   54 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   55 | OverrideSkillLevel       | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   56 | CycleConditions          | String           |                        |                    |                                                                                                                                     |

## SkillData: Path

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                           |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | Level                    | Integer          |                        |                    |                                                                                                           |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                           |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                           |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                           |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                           |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                           |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                           |
|   11 | SurfaceType              | Enumeration      | Surface Type           |                    |                                                                                                           |
|   12 | SurfaceRadius            | Integer          |                        |                    |                                                                                                           |
|   13 | SurfaceLifetime          | Integer          |                        |                    |                                                                                                           |
|   14 | SurfaceStatusChance      | Integer          |                        |                    |                                                                                                           |
|   15 | SkillProperties          | String           |                        |                    |                                                                                                           |
|   16 | MaxDistance              | Integer          |                        |                    |                                                                                                           |
|   17 | Offset                   | Integer          |                        |                    |                                                                                                           |
|   18 | HitRadius                | Integer          |                        |                    |                                                                                                           |
|   19 | Height                   | Integer          |                        |                    |                                                                                                           |
|   20 | TravelSpeed              | Integer          |                        |                    |                                                                                                           |
|   21 | Requirements             | String           |                        |                    |                                                                                                           |
|   22 | MemorizationRequirements | String           |                        |                    |                                                                                                           |
|   23 | Icon                     | String           |                        |                    |                                                                                                           |
|   24 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                           |
|   25 | Description              | TranslatedString |                        | Stats              |                                                                                                           |
|   26 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                           |
|   27 | StatsDescriptionParams   | String           |                        |                    |                                                                                                           |
|   28 | FXScale                  | Integer          |                        |                    |                                                                                                           |
|   29 | PrepareAnimationInit     | String           |                        |                    |                                                                                                           |
|   30 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                           |
|   31 | PrepareEffect            | String           |                        |                    |                                                                                                           |
|   32 | CastAnimation            | String           |                        |                    |                                                                                                           |
|   33 | CastTextEvent            | String           |                        |                    |                                                                                                           |
|   34 | CastEffect               | String           |                        |                    |                                                                                                           |
|   35 | CastEffectTextEvent      | String           |                        |                    |                                                                                                           |
|   36 | TargetEffect             | String           |                        |                    |                                                                                                           |
|   37 | FlyEffect                | String           |                        |                    |                                                                                                           |
|   38 | ImpactEffect             | String           |                        |                    |                                                                                                           |
|   39 | Memory Cost              | Integer          |                        |                    |                                                                                                           |
|   40 | Magic Cost               | Integer          |                        |                    |                                                                                                           |
|   41 | Skillbook                | String           |                        |                    |                                                                                                           |
|   42 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | CycleConditions          | String           |                        |                    |                                                                                                           |

## SkillData: Rain

|      | @name                      | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :------------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                       | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                      | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                      | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster              | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill               | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                    | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                       | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement                | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints               | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                   | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                    | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Lifetime                   | Integer          |                        |                    |                                                                                                                                     |
|   12 | SurfaceType                | Enumeration      | Surface Type           |                    |                                                                                                                                     |
|   13 | SurfaceLifetime            | Integer          |                        |                    |                                                                                                                                     |
|   14 | SurfaceStatusChance        | Integer          |                        |                    |                                                                                                                                     |
|   15 | Damage                     | Enumeration      | Qualifier              |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   16 | Damage Multiplier          | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   17 | Damage Range               | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   18 | DamageType                 | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   19 | DeathType                  | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   20 | SkillProperties            | String           |                        |                    |                                                                                                                                     |
|   21 | TargetRadius               | Integer          |                        |                    |                                                                                                                                     |
|   22 | TargetConditions           | String           |                        |                    |                                                                                                                                     |
|   23 | UseCharacterStats          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   24 | UseWeaponDamage            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   25 | UseWeaponProperties        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   26 | AreaRadius                 | Integer          |                        |                    |                                                                                                                                     |
|   27 | TotalSurfaceCells          | Integer          |                        |                    |                                                                                                                                     |
|   28 | SurfaceGrowStep            | Integer          |                        |                    |                                                                                                                                     |
|   29 | SurfaceGrowInterval        | Integer          |                        |                    |                                                                                                                                     |
|   30 | Requirements               | String           |                        |                    |                                                                                                                                     |
|   31 | MemorizationRequirements   | String           |                        |                    |                                                                                                                                     |
|   32 | Icon                       | String           |                        |                    |                                                                                                                                     |
|   33 | DisplayName                | TranslatedString |                        | Stats              |                                                                                                                                     |
|   34 | Description                | TranslatedString |                        | Stats              |                                                                                                                                     |
|   35 | StatsDescription           | TranslatedString |                        | Stats              |                                                                                                                                     |
|   36 | StatsDescriptionParams     | String           |                        |                    |                                                                                                                                     |
|   37 | FXScale                    | Integer          |                        |                    |                                                                                                                                     |
|   38 | PrepareAnimationInit       | String           |                        |                    |                                                                                                                                     |
|   39 | PrepareAnimationLoop       | String           |                        |                    |                                                                                                                                     |
|   40 | PrepareEffect              | String           |                        |                    |                                                                                                                                     |
|   41 | CastAnimation              | String           |                        |                    |                                                                                                                                     |
|   42 | CastTextEvent              | String           |                        |                    |                                                                                                                                     |
|   43 | CastEffect                 | String           |                        |                    |                                                                                                                                     |
|   44 | CastEffectTextEvent        | String           |                        |                    |                                                                                                                                     |
|   45 | TargetEffect               | String           |                        |                    |                                                                                                                                     |
|   46 | Memory Cost                | Integer          |                        |                    |                                                                                                                                     |
|   47 | Magic Cost                 | Integer          |                        |                    |                                                                                                                                     |
|   48 | RainEffect                 | String           |                        |                    |                                                                                                                                     |
|   49 | Atmosphere                 | Enumeration      | AtmosphereType         |                    |                                                                                                                                     |
|   50 | ConsequencesStartTime      | Integer          |                        |                    |                                                                                                                                     |
|   51 | ConsequencesDuration       | Integer          |                        |                    |                                                                                                                                     |
|   52 | Stealth                    | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   53 | AiCalculationSkillOverride | String           |                        |                    |                                                                                                                                     |
|   54 | CycleConditions            | String           |                        |                    |                                                                                                                                     |

## SkillData: Summon

|      | @name                      | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                       | Name             |                        |                    |                                                                                                           |
|    1 | Using                      | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | Level                      | Integer          |                        |                    |                                                                                                           |
|    3 | ForGameMaster              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | IsEnemySkill               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | Ability                    | Enumeration      | SkillAbility           |                    |                                                                                                           |
|    6 | Tier                       | Enumeration      | SkillTier              |                    |                                                                                                           |
|    7 | Requirement                | Enumeration      | SkillRequirement       |                    |                                                                                                           |
|    8 | ActionPoints               | Integer          |                        |                    |                                                                                                           |
|    9 | Cooldown                   | Integer          |                        |                    |                                                                                                           |
|   10 | AIFlags                    | Enumeration      | AIFlags                |                    |                                                                                                           |
|   11 | Lifetime                   | Integer          |                        |                    |                                                                                                           |
|   12 | SummonLevel                | Integer          |                        |                    |                                                                                                           |
|   13 | Requirements               | String           |                        |                    |                                                                                                           |
|   14 | MemorizationRequirements   | String           |                        |                    |                                                                                                           |
|   15 | SkillProperties            | String           |                        |                    |                                                                                                           |
|   16 | AoEConditions              | String           |                        |                    |                                                                                                           |
|   17 | AreaRadius                 | Integer          |                        |                    |                                                                                                           |
|   18 | Memory Cost                | Integer          |                        |                    |                                                                                                           |
|   19 | Magic Cost                 | Integer          |                        |                    |                                                                                                           |
|   20 | Template                   | String           |                        |                    |                                                                                                           |
|   21 | TemplateAdvanced           | String           |                        |                    |                                                                                                           |
|   22 | TemplateOverride           | String           |                        |                    |                                                                                                           |
|   23 | Totem                      | Enumeration      | YesNo                  |                    |                                                                                                           |
|   24 | LinkTeleports              | Enumeration      | YesNo                  |                    |                                                                                                           |
|   25 | TeleportsUseCount          | Integer          |                        |                    |                                                                                                           |
|   26 | TargetRadius               | Integer          |                        |                    |                                                                                                           |
|   27 | SummonCount                | Integer          |                        |                    |                                                                                                           |
|   28 | Icon                       | String           |                        |                    |                                                                                                           |
|   29 | DisplayName                | TranslatedString |                        | Stats              |                                                                                                           |
|   30 | Description                | TranslatedString |                        | Stats              |                                                                                                           |
|   31 | StatsDescription           | TranslatedString |                        | Stats              |                                                                                                           |
|   32 | StatsDescriptionParams     | String           |                        |                    |                                                                                                           |
|   33 | FXScale                    | Integer          |                        |                    |                                                                                                           |
|   34 | PrepareAnimationInit       | String           |                        |                    |                                                                                                           |
|   35 | PrepareAnimationLoop       | String           |                        |                    |                                                                                                           |
|   36 | PrepareEffect              | String           |                        |                    |                                                                                                           |
|   37 | CastAnimation              | String           |                        |                    |                                                                                                           |
|   38 | CastTextEvent              | String           |                        |                    |                                                                                                           |
|   39 | CastEffect                 | String           |                        |                    |                                                                                                           |
|   40 | CastEffectTextEvent        | String           |                        |                    |                                                                                                           |
|   41 | TargetCastEffect           | String           |                        |                    |                                                                                                           |
|   42 | TargetEffect               | String           |                        |                    |                                                                                                           |
|   43 | Skillbook                  | String           |                        |                    |                                                                                                           |
|   44 | Stealth                    | Enumeration      | YesNo                  |                    |                                                                                                           |
|   45 | AiCalculationSkillOverride | String           |                        |                    |                                                                                                           |
|   46 | CycleConditions            | String           |                        |                    |                                                                                                           |

## SkillData: Shout

|      | @name                      | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                                                        |
| ---: | :------------------------- | :--------------- | :--------------------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                       | Name             |                        |                    |                                                                                                                                     |
|    1 | Using                      | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           |
|    2 | Level                      | Integer          |                        |                    |                                                                                                                                     |
|    3 | ForGameMaster              | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    4 | IsEnemySkill               | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|    5 | Ability                    | Enumeration      | SkillAbility           |                    |                                                                                                                                     |
|    6 | Tier                       | Enumeration      | SkillTier              |                    |                                                                                                                                     |
|    7 | Requirement                | Enumeration      | SkillRequirement       |                    |                                                                                                                                     |
|    8 | ActionPoints               | Integer          |                        |                    |                                                                                                                                     |
|    9 | Cooldown                   | Integer          |                        |                    |                                                                                                                                     |
|   10 | AIFlags                    | Enumeration      | AIFlags                |                    |                                                                                                                                     |
|   11 | Damage                     | Enumeration      | DamageSourceType       |                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   12 | Damage Multiplier          | Integer          |                        |                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | Damage Range               | Integer          |                        |                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   14 | DamageType                 | Enumeration      | Damage Type            |                    |                                                                                                                                     |
|   15 | SkillProperties            | String           |                        |                    |                                                                                                                                     |
|   16 | AreaRadius                 | Integer          |                        |                    |                                                                                                                                     |
|   17 | AddWeaponRange             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   18 | DeathType                  | Enumeration      | Death Type             |                    |                                                                                                                                     |
|   19 | TargetConditions           | String           |                        |                    |                                                                                                                                     |
|   20 | AoEConditions              | String           |                        |                    |                                                                                                                                     |
|   21 | UseCharacterStats          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   22 | UseWeaponDamage            | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   23 | UseWeaponProperties        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   24 | Autocast                   | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   25 | Requirements               | String           |                        |                    |                                                                                                                                     |
|   26 | MemorizationRequirements   | String           |                        |                    |                                                                                                                                     |
|   27 | Icon                       | String           |                        |                    |                                                                                                                                     |
|   28 | DisplayName                | TranslatedString |                        | Stats              |                                                                                                                                     |
|   29 | Description                | TranslatedString |                        | Stats              |                                                                                                                                     |
|   30 | StatsDescription           | TranslatedString |                        | Stats              |                                                                                                                                     |
|   31 | StatsDescriptionParams     | String           |                        |                    |                                                                                                                                     |
|   32 | FXScale                    | Integer          |                        |                    |                                                                                                                                     |
|   33 | PrepareAnimationInit       | String           |                        |                    |                                                                                                                                     |
|   34 | PrepareAnimationLoop       | String           |                        |                    |                                                                                                                                     |
|   35 | PrepareEffect              | String           |                        |                    |                                                                                                                                     |
|   36 | CastAnimation              | String           |                        |                    |                                                                                                                                     |
|   37 | CastTextEvent              | String           |                        |                    |                                                                                                                                     |
|   38 | CastEffect                 | String           |                        |                    |                                                                                                                                     |
|   39 | HitEffect                  | String           |                        |                    |                                                                                                                                     |
|   40 | CastEffectTextEvent        | String           |                        |                    |                                                                                                                                     |
|   41 | WeaponBones                | String           |                        |                    |                                                                                                                                     |
|   42 | Memory Cost                | Integer          |                        |                    |                                                                                                                                     |
|   43 | Magic Cost                 | Integer          |                        |                    |                                                                                                                                     |
|   44 | CleanseStatuses            | String           |                        |                    |                                                                                                                                     |
|   45 | StatusClearChance          | Integer          |                        |                    |                                                                                                                                     |
|   46 | Stealth                    | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   47 | PushDistance               | Integer          |                        |                    |                                                                                                                                     |
|   48 | CanTargetCharacters        | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   49 | CanTargetItems             | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   50 | PushPullEffect             | String           |                        |                    |                                                                                                                                     |
|   51 | IgnoreVisionBlock          | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   52 | AiCalculationSkillOverride | String           |                        |                    |                                                                                                                                     |
|   53 | IgnoreSilence              | Enumeration      | YesNo                  |                    |                                                                                                                                     |
|   54 | CycleConditions            | String           |                        |                    |                                                                                                                                     |

## SkillData: Dome

|      | @name                    | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :----------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                     | Name             |                        |                    |                                                                                                           |
|    1 | Using                    | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | Level                    | Integer          |                        |                    |                                                                                                           |
|    3 | ForGameMaster            | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | IsEnemySkill             | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | Ability                  | Enumeration      | SkillAbility           |                    |                                                                                                           |
|    6 | Tier                     | Enumeration      | SkillTier              |                    |                                                                                                           |
|    7 | Requirement              | Enumeration      | SkillRequirement       |                    |                                                                                                           |
|    8 | ActionPoints             | Integer          |                        |                    |                                                                                                           |
|    9 | Cooldown                 | Integer          |                        |                    |                                                                                                           |
|   10 | AIFlags                  | Enumeration      | AIFlags                |                    |                                                                                                           |
|   11 | Lifetime                 | Integer          |                        |                    |                                                                                                           |
|   12 | SkillProperties          | String           |                        |                    |                                                                                                           |
|   13 | TargetConditions         | String           |                        |                    |                                                                                                           |
|   14 | AuraSelf                 | String           |                        |                    |                                                                                                           |
|   15 | AuraAllies               | String           |                        |                    |                                                                                                           |
|   16 | AuraNeutrals             | String           |                        |                    |                                                                                                           |
|   17 | AuraEnemies              | String           |                        |                    |                                                                                                           |
|   18 | AuraItems                | String           |                        |                    |                                                                                                           |
|   19 | TargetRadius             | Integer          |                        |                    |                                                                                                           |
|   20 | UseCharacterStats        | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | AreaRadius               | Integer          |                        |                    |                                                                                                           |
|   22 | Requirements             | String           |                        |                    |                                                                                                           |
|   23 | MemorizationRequirements | String           |                        |                    |                                                                                                           |
|   24 | Icon                     | String           |                        |                    |                                                                                                           |
|   25 | DisplayName              | TranslatedString |                        | Stats              |                                                                                                           |
|   26 | Description              | TranslatedString |                        | Stats              |                                                                                                           |
|   27 | StatsDescription         | TranslatedString |                        | Stats              |                                                                                                           |
|   28 | StatsDescriptionParams   | String           |                        |                    |                                                                                                           |
|   29 | FXScale                  | Integer          |                        |                    |                                                                                                           |
|   30 | PrepareAnimationInit     | String           |                        |                    |                                                                                                           |
|   31 | PrepareAnimationLoop     | String           |                        |                    |                                                                                                           |
|   32 | PrepareEffect            | String           |                        |                    |                                                                                                           |
|   33 | CastAnimation            | String           |                        |                    |                                                                                                           |
|   34 | CastTextEvent            | String           |                        |                    |                                                                                                           |
|   35 | CastEffect               | String           |                        |                    |                                                                                                           |
|   36 | CastEffectTextEvent      | String           |                        |                    |                                                                                                           |
|   37 | TargetEffect             | String           |                        |                    |                                                                                                           |
|   38 | Memory Cost              | Integer          |                        |                    |                                                                                                           |
|   39 | Magic Cost               | Integer          |                        |                    |                                                                                                           |
|   40 | DomeEffect               | String           |                        |                    |                                                                                                           |
|   41 | Stealth                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | CycleConditions          | String           |                        |                    |                                                                                                           |

## StatusData: Status_CONSUME

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |
|   45 | Items                        | String           |                        |                    |                                                                                                           |
|   46 | WeaponOverride               | String           |                        |                    |                                                                                                           |
|   47 | ResetCooldowns               | String           |                        |                    |                                                                                                           |
|   48 | ResetOncePerCombat           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   49 | ScaleWithVitality            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   50 | LeaveAction                  | String           |                        |                    |                                                                                                           |
|   51 | DieAction                    | String           |                        |                    |                                                                                                           |
|   52 | ForceStackOverwrite          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   53 | Toggle                       | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_DAMAGE

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |
|   45 | DamageEvent                  | Enumeration      | StatusEvent            |                    |                                                                                                           |
|   46 | DamageStats                  | String           |                        |                    |                                                                                                           |
|   47 | DeathType                    | Enumeration      | Death Type             |                    |                                                                                                           |
|   48 | DamageCharacters             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   49 | DamageItems                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   50 | DamageTorches                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   51 | PermanentOnTorch             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   52 | SpawnBlood                   | Enumeration      | YesNo                  |                    |                                                                                                           |
|   53 | ScaleWithVitality            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   54 | TickSFX                      | String           |                        |                    |                                                                                                           |

## StatusData: Status_HEAL

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | HealStat                     | Enumeration      | StatusHealType         |                    |                                                                                                           |
|   45 | HealType                     | Enumeration      | HealValueType          |                    |                                                                                                           |
|   46 | HealValue                    | Integer          |                        |                    |                                                                                                           |
|   47 | AbsorbSurfaceType            | String           |                        |                    |                                                                                                           |
|   48 | AbsorbSurfaceRange           | Integer          |                        |                    |                                                                                                           |
|   49 | BonusFromAbility             | Enumeration      | Ability                |                    |                                                                                                           |
|   50 | HealEffectId                 | String           |                        |                    |                                                                                                           |
|   51 | VampirismType                | Enumeration      | VampirismType          |                    |                                                                                                           |
|   52 | Necromantic                  | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_HEALING

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | OverrideDefaultDescription   | Enumeration      | YesNo                  |                    |                                                                                                           |
|    9 | Icon                         | String           |                        |                    |                                                                                                           |
|   10 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   11 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   12 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   13 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   15 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   16 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   17 | Material                     | String           |                        |                    |                                                                                                           |
|   18 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   22 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   24 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   25 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   26 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   27 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   28 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   29 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   30 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   31 | StatsId                      | String           |                        |                    |                                                                                                           |
|   32 | StackId                      | String           |                        |                    |                                                                                                           |
|   33 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   34 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   35 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   36 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   37 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   38 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   39 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   40 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   41 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   42 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   45 | Skills                       | String           |                        |                    |                                                                                                           |
|   46 | HealingEvent                 | Enumeration      | StatusEvent            |                    |                                                                                                           |
|   47 | HealStat                     | Enumeration      | StatusHealType         |                    |                                                                                                           |
|   48 | HealType                     | Enumeration      | HealValueType          |                    |                                                                                                           |
|   49 | HealValue                    | Integer          |                        |                    |                                                                                                           |
|   50 | SkipInitialEffect            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   51 | AbsorbSurfaceType            | String           |                        |                    |                                                                                                           |
|   52 | AbsorbSurfaceRange           | Integer          |                        |                    |                                                                                                           |
|   53 | HealEffectId                 | String           |                        |                    |                                                                                                           |
|   54 | Necromantic                  | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_FEAR

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |

## StatusData: Status_POLYMORPHED

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |
|   45 | PolymorphResult              | String           |                        |                    |                                                                                                           |
|   46 | DisableInteractions          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   47 | AiCalculationSkillOverride   | String           |                        |                    |                                                                                                           |
|   48 | Toggle                       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   49 | RetainSkills                 | String           |                        |                    |                                                                                                           |

## StatusData: Status_KNOCKED_DOWN

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | Instant                      | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_STANCE

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |

## StatusData: Status_INCAPACITATED

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |
|   45 | FreezeTime                   | Integer          |                        |                    |                                                                                                           |
|   46 | ApplyStatusOnTick            | String           |                        |                    |                                                                                                           |

## StatusData: Status_BLIND

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |

## StatusData: Status_GUARDIAN_ANGEL

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |
|   45 | DamagePercentage             | Integer          |                        |                    |                                                                                                           |

## StatusData: Status_DAMAGE_ON_MOVE

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |
|   45 | DamageEvent                  | Enumeration      | StatusEvent            |                    |                                                                                                           |
|   46 | DamageStats                  | String           |                        |                    |                                                                                                           |
|   47 | DeathType                    | Enumeration      | Death Type             |                    |                                                                                                           |
|   48 | DamageCharacters             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   49 | DamageItems                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   50 | DamageTorches                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   51 | PermanentOnTorch             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   52 | SpawnBlood                   | Enumeration      | YesNo                  |                    |                                                                                                           |
|   53 | TickSFX                      | String           |                        |                    |                                                                                                           |

## StatusData: Status_DEMONIC_BARGAIN

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | Skills                       | String           |                        |                    |                                                                                                           |

## StatusData: Status_CHALLENGE

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | DescriptionCaster            | String           |                        |                    |                                                                                                           |
|    7 | DescriptionTarget            | String           |                        |                    |                                                                                                           |
|    8 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    9 | Icon                         | String           |                        |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   13 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   15 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   16 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   17 | Material                     | String           |                        |                    |                                                                                                           |
|   18 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   22 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   24 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   25 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   26 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   27 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   28 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   29 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   30 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   31 | StatsId                      | String           |                        |                    |                                                                                                           |
|   32 | StackId                      | String           |                        |                    |                                                                                                           |
|   33 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   34 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   35 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   36 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   37 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   38 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   39 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   40 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   41 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |
|   45 | WinBoost                     | String           |                        |                    |                                                                                                           |
|   46 | LoseBoost                    | String           |                        |                    |                                                                                                           |

## StatusData: Status_FLOATING

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | Items                        | String           |                        |                    |                                                                                                           |
|   45 | OnlyWhileMoving              | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_THROWN

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | Skills                       | String           |                        |                    |                                                                                                           |
|   43 | Items                        | String           |                        |                    |                                                                                                           |

## StatusData: Status_DISARMED

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |

## StatusData: Status_HEAL_SHARING

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |

## StatusData: Status_HEAL_SHARING_CASTER

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | BeamEffect                   | String           |                        |                    |                                                                                                           |
|   45 | HealMultiplier               | Integer          |                        |                    |                                                                                                           |

## StatusData: Status_ACTIVE_DEFENSE

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | Items                        | String           |                        |                    |                                                                                                           |
|   45 | WeaponOverride               | String           |                        |                    |                                                                                                           |
|   46 | ResetCooldowns               | String           |                        |                    |                                                                                                           |
|   47 | ResetOncePerCombat           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   48 | ScaleWithVitality            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   49 | TargetEffect                 | String           |                        |                    |                                                                                                           |
|   50 | Projectile                   | String           |                        |                    |                                                                                                           |
|   51 | Radius                       | Integer          |                        |                    |                                                                                                           |
|   52 | Charges                      | Integer          |                        |                    |                                                                                                           |
|   53 | DefendTargetPosition         | Enumeration      | YesNo                  |                    |                                                                                                           |
|   54 | TargetConditions             | String           |                        |                    |                                                                                                           |

## StatusData: Status_SPARK

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | Items                        | String           |                        |                    |                                                                                                           |
|   45 | WeaponOverride               | String           |                        |                    |                                                                                                           |
|   46 | ResetCooldowns               | String           |                        |                    |                                                                                                           |
|   47 | ResetOncePerCombat           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   48 | ScaleWithVitality            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   49 | Projectile                   | String           |                        |                    |                                                                                                           |
|   50 | Radius                       | Integer          |                        |                    |                                                                                                           |
|   51 | Charges                      | Integer          |                        |                    |                                                                                                           |
|   52 | TargetConditions             | String           |                        |                    |                                                                                                           |

## StatusData: Status_PLAY_DEAD

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | Items                        | String           |                        |                    |                                                                                                           |
|   45 | WeaponOverride               | String           |                        |                    |                                                                                                           |
|   46 | ResetCooldowns               | String           |                        |                    |                                                                                                           |
|   47 | ResetOncePerCombat           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   48 | ScaleWithVitality            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   49 | FreezeCooldowns              | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_INVISIBLE

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | Items                        | String           |                        |                    |                                                                                                           |
|   45 | WeaponOverride               | String           |                        |                    |                                                                                                           |
|   46 | ResetCooldowns               | String           |                        |                    |                                                                                                           |
|   47 | ResetOncePerCombat           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   48 | ScaleWithVitality            | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_DEACTIVATED

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | Items                        | String           |                        |                    |                                                                                                           |
|   45 | WeaponOverride               | String           |                        |                    |                                                                                                           |
|   46 | ResetCooldowns               | String           |                        |                    |                                                                                                           |
|   47 | ResetOncePerCombat           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   48 | ScaleWithVitality            | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_EFFECT

|      | @name              | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :----------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name               | Name             |                        |                    |                                                                                                           |
|    1 | Using              | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster      | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat     | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat    | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName        | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description        | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | Icon               | String           |                        |                    |                                                                                                           |
|    8 | FormatColor        | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|    9 | StatusEffect       | String           |                        |                    |                                                                                                           |
|   10 | ForceOverhead      | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | BeamEffect         | String           |                        |                    |                                                                                                           |
|   12 | PlayerSameParty    | Enumeration      | YesNo                  |                    |                                                                                                           |
|   13 | PlayerHasTag       | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn | String           |                        |                    |                                                                                                           |
|   15 | PeaceOnly          | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_EXTRA_TURN

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | Skills                       | String           |                        |                    |                                                                                                           |
|   44 | Items                        | String           |                        |                    |                                                                                                           |
|   45 | WeaponOverride               | String           |                        |                    |                                                                                                           |
|   46 | ResetCooldowns               | String           |                        |                    |                                                                                                           |
|   47 | ResetOncePerCombat           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   48 | ScaleWithVitality            | Enumeration      | YesNo                  |                    |                                                                                                           |

## StatusData: Status_CHARMED

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |

## StatusData: Status_MUTED

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |

## StatusData: Status_DECAYING_TOUCH

|      | @name                        | @type            | @enumeration_type_name | @loca_sub_category | @description                                                                                              |
| ---: | :--------------------------- | :--------------- | :--------------------- | :----------------- | :-------------------------------------------------------------------------------------------------------- |
|    0 | Name                         | Name             |                        |                    |                                                                                                           |
|    1 | Using                        | BaseClass        |                        |                    | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
|    2 | ForGameMaster                | Enumeration      | YesNo                  |                    |                                                                                                           |
|    3 | InitiateCombat               | Enumeration      | YesNo                  |                    |                                                                                                           |
|    4 | BringIntoCombat              | Enumeration      | YesNo                  |                    |                                                                                                           |
|    5 | DisplayName                  | TranslatedString |                        | Stats              |                                                                                                           |
|    6 | Description                  | TranslatedString |                        | Stats              |                                                                                                           |
|    7 | DescriptionParams            | String           |                        |                    |                                                                                                           |
|    8 | Icon                         | String           |                        |                    |                                                                                                           |
|    9 | FormatColor                  | Enumeration      | FormatStringColor      |                    |                                                                                                           |
|   10 | ForceOverhead                | Enumeration      | YesNo                  |                    |                                                                                                           |
|   11 | ApplyEffect                  | String           |                        |                    |                                                                                                           |
|   12 | StatusEffect                 | String           |                        |                    |                                                                                                           |
|   13 | StatusEffectOverrideForItems | String           |                        |                    |                                                                                                           |
|   14 | StatusEffectOnTurn           | String           |                        |                    |                                                                                                           |
|   15 | MaterialType                 | Enumeration      | MaterialType           |                    |                                                                                                           |
|   16 | Material                     | String           |                        |                    |                                                                                                           |
|   17 | MaterialApplyBody            | Enumeration      | YesNo                  |                    |                                                                                                           |
|   18 | MaterialApplyArmor           | Enumeration      | YesNo                  |                    |                                                                                                           |
|   19 | MaterialApplyWeapon          | Enumeration      | YesNo                  |                    |                                                                                                           |
|   20 | MaterialApplyNormalMap       | Enumeration      | YesNo                  |                    |                                                                                                           |
|   21 | MaterialFadeAmount           | Integer          |                        |                    |                                                                                                           |
|   22 | MaterialOverlayOffset        | Integer          |                        |                    |                                                                                                           |
|   23 | MaterialParameters           | String           |                        |                    |                                                                                                           |
|   24 | SoundStart                   | String           |                        |                    |                                                                                                           |
|   25 | SoundLoop                    | String           |                        |                    |                                                                                                           |
|   26 | SoundStop                    | String           |                        |                    |                                                                                                           |
|   27 | SavingThrow                  | Enumeration      | SavingThrow            |                    |                                                                                                           |
|   28 | ImmuneFlag                   | Enumeration      | AttributeFlag          |                    |                                                                                                           |
|   29 | IsChanneled                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   30 | StatsId                      | String           |                        |                    |                                                                                                           |
|   31 | StackId                      | String           |                        |                    |                                                                                                           |
|   32 | StackPriority                | Integer          |                        |                    |                                                                                                           |
|   33 | AuraRadius                   | Integer          |                        |                    |                                                                                                           |
|   34 | AuraSelf                     | String           |                        |                    |                                                                                                           |
|   35 | AuraAllies                   | String           |                        |                    |                                                                                                           |
|   36 | AuraNeutrals                 | String           |                        |                    |                                                                                                           |
|   37 | AuraEnemies                  | String           |                        |                    |                                                                                                           |
|   38 | AuraItems                    | String           |                        |                    |                                                                                                           |
|   39 | AuraFX                       | String           |                        |                    |                                                                                                           |
|   40 | SurfaceChange                | String           |                        |                    |                                                                                                           |
|   41 | IsInvulnerable               | Enumeration      | YesNo                  |                    |                                                                                                           |
|   42 | IsResistingDeath             | Enumeration      | YesNo                  |                    |                                                                                                           |
|   43 | LoseControl                  | Enumeration      | YesNo                  |                    |                                                                                                           |
|   44 | Skills                       | String           |                        |                    |                                                                                                           |