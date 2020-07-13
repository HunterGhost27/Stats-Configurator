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

|      | @name                         | @type           | @description                                                                                                                                                                                            | @enumeration_type_name |
| ---: | :---------------------------- | :-------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :--------------------- |
|    0 | Name                          | Name            | nan                                                                                                                                                                                                     | nan                    |
|    1 | Using                         | BaseClass       | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                                                                                               | nan                    |
|    2 | Act                           | Enumeration     | nan                                                                                                                                                                                                     | Act                    |
|    3 | Act part                      | Enumeration     | nan                                                                                                                                                                                                     | ActPart                |
|    4 | Act strength                  | Enumeration     | nan                                                                                                                                                                                                     | Penalty Qualifier      |
|    5 | Strength                      | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 | PreciseQualifier       |
|    6 | Finesse                       | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 | PreciseQualifier       |
|    7 | Intelligence                  | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 | PreciseQualifier       |
|    8 | Constitution                  | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 | PreciseQualifier       |
|    9 | Memory                        | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 | PreciseQualifier       |
|   10 | Wits                          | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level.                                 | PreciseQualifier       |
|   11 | Armor                         | Integer         | Enter a positive percentage value. 100 will give you average Armour amount for a heavy character of corresponding level.                                                                                | nan                    |
|   12 | ArmorBoost                    | Integer         | Enter a percentage value that will modify base Armour. E.g. -50 will halve current armour, 50 will produce 150% base armour. Helpful if you are inheriting and need 200% Armour compared to the parent. | nan                    |
|   13 | ArmorBoostGrowthPerLevel      | Integer         | This parameter increases ArmorBoost by (Level-1)*param*0.1                                                                                                                                              | nan                    |
|   14 | MagicArmor                    | Integer         | Enter a positive percentage value. 100 will give you average Armour amount for a heavy character of corresponding level.                                                                                | nan                    |
|   15 | MagicArmorBoost               | Integer         | Enter a percentage value that will modify base Armour. E.g. -50 will halve current armour, 50 will produce 150% base armour. Helpful if you are inheriting and need 200% Armour compared to the parent. | nan                    |
|   16 | MagicArmorBoostGrowthPerLevel | Integer         | This parameter increases MagicArmorBoost by (Level-1)*param*0.1                                                                                                                                         | nan                    |
|   17 | Reflexes                      | String          | nan                                                                                                                                                                                                     | nan                    |
|   18 | Vitality                      | Integer         | Enter a positive percentage value. 100 will give you average Vitality amount for a character of corresponding level.                                                                                    | nan                    |
|   19 | DamageBoost                   | Integer         | Enter a percentage value, can be negative. E.g. -30 will reduce all damage inflicted by this character by 30%.                                                                                          | nan                    |
|   20 | DamageBoostGrowthPerLevel     | Integer         | This parameter increase DamageBoost by (Level-1)*param*0.1                                                                                                                                              | nan                    |
|   21 | MagicPoints                   | Integer         | Maximum amount of Source Points the character can hold                                                                                                                                                  | nan                    |
|   22 | ChanceToHitBoost              | Integer         | nan                                                                                                                                                                                                     | nan                    |
|   23 | APMaximum                     | Integer         | nan                                                                                                                                                                                                     | nan                    |
|   24 | APStart                       | Integer         | AP granted at the start of combat.                                                                                                                                                                      | nan                    |
|   25 | APRecovery                    | Integer         | AP restored each turn                                                                                                                                                                                   | nan                    |
|   26 | MPStart                       | Integer         | Source Points amount on character creation                                                                                                                                                              | nan                    |
|   27 | Movement                      | Integer         | Distance in centimeters per AP spent on movement in combat.                                                                                                                                             | nan                    |
|   28 | MovementSpeedBoost            | Integer         | Percentage value, 50 produces a character with 150% base Movement.                                                                                                                                      | nan                    |
|   29 | Gain                          | Enumeration     | Enter a positive percentage value. E.g. level 3 character with '5' Gain will produce enough XP to cover 5% of experience needed to advance from level 3 to level 4.                                     | BigQualifier           |
|   30 | Sight                         | Enumeration     | nan                                                                                                                                                                                                     | Penalty Qualifier      |
|   31 | Hearing                       | Enumeration     | nan                                                                                                                                                                                                     | Penalty Qualifier      |
|   32 | Initiative                    | Integer         | nan                                                                                                                                                                                                     | nan                    |
|   33 | FOV                           | Integer         | nan                                                                                                                                                                                                     | nan                    |
|   34 | Weight                        | Integer         | In grams, relevant for some types of puzzles.                                                                                                                                                           | nan                    |
|   35 | StepsType                     | Enumeration     | nan                                                                                                                                                                                                     | StepsType              |
|   36 | PiercingResistance            | Integer         | Enter a percentage value, can be negative.                                                                                                                                                              | nan                    |
|   37 | PhysicalResistance            | Integer         | Enter a percentage value, can be negative.                                                                                                                                                              | nan                    |
|   38 | CriticalChance                | Enumeration     | nan                                                                                                                                                                                                     | Penalty Qualifier      |
|   39 | MaxResistance                 | Integer         | Enter a positive percentage value. Default cap is 200.                                                                                                                                                  | nan                    |
|   40 | FireResistance                | Integer         | Enter a percentage value, can be negative.                                                                                                                                                              | nan                    |
|   41 | EarthResistance               | Integer         | Enter a percentage value, can be negative.                                                                                                                                                              | nan                    |
|   42 | WaterResistance               | Integer         | Enter a percentage value, can be negative.                                                                                                                                                              | nan                    |
|   43 | AirResistance                 | Integer         | Enter a percentage value, can be negative.                                                                                                                                                              | nan                    |
|   44 | PoisonResistance              | Integer         | Enter a percentage value, can be negative.                                                                                                                                                              | nan                    |
|   45 | SingleHanded                  | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   46 | TwoHanded                     | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   47 | Ranged                        | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   48 | DualWielding                  | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   49 | Leadership                    | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   50 | PainReflection                | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   51 | Perseverance                  | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   52 | RogueLore                     | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   53 | WarriorLore                   | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   54 | RangerLore                    | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   55 | FireSpecialist                | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   56 | WaterSpecialist               | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   57 | AirSpecialist                 | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   58 | EarthSpecialist               | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   59 | Sourcery                      | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   60 | Necromancy                    | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   61 | Polymorph                     | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   62 | Summoning                     | Integer         | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level.                                     | nan                    |
|   63 | Telekinesis                   | Integer         | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     | nan                    |
|   64 | Sneaking                      | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                                                             | nan                    |
|   65 | Thievery                      | Integer         | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     | nan                    |
|   66 | Loremaster                    | Integer         | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     | nan                    |
|   67 | Repair                        | Integer         | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     | nan                    |
|   68 | Barter                        | Integer         | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     | nan                    |
|   69 | Persuasion                    | Integer         | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     | nan                    |
|   70 | Luck                          | Integer         | Enter a flat value. Default civil ability cap is 5.                                                                                                                                                     | nan                    |
|   71 | Accuracy                      | Integer         | Enter a percentage value                                                                                                                                                                                | nan                    |
|   72 | Dodge                         | Integer         | Enter a percentage value                                                                                                                                                                                | nan                    |
|   73 | Reflection                    | String          | nan                                                                                                                                                                                                     | nan                    |
|   74 | MaxSummons                    | Integer         | nan                                                                                                                                                                                                     | nan                    |
|   75 | ExtraProperties               | String          | nan                                                                                                                                                                                                     | nan                    |
|   76 | Flags                         | EnumerationList | nan                                                                                                                                                                                                     | AttributeFlags         |
|   77 | Talents                       | String          | nan                                                                                                                                                                                                     | nan                    |
|   78 | Traits                        | String          | nan                                                                                                                                                                                                     | nan                    |
|   79 | PathInfluence                 | String          | nan                                                                                                                                                                                                     | nan                    |
|   80 | Comment                       | Comment         | nan                                                                                                                                                                                                     | nan                    |

## Stats: Potion

|      | @name                      | @type           | @description                                                                                                                                                        | @enumeration_type_name   |
| ---: | :------------------------- | :-------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------------------- |
|    0 | Name                       | Name            | nan                                                                                                                                                                 | nan                      |
|    1 | Using                      | BaseClass       | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                                                           | nan                      |
|    2 | RootTemplate               | RootTemplate    | nan                                                                                                                                                                 | nan                      |
|    3 | Act                        | Enumeration     | nan                                                                                                                                                                 | Act                      |
|    4 | Act part                   | Enumeration     | nan                                                                                                                                                                 | ActPart                  |
|    5 | Act strength               | String          | nan                                                                                                                                                                 | nan                      |
|    6 | StackId                    | String          | nan                                                                                                                                                                 | nan                      |
|    7 | ComboCategory              | String          | nan                                                                                                                                                                 | nan                      |
|    8 | AuraRadius                 | Integer         | nan                                                                                                                                                                 | nan                      |
|    9 | AuraSelf                   | String          | nan                                                                                                                                                                 | nan                      |
|   10 | AuraAllies                 | String          | nan                                                                                                                                                                 | nan                      |
|   11 | AuraNeutrals               | String          | nan                                                                                                                                                                 | nan                      |
|   12 | AuraEnemies                | String          | nan                                                                                                                                                                 | nan                      |
|   13 | AuraItems                  | String          | nan                                                                                                                                                                 | nan                      |
|   14 | AuraFX                     | String          | nan                                                                                                                                                                 | nan                      |
|   15 | Weight                     | Integer         | nan                                                                                                                                                                 | nan                      |
|   16 | Value                      | Integer         | nan                                                                                                                                                                 | nan                      |
|   17 | Strength                   | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      | Penalty PreciseQualifier |
|   18 | Finesse                    | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      | Penalty PreciseQualifier |
|   19 | Intelligence               | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      | Penalty PreciseQualifier |
|   20 | Constitution               | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      | Penalty PreciseQualifier |
|   21 | Memory                     | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      | Penalty PreciseQualifier |
|   22 | Wits                       | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                                                      | Penalty PreciseQualifier |
|   23 | SingleHanded               | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   24 | TwoHanded                  | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   25 | Ranged                     | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   26 | DualWielding               | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   27 | PhysicalArmorMastery       | String          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   28 | MagicArmorMastery          | String          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   29 | VitalityMastery            | String          | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   30 | PainReflection             | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   31 | WarriorLore                | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   32 | RangerLore                 | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   33 | RogueLore                  | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   34 | Sourcery                   | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   35 | Telekinesis                | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   36 | FireSpecialist             | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   37 | WaterSpecialist            | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   38 | AirSpecialist              | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   39 | EarthSpecialist            | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   40 | Necromancy                 | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   41 | Polymorph                  | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   42 | Summoning                  | Integer         | Enter a flat value. Combat Ability cap is 10.                                                                                                                       | nan                      |
|   43 | Sneaking                   | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   44 | Thievery                   | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   45 | Loremaster                 | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   46 | Repair                     | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   47 | Barter                     | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   48 | Persuasion                 | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   49 | Leadership                 | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   50 | Luck                       | Integer         | Enter a flat value. Civil Ability cap is 5.                                                                                                                         | nan                      |
|   51 | FireResistance             | Integer         | Enter a percentage value, can be negative.                                                                                                                          | nan                      |
|   52 | EarthResistance            | Integer         | Enter a percentage value, can be negative.                                                                                                                          | nan                      |
|   53 | WaterResistance            | Integer         | Enter a percentage value, can be negative.                                                                                                                          | nan                      |
|   54 | AirResistance              | Integer         | Enter a percentage value, can be negative.                                                                                                                          | nan                      |
|   55 | PoisonResistance           | Integer         | Enter a percentage value, can be negative.                                                                                                                          | nan                      |
|   56 | PiercingResistance         | Integer         | Enter a percentage value, can be negative.                                                                                                                          | nan                      |
|   57 | PhysicalResistance         | Integer         | Enter a percentage value, can be negative.                                                                                                                          | nan                      |
|   58 | Sight                      | Integer         | nan                                                                                                                                                                 | nan                      |
|   59 | Hearing                    | Enumeration     | nan                                                                                                                                                                 | Penalty Qualifier        |
|   60 | Initiative                 | Integer         | nan                                                                                                                                                                 | nan                      |
|   61 | Movement                   | Integer         | Enter a flat value in centimeters.                                                                                                                                  | nan                      |
|   62 | MovementSpeedBoost         | Integer         | Enter a percentage value, can be negative.                                                                                                                          | nan                      |
|   63 | Vitality                   | Integer         | Enter a percentage value. Potion will heal the character for Vitality amount provided by code. E.g. 100 is the standard heal amount for the level of the character. | nan                      |
|   64 | VitalityBoost              | Integer         | Enter a percentage value, can be negative. E.g. '10' produces you +10% character's base maximum Vitality.                                                           | nan                      |
|   65 | VitalityPercentage         | Integer         | Enter a positive percentage value. Potion will heal the character for Vitality amount equal to the percentage of their maximum Vitality.                            | nan                      |
|   66 | ChanceToHitBoost           | Integer         | nan                                                                                                                                                                 | nan                      |
|   67 | AccuracyBoost              | Integer         | nan                                                                                                                                                                 | nan                      |
|   68 | DodgeBoost                 | Integer         | nan                                                                                                                                                                 | nan                      |
|   69 | DamageBoost                | Integer         | nan                                                                                                                                                                 | nan                      |
|   70 | RangeBoost                 | Integer         | nan                                                                                                                                                                 | nan                      |
|   71 | APCostBoost                | Integer         | nan                                                                                                                                                                 | nan                      |
|   72 | SPCostBoost                | Integer         | nan                                                                                                                                                                 | nan                      |
|   73 | APMaximum                  | Integer         | nan                                                                                                                                                                 | nan                      |
|   74 | APStart                    | Integer         | nan                                                                                                                                                                 | nan                      |
|   75 | APRecovery                 | Integer         | nan                                                                                                                                                                 | nan                      |
|   76 | CriticalChance             | Integer         | nan                                                                                                                                                                 | nan                      |
|   77 | Gain                       | Enumeration     | nan                                                                                                                                                                 | BigQualifier             |
|   78 | Armor                      | Integer         | Enter a percentage value, can be negative. Code will turn it into a flat bonus\malus. E.g. '50' produces half of an average Armour buff.                            | nan                      |
|   79 | ArmorBoost                 | Integer         | Enter a percentage value, can be negative. This value modifies character's maximum Armour by a percentage. E.g. '10' produces +10% of character's maximum Armour.   | nan                      |
|   80 | MagicArmor                 | Integer         | Enter a percentage value, can be negative. Code will turn it into a flat bonus\malus. E.g. '50' produces half of an average Armour buff.                            | nan                      |
|   81 | MagicArmorBoost            | Integer         | Enter a percentage value, can be negative. This value modifies character's maximum Armour by a percentage. E.g. '10' produces +10% of character's maximum Armour.   | nan                      |
|   82 | Duration                   | Integer         | nan                                                                                                                                                                 | nan                      |
|   83 | UseAPCost                  | Integer         | nan                                                                                                                                                                 | nan                      |
|   84 | Reflection                 | String          | nan                                                                                                                                                                 | nan                      |
|   85 | LifeSteal                  | Integer         | Enter a positive percentage value. Any damage to Vitality that owner character inflicts will turn into a heal modified by this percentage value.                    | nan                      |
|   86 | Damage                     | Enumeration     | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage.                                 | Qualifier                |
|   87 | Damage Multiplier          | Integer         | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                                                           | nan                      |
|   88 | Damage Range               | Integer         | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                                                  | nan                      |
|   89 | DamageType                 | Enumeration     | nan                                                                                                                                                                 | Damage Type              |
|   90 | ActionPoints               | Integer         | nan                                                                                                                                                                 | nan                      |
|   91 | MagicPoints                | Integer         | nan                                                                                                                                                                 | nan                      |
|   92 | BloodSurfaceType           | String          | nan                                                                                                                                                                 | nan                      |
|   93 | MaxSummons                 | Integer         | nan                                                                                                                                                                 | nan                      |
|   94 | AddToBottomBar             | Enumeration     | nan                                                                                                                                                                 | YesNo                    |
|   95 | ExtraProperties            | String          | nan                                                                                                                                                                 | nan                      |
|   96 | BoostConditions            | String          | nan                                                                                                                                                                 | nan                      |
|   97 | Flags                      | EnumerationList | nan                                                                                                                                                                 | AttributeFlags           |
|   98 | BonusWeapon                | String          | Enter a stat name from Weapon file.                                                                                                                                 | nan                      |
|   99 | StatusEffect               | String          | nan                                                                                                                                                                 | nan                      |
|  100 | StatusIcon                 | String          | nan                                                                                                                                                                 | nan                      |
|  101 | StatusMaterial             | String          | nan                                                                                                                                                                 | nan                      |
|  102 | SavingThrow                | Enumeration     | nan                                                                                                                                                                 | SavingThrow              |
|  103 | InventoryTab               | Enumeration     | nan                                                                                                                                                                 | InventoryTabs            |
|  104 | UnknownBeforeConsume       | Enumeration     | nan                                                                                                                                                                 | YesNo                    |
|  105 | IsConsumable               | Enumeration     | nan                                                                                                                                                                 | YesNo                    |
|  106 | IsFood                     | Enumeration     | nan                                                                                                                                                                 | YesNo                    |
|  107 | SummonLifelinkModifier     | Integer         | nan                                                                                                                                                                 | nan                      |
|  108 | IgnoredByAI                | Enumeration     | nan                                                                                                                                                                 | YesNo                    |
|  109 | AiCalculationStatsOverride | String          | nan                                                                                                                                                                 | nan                      |
|  110 | RuneLevel                  | Integer         | nan                                                                                                                                                                 | nan                      |
|  111 | RuneEffectWeapon           | String          | nan                                                                                                                                                                 | nan                      |
|  112 | RuneEffectUpperbody        | String          | nan                                                                                                                                                                 | nan                      |
|  113 | RuneEffectAmulet           | String          | nan                                                                                                                                                                 | nan                      |
|  114 | ObjectCategory             | String          | nan                                                                                                                                                                 | nan                      |
|  115 | MinAmount                  | Integer         | nan                                                                                                                                                                 | nan                      |
|  116 | MaxAmount                  | Integer         | nan                                                                                                                                                                 | nan                      |
|  117 | Priority                   | Integer         | nan                                                                                                                                                                 | nan                      |
|  118 | Unique                     | Integer         | nan                                                                                                                                                                 | nan                      |
|  119 | MinLevel                   | Integer         | nan                                                                                                                                                                 | nan                      |
|  120 | MaxLevel                   | Integer         | nan                                                                                                                                                                 | nan                      |
|  121 | Comment                    | Comment         | nan                                                                                                                                                                 | nan                      |

## Stats: Armor

|      | @name                  | @type           | @description                                                                                                        | @enumeration_type_name |
| ---: | :--------------------- | :-------------- | :------------------------------------------------------------------------------------------------------------------ | :--------------------- |
|    0 | Name                   | Name            | nan                                                                                                                 | nan                    |
|    1 | Using                  | BaseClass       | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.           | nan                    |
|    2 | ItemGroup              | String          | nan                                                                                                                 | nan                    |
|    3 | ModifierType           | Enumeration     | nan                                                                                                                 | ModifierType           |
|    4 | Act                    | Enumeration     | nan                                                                                                                 | Act                    |
|    5 | Act part               | Enumeration     | nan                                                                                                                 | ActPart                |
|    6 | Slot                   | Enumeration     | nan                                                                                                                 | Itemslot               |
|    7 | Requirements           | String          | nan                                                                                                                 | nan                    |
|    8 | Armor Defense Value    | Integer         | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. | nan                    |
|    9 | ArmorBoost             | Integer         | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base.              | nan                    |
|   10 | Magic Armor Value      | Integer         | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. | nan                    |
|   11 | MagicArmorBoost        | Integer         | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base.              | nan                    |
|   12 | Durability             | Integer         | nan                                                                                                                 | nan                    |
|   13 | DurabilityDegradeSpeed | Enumeration     | nan                                                                                                                 | Qualifier              |
|   14 | Value                  | Integer         | nan                                                                                                                 | nan                    |
|   15 | Weight                 | Integer         | nan                                                                                                                 | nan                    |
|   16 | Movement               | Integer         | Enter a flat value in centimeters.                                                                                  | nan                    |
|   17 | Initiative             | Integer         | nan                                                                                                                 | nan                    |
|   18 | Fire                   | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   19 | Air                    | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   20 | Water                  | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   21 | Earth                  | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   22 | Poison                 | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   23 | Piercing               | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   24 | Physical               | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   25 | StrengthBoost          | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   26 | FinesseBoost           | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   27 | IntelligenceBoost      | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   28 | ConstitutionBoost      | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   29 | MemoryBoost            | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   30 | WitsBoost              | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   31 | SingleHanded           | Integer         | nan                                                                                                                 | nan                    |
|   32 | TwoHanded              | Integer         | nan                                                                                                                 | nan                    |
|   33 | Ranged                 | Integer         | nan                                                                                                                 | nan                    |
|   34 | DualWielding           | Integer         | nan                                                                                                                 | nan                    |
|   35 | Perseverance           | Integer         | nan                                                                                                                 | nan                    |
|   36 | Leadership             | Integer         | nan                                                                                                                 | nan                    |
|   37 | PainReflection         | Integer         | nan                                                                                                                 | nan                    |
|   38 | WarriorLore            | Integer         | nan                                                                                                                 | nan                    |
|   39 | RangerLore             | Integer         | nan                                                                                                                 | nan                    |
|   40 | RogueLore              | Integer         | nan                                                                                                                 | nan                    |
|   41 | Sourcery               | Integer         | nan                                                                                                                 | nan                    |
|   42 | FireSpecialist         | Integer         | nan                                                                                                                 | nan                    |
|   43 | WaterSpecialist        | Integer         | nan                                                                                                                 | nan                    |
|   44 | AirSpecialist          | Integer         | nan                                                                                                                 | nan                    |
|   45 | EarthSpecialist        | Integer         | nan                                                                                                                 | nan                    |
|   46 | Necromancy             | Integer         | nan                                                                                                                 | nan                    |
|   47 | Polymorph              | Integer         | nan                                                                                                                 | nan                    |
|   48 | Summoning              | Integer         | nan                                                                                                                 | nan                    |
|   49 | Telekinesis            | Integer         | nan                                                                                                                 | nan                    |
|   50 | Sneaking               | Integer         | nan                                                                                                                 | nan                    |
|   51 | Thievery               | Integer         | nan                                                                                                                 | nan                    |
|   52 | Loremaster             | Integer         | nan                                                                                                                 | nan                    |
|   53 | Repair                 | Integer         | nan                                                                                                                 | nan                    |
|   54 | Barter                 | Integer         | nan                                                                                                                 | nan                    |
|   55 | Persuasion             | Integer         | nan                                                                                                                 | nan                    |
|   56 | Luck                   | Integer         | nan                                                                                                                 | nan                    |
|   57 | SightBoost             | Enumeration     | nan                                                                                                                 | Penalty Qualifier      |
|   58 | HearingBoost           | Enumeration     | nan                                                                                                                 | Penalty Qualifier      |
|   59 | VitalityBoost          | Integer         | nan                                                                                                                 | nan                    |
|   60 | MagicPointsBoost       | Enumeration     | nan                                                                                                                 | Penalty Qualifier      |
|   61 | ChanceToHitBoost       | Integer         | nan                                                                                                                 | nan                    |
|   62 | APMaximum              | Integer         | nan                                                                                                                 | nan                    |
|   63 | APStart                | Integer         | nan                                                                                                                 | nan                    |
|   64 | APRecovery             | Integer         | nan                                                                                                                 | nan                    |
|   65 | AccuracyBoost          | Integer         | nan                                                                                                                 | nan                    |
|   66 | DodgeBoost             | Integer         | nan                                                                                                                 | nan                    |
|   67 | CriticalChance         | Integer         | nan                                                                                                                 | nan                    |
|   68 | Reflection             | String          | nan                                                                                                                 | nan                    |
|   69 | MaxSummons             | Integer         | nan                                                                                                                 | nan                    |
|   70 | Skills                 | String          | nan                                                                                                                 | nan                    |
|   71 | Talents                | String          | nan                                                                                                                 | nan                    |
|   72 | Tags                   | String          | nan                                                                                                                 | nan                    |
|   73 | ExtraProperties        | String          | nan                                                                                                                 | nan                    |
|   74 | Flags                  | EnumerationList | nan                                                                                                                 | AttributeFlags         |
|   75 | Boosts                 | String          | nan                                                                                                                 | nan                    |
|   76 | ComboCategory          | String          | nan                                                                                                                 | nan                    |
|   77 | InventoryTab           | Enumeration     | nan                                                                                                                 | InventoryTabs          |
|   78 | ArmorType              | Enumeration     | nan                                                                                                                 | ArmorType              |
|   79 | ItemColor              | String          | nan                                                                                                                 | nan                    |
|   80 | NeedsIdentification    | Enumeration     | nan                                                                                                                 | YesNo                  |
|   81 | Charges                | Integer         | nan                                                                                                                 | nan                    |
|   82 | MaxCharges             | Integer         | nan                                                                                                                 | nan                    |
|   83 | RuneSlots              | Integer         | nan                                                                                                                 | nan                    |
|   84 | RuneSlots_V1           | Integer         | nan                                                                                                                 | nan                    |
|   85 | ObjectCategory         | String          | nan                                                                                                                 | nan                    |
|   86 | MinAmount              | Integer         | nan                                                                                                                 | nan                    |
|   87 | MaxAmount              | Integer         | nan                                                                                                                 | nan                    |
|   88 | Priority               | Integer         | nan                                                                                                                 | nan                    |
|   89 | Unique                 | Integer         | nan                                                                                                                 | nan                    |
|   90 | MinLevel               | Integer         | nan                                                                                                                 | nan                    |
|   91 | MaxLevel               | Integer         | nan                                                                                                                 | nan                    |
|   92 | Comment                | Comment         | nan                                                                                                                 | nan                    |

## Stats: Object

|      | @name               | @type           | @description                                                                                              | @enumeration_type_name |
| ---: | :------------------ | :-------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- |
|    0 | Name                | Name            | nan                                                                                                       | nan                    |
|    1 | Using               | BaseClass       | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    |
|    2 | RootTemplate        | RootTemplate    | nan                                                                                                       | nan                    |
|    3 | ModifierType        | Enumeration     | nan                                                                                                       | ModifierType           |
|    4 | Act                 | Enumeration     | nan                                                                                                       | Act                    |
|    5 | Act part            | Enumeration     | nan                                                                                                       | ActPart                |
|    6 | UseAPCost           | Integer         | nan                                                                                                       | nan                    |
|    7 | Value               | Integer         | nan                                                                                                       | nan                    |
|    8 | Weight              | Integer         | nan                                                                                                       | nan                    |
|    9 | ComboCategory       | String          | nan                                                                                                       | nan                    |
|   10 | Requirements        | String          | nan                                                                                                       | nan                    |
|   11 | Strength            | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              | PreciseQualifier       |
|   12 | Finesse             | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              | PreciseQualifier       |
|   13 | Intelligence        | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              | PreciseQualifier       |
|   14 | Constitution        | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              | PreciseQualifier       |
|   15 | Memory              | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              | PreciseQualifier       |
|   16 | Wits                | Enumeration     | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute.              | PreciseQualifier       |
|   17 | Vitality            | Integer         | nan                                                                                                       | nan                    |
|   18 | Armor               | Enumeration     | nan                                                                                                       | PreciseQualifier       |
|   19 | PiercingResistance  | Integer         | nan                                                                                                       | nan                    |
|   20 | PhysicalResistance  | Integer         | nan                                                                                                       | nan                    |
|   21 | FireResistance      | Integer         | nan                                                                                                       | nan                    |
|   22 | EarthResistance     | Integer         | nan                                                                                                       | nan                    |
|   23 | WaterResistance     | Integer         | nan                                                                                                       | nan                    |
|   24 | AirResistance       | Integer         | nan                                                                                                       | nan                    |
|   25 | PoisonResistance    | Integer         | nan                                                                                                       | nan                    |
|   26 | Flags               | EnumerationList | nan                                                                                                       | AttributeFlags         |
|   27 | InventoryTab        | Enumeration     | nan                                                                                                       | InventoryTabs          |
|   28 | AddToBottomBar      | Enumeration     | nan                                                                                                       | YesNo                  |
|   29 | IgnoredByAI         | Enumeration     | nan                                                                                                       | YesNo                  |
|   30 | RuneLevel           | Integer         | nan                                                                                                       | nan                    |
|   31 | RuneEffectWeapon    | String          | nan                                                                                                       | nan                    |
|   32 | RuneEffectUpperbody | String          | nan                                                                                                       | nan                    |
|   33 | RuneEffectAmulet    | String          | nan                                                                                                       | nan                    |
|   34 | ObjectCategory      | String          | nan                                                                                                       | nan                    |
|   35 | MinAmount           | Integer         | nan                                                                                                       | nan                    |
|   36 | MaxAmount           | Integer         | nan                                                                                                       | nan                    |
|   37 | Priority            | Integer         | nan                                                                                                       | nan                    |
|   38 | Unique              | Integer         | nan                                                                                                       | nan                    |
|   39 | MinLevel            | Integer         | nan                                                                                                       | nan                    |
|   40 | MaxLevel            | Integer         | nan                                                                                                       | nan                    |
|   41 | Comment             | Comment         | nan                                                                                                       | nan                    |

## Stats: Shield

|      | @name                  | @type           | @description                                                                                                        | @enumeration_type_name |
| ---: | :--------------------- | :-------------- | :------------------------------------------------------------------------------------------------------------------ | :--------------------- |
|    0 | Name                   | Name            | nan                                                                                                                 | nan                    |
|    1 | Using                  | BaseClass       | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.           | nan                    |
|    2 | ItemGroup              | String          | nan                                                                                                                 | nan                    |
|    3 | ModifierType           | Enumeration     | nan                                                                                                                 | ModifierType           |
|    4 | Act                    | Enumeration     | nan                                                                                                                 | Act                    |
|    5 | Act part               | Enumeration     | nan                                                                                                                 | ActPart                |
|    6 | Requirements           | String          | nan                                                                                                                 | nan                    |
|    7 | Armor Defense Value    | Integer         | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. | nan                    |
|    8 | ArmorBoost             | Integer         | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base.              | nan                    |
|    9 | Magic Armor Value      | Integer         | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. | nan                    |
|   10 | MagicArmorBoost        | Integer         | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base.              | nan                    |
|   11 | Blocking               | Integer         | nan                                                                                                                 | nan                    |
|   12 | Durability             | Integer         | nan                                                                                                                 | nan                    |
|   13 | DurabilityDegradeSpeed | Enumeration     | nan                                                                                                                 | Qualifier              |
|   14 | Value                  | Integer         | nan                                                                                                                 | nan                    |
|   15 | Weight                 | Integer         | nan                                                                                                                 | nan                    |
|   16 | Movement               | Integer         | Enter a flat value in centimeters.                                                                                  | nan                    |
|   17 | Initiative             | Integer         | nan                                                                                                                 | nan                    |
|   18 | Slot                   | Enumeration     | nan                                                                                                                 | Itemslot               |
|   19 | Fire                   | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   20 | Air                    | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   21 | Water                  | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   22 | Earth                  | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   23 | Poison                 | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   24 | Piercing               | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   25 | Physical               | Integer         | Enter a percentage resistance value.                                                                                | nan                    |
|   26 | StrengthBoost          | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   27 | FinesseBoost           | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   28 | IntelligenceBoost      | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   29 | ConstitutionBoost      | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   30 | MemoryBoost            | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   31 | WitsBoost              | Enumeration     | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                      | Penalty Qualifier      |
|   32 | SingleHanded           | Integer         | nan                                                                                                                 | nan                    |
|   33 | TwoHanded              | Integer         | nan                                                                                                                 | nan                    |
|   34 | Ranged                 | Integer         | nan                                                                                                                 | nan                    |
|   35 | DualWielding           | Integer         | nan                                                                                                                 | nan                    |
|   36 | Perseverance           | Integer         | nan                                                                                                                 | nan                    |
|   37 | Leadership             | Integer         | nan                                                                                                                 | nan                    |
|   38 | PainReflection         | Integer         | nan                                                                                                                 | nan                    |
|   39 | RogueLore              | Integer         | nan                                                                                                                 | nan                    |
|   40 | WarriorLore            | Integer         | nan                                                                                                                 | nan                    |
|   41 | RangerLore             | Integer         | nan                                                                                                                 | nan                    |
|   42 | FireSpecialist         | Integer         | nan                                                                                                                 | nan                    |
|   43 | WaterSpecialist        | Integer         | nan                                                                                                                 | nan                    |
|   44 | AirSpecialist          | Integer         | nan                                                                                                                 | nan                    |
|   45 | EarthSpecialist        | Integer         | nan                                                                                                                 | nan                    |
|   46 | Sourcery               | Integer         | nan                                                                                                                 | nan                    |
|   47 | Necromancy             | Integer         | nan                                                                                                                 | nan                    |
|   48 | Polymorph              | Integer         | nan                                                                                                                 | nan                    |
|   49 | Summoning              | Integer         | nan                                                                                                                 | nan                    |
|   50 | Telekinesis            | Integer         | nan                                                                                                                 | nan                    |
|   51 | Sneaking               | Integer         | nan                                                                                                                 | nan                    |
|   52 | LockPicking            | String          | nan                                                                                                                 | nan                    |
|   53 | Loremaster             | Integer         | nan                                                                                                                 | nan                    |
|   54 | Repair                 | Integer         | nan                                                                                                                 | nan                    |
|   55 | Barter                 | Integer         | nan                                                                                                                 | nan                    |
|   56 | Persuasion             | Integer         | nan                                                                                                                 | nan                    |
|   57 | Luck                   | Integer         | nan                                                                                                                 | nan                    |
|   58 | SightBoost             | Enumeration     | nan                                                                                                                 | Penalty Qualifier      |
|   59 | HearingBoost           | Enumeration     | nan                                                                                                                 | Penalty Qualifier      |
|   60 | VitalityBoost          | Integer         | nan                                                                                                                 | nan                    |
|   61 | MagicPointsBoost       | Enumeration     | nan                                                                                                                 | Penalty Qualifier      |
|   62 | ChanceToHitBoost       | Integer         | nan                                                                                                                 | nan                    |
|   63 | APMaximum              | Integer         | nan                                                                                                                 | nan                    |
|   64 | APStart                | Integer         | nan                                                                                                                 | nan                    |
|   65 | APRecovery             | Integer         | nan                                                                                                                 | nan                    |
|   66 | AccuracyBoost          | Integer         | nan                                                                                                                 | nan                    |
|   67 | DodgeBoost             | Integer         | nan                                                                                                                 | nan                    |
|   68 | CriticalChance         | Enumeration     | nan                                                                                                                 | Penalty Qualifier      |
|   69 | Reflection             | String          | nan                                                                                                                 | nan                    |
|   70 | Bodybuilding           | String          | nan                                                                                                                 | nan                    |
|   71 | Willpower              | String          | nan                                                                                                                 | nan                    |
|   72 | MaxSummons             | Integer         | nan                                                                                                                 | nan                    |
|   73 | Skills                 | String          | nan                                                                                                                 | nan                    |
|   74 | Talents                | String          | nan                                                                                                                 | nan                    |
|   75 | Tags                   | String          | nan                                                                                                                 | nan                    |
|   76 | ExtraProperties        | String          | nan                                                                                                                 | nan                    |
|   77 | Flags                  | EnumerationList | nan                                                                                                                 | AttributeFlags         |
|   78 | ComboCategory          | String          | nan                                                                                                                 | nan                    |
|   79 | InventoryTab           | Enumeration     | nan                                                                                                                 | InventoryTabs          |
|   80 | ItemColor              | String          | nan                                                                                                                 | nan                    |
|   81 | NeedsIdentification    | Enumeration     | nan                                                                                                                 | YesNo                  |
|   82 | Charges                | String          | nan                                                                                                                 | nan                    |
|   83 | MaxCharges             | String          | nan                                                                                                                 | nan                    |
|   84 | RuneSlots              | Integer         | nan                                                                                                                 | nan                    |
|   85 | RuneSlots_V1           | Integer         | nan                                                                                                                 | nan                    |
|   86 | ObjectCategory         | String          | nan                                                                                                                 | nan                    |
|   87 | MinAmount              | Integer         | nan                                                                                                                 | nan                    |
|   88 | MaxAmount              | Integer         | nan                                                                                                                 | nan                    |
|   89 | Priority               | Integer         | nan                                                                                                                 | nan                    |
|   90 | Unique                 | Integer         | nan                                                                                                                 | nan                    |
|   91 | MinLevel               | Integer         | nan                                                                                                                 | nan                    |
|   92 | MaxLevel               | Integer         | nan                                                                                                                 | nan                    |
|   93 | Comment                | Comment         | nan                                                                                                                 | nan                    |

## Stats: Weapon

|      | @name                  | @type           | @enumeration_type_name | @description                                                                                                                        |
| ---: | :--------------------- | :-------------- | :--------------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name                   | Name            | nan                    | nan                                                                                                                                 |
|    1 | Using                  | BaseClass       | nan                    | nan                                                                                                                                 |
|    2 | ItemGroup              | String          | nan                    | nan                                                                                                                                 |
|    3 | ModifierType           | Enumeration     | ModifierType           | nan                                                                                                                                 |
|    4 | Act                    | Enumeration     | Act                    | nan                                                                                                                                 |
|    5 | Act part               | Enumeration     | ActPart                | nan                                                                                                                                 |
|    6 | Requirements           | String          | nan                    | nan                                                                                                                                 |
|    7 | IsTwoHanded            | Enumeration     | YesNo                  | nan                                                                                                                                 |
|    8 | AttackAPCost           | Integer         | nan                    | nan                                                                                                                                 |
|    9 | Damage Type            | Enumeration     | Damage Type            | nan                                                                                                                                 |
|   10 | Damage                 | Integer         | nan                    | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
|   11 | Damage Range           | Integer         | nan                    | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  |
|   12 | DamageBoost            | Integer         | nan                    | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           |
|   13 | DamageFromBase         | Integer         | nan                    | Used by boosts, percentage value.                                                                                                   |
|   14 | CriticalDamage         | Integer         | nan                    | nan                                                                                                                                 |
|   15 | CriticalChance         | Integer         | nan                    | nan                                                                                                                                 |
|   16 | WeaponRange            | Integer         | nan                    | nan                                                                                                                                 |
|   17 | CleavePercentage       | Integer         | nan                    | nan                                                                                                                                 |
|   18 | CleaveAngle            | Integer         | nan                    | nan                                                                                                                                 |
|   19 | Durability             | Integer         | nan                    | nan                                                                                                                                 |
|   20 | DurabilityDegradeSpeed | Enumeration     | Qualifier              | nan                                                                                                                                 |
|   21 | Value                  | Integer         | nan                    | nan                                                                                                                                 |
|   22 | Weight                 | Integer         | nan                    | nan                                                                                                                                 |
|   23 | Movement               | Integer         | nan                    | nan                                                                                                                                 |
|   24 | Initiative             | Integer         | nan                    | nan                                                                                                                                 |
|   25 | WeaponType             | Enumeration     | WeaponType             | nan                                                                                                                                 |
|   26 | AnimType               | Enumeration     | AnimType               | nan                                                                                                                                 |
|   27 | Slot                   | Enumeration     | Itemslot               | nan                                                                                                                                 |
|   28 | Projectile             | String          | nan                    | nan                                                                                                                                 |
|   29 | IgnoreVisionBlock      | Enumeration     | YesNo                  | nan                                                                                                                                 |
|   30 | StrengthBoost          | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   31 | FinesseBoost           | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   32 | IntelligenceBoost      | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   33 | ConstitutionBoost      | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   34 | MemoryBoost            | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   35 | WitsBoost              | Enumeration     | Penalty Qualifier      | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute.                                      |
|   36 | TwoHanded              | Integer         | nan                    | nan                                                                                                                                 |
|   37 | SingleHanded           | Integer         | nan                    | nan                                                                                                                                 |
|   38 | Ranged                 | Integer         | nan                    | nan                                                                                                                                 |
|   39 | DualWielding           | Integer         | nan                    | nan                                                                                                                                 |
|   40 | Perseverance           | Integer         | nan                    | nan                                                                                                                                 |
|   41 | Leadership             | Integer         | nan                    | nan                                                                                                                                 |
|   42 | PainReflection         | Integer         | nan                    | nan                                                                                                                                 |
|   43 | WarriorLore            | Integer         | nan                    | nan                                                                                                                                 |
|   44 | RangerLore             | Integer         | nan                    | nan                                                                                                                                 |
|   45 | RogueLore              | Integer         | nan                    | nan                                                                                                                                 |
|   46 | FireSpecialist         | Integer         | nan                    | nan                                                                                                                                 |
|   47 | WaterSpecialist        | Integer         | nan                    | nan                                                                                                                                 |
|   48 | AirSpecialist          | Integer         | nan                    | nan                                                                                                                                 |
|   49 | EarthSpecialist        | Integer         | nan                    | nan                                                                                                                                 |
|   50 | Necromancy             | Integer         | nan                    | nan                                                                                                                                 |
|   51 | Polymorph              | Integer         | nan                    | nan                                                                                                                                 |
|   52 | Summoning              | Integer         | nan                    | nan                                                                                                                                 |
|   53 | Sourcery               | Integer         | nan                    | nan                                                                                                                                 |
|   54 | Telekinesis            | Integer         | nan                    | nan                                                                                                                                 |
|   55 | Sneaking               | Integer         | nan                    | nan                                                                                                                                 |
|   56 | Thievery               | Integer         | nan                    | nan                                                                                                                                 |
|   57 | Loremaster             | Integer         | nan                    | nan                                                                                                                                 |
|   58 | Repair                 | Integer         | nan                    | nan                                                                                                                                 |
|   59 | Barter                 | Integer         | nan                    | nan                                                                                                                                 |
|   60 | Persuasion             | Integer         | nan                    | nan                                                                                                                                 |
|   61 | Luck                   | Integer         | nan                    | nan                                                                                                                                 |
|   62 | Fire                   | Integer         | nan                    | nan                                                                                                                                 |
|   63 | Earth                  | Integer         | nan                    | nan                                                                                                                                 |
|   64 | Water                  | Integer         | nan                    | nan                                                                                                                                 |
|   65 | Air                    | Integer         | nan                    | nan                                                                                                                                 |
|   66 | Poison                 | Integer         | nan                    | nan                                                                                                                                 |
|   67 | SightBoost             | Enumeration     | Penalty Qualifier      | nan                                                                                                                                 |
|   68 | HearingBoost           | Enumeration     | Penalty Qualifier      | nan                                                                                                                                 |
|   69 | VitalityBoost          | Integer         | nan                    | nan                                                                                                                                 |
|   70 | ChanceToHitBoost       | Integer         | nan                    | nan                                                                                                                                 |
|   71 | APMaximum              | Integer         | nan                    | nan                                                                                                                                 |
|   72 | APStart                | Integer         | nan                    | nan                                                                                                                                 |
|   73 | APRecovery             | Integer         | nan                    | nan                                                                                                                                 |
|   74 | AccuracyBoost          | Integer         | nan                    | nan                                                                                                                                 |
|   75 | DodgeBoost             | Integer         | nan                    | nan                                                                                                                                 |
|   76 | ComboCategory          | String          | nan                    | nan                                                                                                                                 |
|   77 | Reflection             | String          | nan                    | nan                                                                                                                                 |
|   78 | MaxSummons             | Integer         | nan                    | nan                                                                                                                                 |
|   79 | LifeSteal              | Integer         | nan                    | nan                                                                                                                                 |
|   80 | Skills                 | String          | nan                    | nan                                                                                                                                 |
|   81 | Talents                | String          | nan                    | nan                                                                                                                                 |
|   82 | Tags                   | String          | nan                    | nan                                                                                                                                 |
|   83 | ExtraProperties        | String          | nan                    | nan                                                                                                                                 |
|   84 | Flags                  | EnumerationList | AttributeFlags         | nan                                                                                                                                 |
|   85 | Boosts                 | String          | nan                    | nan                                                                                                                                 |
|   86 | InventoryTab           | Enumeration     | InventoryTabs          | nan                                                                                                                                 |
|   87 | NeedsIdentification    | Enumeration     | YesNo                  | nan                                                                                                                                 |
|   88 | Charges                | Integer         | nan                    | nan                                                                                                                                 |
|   89 | MaxCharges             | Integer         | nan                    | nan                                                                                                                                 |
|   90 | ItemColor              | String          | nan                    | nan                                                                                                                                 |
|   91 | RuneSlots              | Integer         | nan                    | nan                                                                                                                                 |
|   92 | RuneSlots_V1           | Integer         | nan                    | nan                                                                                                                                 |
|   93 | ObjectCategory         | String          | nan                    | nan                                                                                                                                 |
|   94 | MinAmount              | Integer         | nan                    | nan                                                                                                                                 |
|   95 | MaxAmount              | Integer         | nan                    | nan                                                                                                                                 |
|   96 | Priority               | Integer         | nan                    | nan                                                                                                                                 |
|   97 | Unique                 | Integer         | nan                    | nan                                                                                                                                 |
|   98 | MinLevel               | Integer         | nan                    | nan                                                                                                                                 |
|   99 | MaxLevel               | Integer         | nan                    | nan                                                                                                                                 |
|  100 | Comment                | Comment         | nan                    | nan                                                                                                                                 |

## TreasureTable: TreasureTable

|      | @name             | @type       | @export_type       | @enumeration_type_name | @is_internal |
| ---: | :---------------- | :---------- | :----------------- | :--------------------- | :----------- |
|    0 | Name              | Name        | TreasureTableField | nan                    | nan          |
|    1 | CanMerge          | Enumeration | TreasureTableField | YesNo                  | nan          |
|    2 | MinLevelDiff      | Integer     | TreasureTableField | nan                    | nan          |
|    3 | MaxLevelDiff      | Integer     | TreasureTableField | nan                    | nan          |
|    4 | IgnoreLevelDiff   | Enumeration | TreasureTableField | YesNo                  | nan          |
|    5 | UseTreasureGroups | Enumeration | TreasureTableField | YesNo                  | nan          |
|    6 | StartLevel        | Integer     | SubTableField      | nan                    | nan          |
|    7 | EndLevel          | Integer     | SubTableField      | nan                    | nan          |
|    8 | DropCount         | String      | SubTableField      | nan                    | nan          |
|    9 | ObjectCategory    | String      | SubTableField      | nan                    | nan          |
|   10 | Frequency         | Integer     | SubTableField      | nan                    | nan          |
|   11 | Common            | Integer     | ItemType           | nan                    | nan          |
|   12 | Uncommon          | Integer     | ItemType           | nan                    | nan          |
|   13 | Rare              | Integer     | ItemType           | nan                    | nan          |
|   14 | Epic              | Integer     | ItemType           | nan                    | nan          |
|   15 | Legendary         | String      | ItemType           | nan                    | nan          |
|   16 | Divine            | Integer     | ItemType           | nan                    | nan          |
|   17 | Unique            | Integer     | ItemType           | nan                    | nan          |
|   18 | Comment           | Comment     | nan                | nan                    | nan          |
|   19 | Using             | BaseClass   | nan                | nan                    | true         |

## SkillData: SkillSet

|      | @name   | @type         | stat_descriptions                                                          | @is_internal |
| ---: | :------ | :------------ | :------------------------------------------------------------------------- | :----------- |
|    0 | Name    | Name          | nan                                                                        | nan          |
|    1 | Skills  | StatReference | OrderedDict([('description', OrderedDict([('@stat_type', 'SkillData')]))]) | nan          |
|    2 | Comment | Comment       | nan                                                                        | nan          |
|    3 | Using   | BaseClass     | nan                                                                        | true         |

## Equipment: Equipment

|      | @name   | @type         | stat_descriptions                                                                                                                                                                                                                                                                        |
| ---: | :------ | :------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    0 | Name    | Name          | nan                                                                                                                                                                                                                                                                                      |
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
|   21 | Comment | Comment       | nan                                                                                                                                                                                                                                                                                      |

## ItemCombos: ItemCombos

|      | @name           | @type            | @enumeration_type_name  | @export_type | @table_name      |
| ---: | :-------------- | :--------------- | :---------------------- | :----------- | :--------------- |
|    0 | Name            | Name             | nan                     | nan          | nan              |
|    1 | Using           | BaseClass        | nan                     | nan          | nan              |
|    2 | RecipeCategory  | Enumeration      | RecipeCategory          | nan          | nan              |
|    3 | CraftingStation | Enumeration      | CraftingStationType     | nan          | nan              |
|    4 | Type 1          | Enumeration      | IngredientType          | nan          | nan              |
|    5 | Object 1        | String           | nan                     | nan          | nan              |
|    6 | Transform 1     | Enumeration      | IngredientTransformType | nan          | nan              |
|    7 | Type 2          | Enumeration      | IngredientType          | nan          | nan              |
|    8 | Object 2        | String           | nan                     | nan          | nan              |
|    9 | Transform 2     | Enumeration      | IngredientTransformType | nan          | nan              |
|   10 | Type 3          | Enumeration      | IngredientType          | nan          | nan              |
|   11 | Object 3        | String           | nan                     | nan          | nan              |
|   12 | Transform 3     | Enumeration      | IngredientTransformType | nan          | nan              |
|   13 | Type 4          | Enumeration      | IngredientType          | nan          | nan              |
|   14 | Object 4        | String           | nan                     | nan          | nan              |
|   15 | Transform 4     | Enumeration      | IngredientTransformType | nan          | nan              |
|   16 | Type 5          | Enumeration      | IngredientType          | nan          | nan              |
|   17 | Object 5        | String           | nan                     | nan          | nan              |
|   18 | Transform 5     | Enumeration      | IngredientTransformType | nan          | nan              |
|   19 | AutoLevel       | Integer          | nan                     | nan          | nan              |
|   20 | Requirement     | String           | nan                     | ResultField  | nan              |
|   21 | ReqLevel        | String           | nan                     | ResultField  | nan              |
|   22 | ResultAmount 1  | Integer          | nan                     | ResultField  | nan              |
|   23 | Result 1        | String           | nan                     | ResultField  | nan              |
|   24 | Boost 1         | String           | nan                     | ResultField  | nan              |
|   25 | ResultAmount 2  | Integer          | nan                     | ResultField  | nan              |
|   26 | Result 2        | String           | nan                     | ResultField  | nan              |
|   27 | Boost 2         | String           | nan                     | ResultField  | nan              |
|   28 | ResultAmount 3  | Integer          | nan                     | ResultField  | nan              |
|   29 | Result 3        | String           | nan                     | ResultField  | nan              |
|   30 | Boost 3         | String           | nan                     | ResultField  | nan              |
|   31 | PreviewStatsID  | String           | nan                     | ResultField  | nan              |
|   32 | PreviewIcon     | String           | nan                     | ResultField  | nan              |
|   33 | PreviewTooltip  | TranslatedString | nan                     | ResultField  | ItemCombinations |
|   34 | Comment         | Comment          | nan                     | nan          | nan              |

## ItemCombos: ItemComboProperties

|      | @name          | @type            | @export_type       | @table_name      | @is_internal |
| ---: | :------------- | :--------------- | :----------------- | :--------------- | :----------- |
|    0 | Name           | Name             | PropertyField      | nan              | nan          |
|    1 | PreviewIcon    | String           | PropertyField      | nan              | nan          |
|    2 | PreviewTooltip | TranslatedString | PropertyField      | ItemCombinations | nan          |
|    3 | ObjectID       | String           | PropertyEntryField | nan              | nan          |
|    4 | Type           | String           | PropertyEntryField | nan              | nan          |
|    5 | Result         | String           | PropertyEntryField | nan              | nan          |
|    6 | Comment        | Comment          | PropertyEntryField | nan              | nan          |
|    7 | Using          | BaseClass        | PropertyEntryField | nan              | true         |

## ItemCombos: ObjectCategoriesItemComboPreviewData

|      | @name   | @type            | @table_name      |
| ---: | :------ | :--------------- | :--------------- |
|    0 | Name    | Name             | nan              |
|    1 | Type    | String           | nan              |
|    2 | Icon    | String           | nan              |
|    3 | Tooltip | TranslatedString | ItemCombinations |
|    4 | Comment | Comment          | nan              |

## ItemCombos: CraftingStationsItemComboPreviewData

|      | @name   | @type            | @table_name      |
| ---: | :------ | :--------------- | :--------------- |
|    0 | Name    | Name             | nan              |
|    1 | Type    | String           | nan              |
|    2 | StatsID | String           | nan              |
|    3 | Icon    | String           | nan              |
|    4 | Tooltip | TranslatedString | ItemCombinations |
|    5 | Comment | Comment          | nan              |

## ItemProgression: ItemProgressionVisuals

|      | @name        | @type        | @is_internal |
| ---: | :----------- | :----------- | :----------- |
|    0 | Name         | Name         | nan          |
|    1 | MinLevel     | Integer      | nan          |
|    2 | MaxLevel     | Integer      | nan          |
|    3 | Rarity       | String       | nan          |
|    4 | RootTemplate | RootTemplate | nan          |
|    5 | ItemColor    | String       | nan          |
|    6 | NameGroup    | String       | nan          |
|    7 | AffixType    | String       | nan          |
|    8 | Icon         | String       | nan          |
|    9 | Comment      | Comment      | nan          |
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
|    0 | Name                     | Name        | CrimeField       | nan                    | nan          |
|    1 | TensionWeight            | Integer     | CrimeField       | nan                    | nan          |
|    2 | Lifetime                 | Integer     | CrimeField       | nan                    | nan          |
|    3 | DetectionRange           | Integer     | CrimeField       | nan                    | nan          |
|    4 | AudibleRange             | Integer     | CrimeField       | nan                    | nan          |
|    5 | Audible                  | Enumeration | CrimeField       | YesNo                  | nan          |
|    6 | Continuous               | Enumeration | CrimeField       | YesNo                  | nan          |
|    7 | ContinuousDelayTimer     | Integer     | CrimeField       | nan                    | nan          |
|    8 | CreatesCrimescene        | Enumeration | CrimeField       | YesNo                  | nan          |
|    9 | CanRaiseAlarm            | Enumeration | CrimeField       | YesNo                  | nan          |
|   10 | CanMerge                 | Enumeration | CrimeField       | YesNo                  | nan          |
|   11 | MaxInvestigators         | Integer     | CrimeField       | nan                    | nan          |
|   12 | InterrogateDialog        | String      | CrimeField       | nan                    | nan          |
|   13 | SoundEvent               | String      | CrimeField       | nan                    | nan          |
|   14 | ReactionCategory_Tag     | String      | CrimeActionField | nan                    | nan          |
|   15 | Tension                  | String      | CrimeActionField | nan                    | nan          |
|   16 | Priority                 | String      | CrimeActionField | nan                    | nan          |
|   17 | DisableInvestigate       | String      | CrimeActionField | nan                    | nan          |
|   18 | StopsAndInterruptsCrimes | String      | CrimeActionField | nan                    | nan          |
|   19 | VictimReaction           | String      | CrimeActionField | nan                    | nan          |
|   20 | VictimDialog             | String      | CrimeActionField | nan                    | nan          |
|   21 | Dialog                   | String      | CrimeActionField | nan                    | nan          |
|   22 | PrimarySensibleAction    | String      | CrimeActionField | nan                    | nan          |
|   23 | SecondarySensibleAction  | String      | CrimeActionField | nan                    | nan          |
|   24 | NoticedAD                | String      | CrimeActionField | nan                    | nan          |
|   25 | Comment                  | Comment     | nan              | nan                    | nan          |
|   26 | Using                    | BaseClass   | nan              | nan                    | true         |

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
|    8 | Comment                 | Comment | nan                   |

## DeltaModifier: DeltaModifier

|      | @name        | @type     | @export_type | @is_internal |
| ---: | :----------- | :-------- | :----------- | :----------- |
|    0 | Name         | Name      | nan          | nan          |
|    1 | BoostType    | String    | nan          | nan          |
|    2 | MinLevel     | Integer   | nan          | nan          |
|    3 | MaxLevel     | Integer   | nan          | nan          |
|    4 | Frequency    | Integer   | nan          | nan          |
|    5 | ModifierType | String    | nan          | nan          |
|    6 | SlotType     | String    | nan          | nan          |
|    7 | ArmorType    | String    | nan          | nan          |
|    8 | WeaponType   | String    | nan          | nan          |
|    9 | Handedness   | Integer   | nan          | nan          |
|   10 | Boost        | String    | BoostField   | nan          |
|   11 | Multiplier   | Integer   | BoostField   | nan          |
|   12 | Comment      | Comment   | nan          | nan          |
|   13 | Using        | BaseClass | nan          | true         |

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
|    0 | Name        | Name             | nan             | nan          |
|    1 | ItemName    | TranslatedString | ItemProgression | nan          |
|    2 | NameCool    | TranslatedString | ItemProgression | nan          |
|    3 | Description | TranslatedString | ItemProgression | nan          |
|    4 | Comment     | Comment          | nan             | nan          |
|    5 | Using       | BaseClass        | nan             | true         |

## ExtraData: Data

|      | @name   | @type   |
| ---: | :------ | :------ |
|    0 | Name    | Name    |
|    1 | Value   | Float   |
|    2 | Comment | Comment |

## ItemTypes: ItemTypes

|      | @name               | @type     | @export_type | @is_internal |
| ---: | :------------------ | :-------- | :----------- | :----------- |
|    0 | Name                | Name      | nan          | nan          |
|    1 | Color               | String    | nan          | nan          |
|    2 | OverlayTexture      | String    | nan          | nan          |
|    3 | ValueMultiplier     | Float     | nan          | nan          |
|    4 | FirstItemTypeShift  | String    | nan          | nan          |
|    5 | SecondItemTypeShift | String    | nan          | nan          |
|    6 | UIBorderID          | String    | nan          | nan          |
|    7 | MinLevel            | Integer   | nan          | nan          |
|    8 | RowChance           | Integer   | nan          | nan          |
|    9 | BoostTypes          | String    | BoostField   | nan          |
|   10 | BoostType 2         | String    | BoostField   | nan          |
|   11 | BoostType 3         | String    | BoostField   | nan          |
|   12 | BoostType 4         | String    | BoostField   | nan          |
|   13 | BoostType 5         | String    | BoostField   | nan          |
|   14 | BoostType 6         | String    | BoostField   | nan          |
|   15 | BoostType 7         | String    | BoostField   | nan          |
|   16 | BoostType 8         | String    | BoostField   | nan          |
|   17 | BoostType 9         | String    | BoostField   | nan          |
|   18 | BoostType 10        | String    | BoostField   | nan          |
|   19 | BoostType 11        | String    | BoostField   | nan          |
|   20 | BoostType 12        | String    | BoostField   | nan          |
|   21 | Comment             | Comment   | nan          | nan          |
|   22 | Using               | BaseClass | nan          | true         |

## SkillData: Projectile

|      | @name                      | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :------------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                       | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                      | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster              | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill               | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                    | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                       | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement                | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                   | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                    | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                     | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType       | nan                |
|   12 | Damage Multiplier          | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range               | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType                 | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties            | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TargetRadius               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | AddRangeFromAbility        | Enumeration      | nan                                                                                                                                 | Ability                | nan                |
|   18 | AreaRadius                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   19 | DeathType                  | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   20 | ExplodeRadius              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   21 | CanTargetCharacters        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   22 | CanTargetItems             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   23 | CanTargetTerrain           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   24 | ForceTarget                | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   25 | AmountOfTargets            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   26 | AutoAim                    | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   27 | TargetConditions           | String           | nan                                                                                                                                 | nan                    | nan                |
|   28 | ForkingConditions          | String           | nan                                                                                                                                 | nan                    | nan                |
|   29 | UseCharacterStats          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   30 | UseWeaponDamage            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   31 | UseWeaponProperties        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   32 | ProjectileCount            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   33 | ProjectileDelay            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   34 | Angle                      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   35 | Template                   | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | IgnoreVisionBlock          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   37 | TemplateCheck              | Enumeration      | nan                                                                                                                                 | CastCheckType          | nan                |
|   38 | ChanceToPierce             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   39 | MaxPierceCount             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   40 | MaxForkCount               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   41 | ForkLevels                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   42 | ForkChance                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   43 | Icon                       | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | DisplayName                | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   45 | Description                | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   46 | StatsDescription           | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   47 | StatsDescriptionParams     | String           | nan                                                                                                                                 | nan                    | nan                |
|   48 | PrepareAnimationInit       | String           | nan                                                                                                                                 | nan                    | nan                |
|   49 | PrepareAnimationLoop       | String           | nan                                                                                                                                 | nan                    | nan                |
|   50 | PrepareEffect              | String           | nan                                                                                                                                 | nan                    | nan                |
|   51 | CastAnimation              | String           | nan                                                                                                                                 | nan                    | nan                |
|   52 | CastAnimationCheck         | Enumeration      | nan                                                                                                                                 | CastCheckType          | nan                |
|   53 | CastTextEvent              | String           | nan                                                                                                                                 | nan                    | nan                |
|   54 | CastEffect                 | String           | nan                                                                                                                                 | nan                    | nan                |
|   55 | PreviewEffect              | String           | nan                                                                                                                                 | nan                    | nan                |
|   56 | Requirements               | String           | nan                                                                                                                                 | nan                    | nan                |
|   57 | MemorizationRequirements   | String           | nan                                                                                                                                 | nan                    | nan                |
|   58 | Memory Cost                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   59 | Magic Cost                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   60 | DivideDamage               | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   61 | ProjectileTerrainOffset    | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   62 | MovingObject               | String           | nan                                                                                                                                 | nan                    | nan                |
|   63 | ProjectileType             | Enumeration      | nan                                                                                                                                 | ProjectileType         | nan                |
|   64 | OverrideMinAP              | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   65 | Stealth                    | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   66 | Stealth Damage Multiplier  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   67 | Distance Damage Multiplier | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   68 | HeightOffset               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   69 | SpawnObject                | String           | nan                                                                                                                                 | nan                    | nan                |
|   70 | SpawnEffect                | String           | nan                                                                                                                                 | nan                    | nan                |
|   71 | SpawnFXOverridesImpactFX   | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   72 | SpawnLifetime              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   73 | AiCalculationSkillOverride | String           | nan                                                                                                                                 | nan                    | nan                |
|   74 | CycleConditions            | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: ProjectileStrike

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType       | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TargetRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | AddRangeFromAbility      | Enumeration      | nan                                                                                                                                 | Ability                | nan                |
|   18 | AreaRadius               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   19 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   20 | ExplodeRadius            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   21 | StrikeCount              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | StrikeDelay              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   23 | CanTargetCharacters      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   24 | CanTargetItems           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   25 | CanTargetTerrain         | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   26 | ForceTarget              | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   27 | TargetConditions         | String           | nan                                                                                                                                 | nan                    | nan                |
|   28 | OverrideSkillLevel       | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   29 | UseCharacterStats        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   30 | UseWeaponDamage          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   31 | UseWeaponProperties      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   32 | TargetProjectiles        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   33 | ProjectileCount          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   34 | ProjectileDelay          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   35 | Angle                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   36 | Height                   | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   37 | SingleSource             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   38 | Template                 | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | MaxForkCount             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   40 | ForkLevels               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   41 | ForkChance               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   42 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   44 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   45 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   46 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   48 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   49 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   50 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   51 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   52 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   53 | PreviewEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   54 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   55 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   56 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   57 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   58 | ProjectileType           | Enumeration      | nan                                                                                                                                 | ProjectileType         | nan                |
|   59 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   60 | Distribution             | Enumeration      | nan                                                                                                                                 | ProjectileDistribution | nan                |
|   61 | Shuffle                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   62 | PreviewStrikeHits        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   63 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Target

|      | @name                      | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :------------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                       | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                      | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster              | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill               | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                    | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                       | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement                | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                   | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                    | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                     | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType       | nan                |
|   12 | Damage Multiplier          | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range               | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType                 | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties            | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TargetRadius               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | AreaRadius                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | AddWeaponRange             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   19 | IsMelee                    | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   20 | DeathType                  | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   21 | Requirements               | String           | nan                                                                                                                                 | nan                    | nan                |
|   22 | MemorizationRequirements   | String           | nan                                                                                                                                 | nan                    | nan                |
|   23 | CanTargetCharacters        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   24 | CanTargetItems             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   25 | CanTargetTerrain           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   26 | Memory Cost                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   27 | Magic Cost                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   28 | TargetConditions           | String           | nan                                                                                                                                 | nan                    | nan                |
|   29 | AoEConditions              | String           | nan                                                                                                                                 | nan                    | nan                |
|   30 | UseCharacterStats          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   31 | UseWeaponDamage            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   32 | UseWeaponProperties        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   33 | Icon                       | String           | nan                                                                                                                                 | nan                    | nan                |
|   34 | DisplayName                | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   35 | Description                | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   36 | StatsDescription           | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   37 | StatsDescriptionParams     | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | FXScale                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   39 | PrepareAnimationInit       | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | PrepareAnimationLoop       | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | PrepareEffect              | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | CastAnimation              | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | CastSelfAnimation          | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | CastTextEvent              | String           | nan                                                                                                                                 | nan                    | nan                |
|   45 | CastEffect                 | String           | nan                                                                                                                                 | nan                    | nan                |
|   46 | PreviewEffect              | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | WeaponBones                | String           | nan                                                                                                                                 | nan                    | nan                |
|   48 | TargetEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   49 | TargetGroundEffect         | String           | nan                                                                                                                                 | nan                    | nan                |
|   50 | PositionEffect             | String           | nan                                                                                                                                 | nan                    | nan                |
|   51 | BeamEffect                 | String           | nan                                                                                                                                 | nan                    | nan                |
|   52 | SkillEffect                | String           | nan                                                                                                                                 | nan                    | nan                |
|   53 | CleanseStatuses            | String           | nan                                                                                                                                 | nan                    | nan                |
|   54 | StatusClearChance          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   55 | Autocast                   | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   56 | IgnoreVisionBlock          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   57 | Stealth                    | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   58 | Stealth Damage Multiplier  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   59 | OverrideMinAP              | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   60 | AmountOfTargets            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   61 | AiCalculationSkillOverride | String           | nan                                                                                                                                 | nan                    | nan                |
|   62 | IgnoreHeight               | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   63 | CycleConditions            | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Cone

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType       | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | Range                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | Angle                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   19 | SurfaceType              | Enumeration      | nan                                                                                                                                 | Surface Type           | nan                |
|   20 | IgnoreCursed             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   21 | SurfaceLifetime          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | SurfaceStatusChance      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   23 | SurfaceGrowStep          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   24 | SurfaceGrowInterval      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   25 | TargetConditions         | String           | nan                                                                                                                                 | nan                    | nan                |
|   26 | UseWeaponDamage          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   27 | UseWeaponProperties      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   28 | CanTargetCharacters      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   29 | CanTargetItems           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   30 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   31 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   32 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   33 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   34 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   36 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | CastEffectTextEvent      | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   44 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   45 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   46 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | PushDistance             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   48 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   49 | BackStart                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   50 | FrontOffset              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   51 | OverrideMinAP            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   52 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Zone

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType       | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   17 | SurfaceType              | Enumeration      | nan                                                                                                                                 | Surface Type           | nan                |
|   18 | IgnoreCursed             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   19 | SurfaceLifetime          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   20 | SurfaceStatusChance      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   21 | SurfaceGrowStep          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | SurfaceGrowInterval      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   23 | TargetConditions         | String           | nan                                                                                                                                 | nan                    | nan                |
|   24 | UseWeaponDamage          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   25 | UseWeaponProperties      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   26 | CanTargetCharacters      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   27 | CanTargetItems           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   28 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   29 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   30 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   31 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   32 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   33 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   34 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | CastEffectTextEvent      | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   42 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   43 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   45 | PushDistance             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   46 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   47 | Shape                    | String           | nan                                                                                                                                 | nan                    | nan                |
|   48 | BackStart                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   49 | FrontOffset              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   50 | Range                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   51 | Base                     | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   52 | Angle                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   53 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: MultiStrike

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TargetRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | AreaRadius               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   19 | MaxAttacks               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   20 | NextAttackChance         | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   21 | NextAttackChanceDivider  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | EndPosRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   23 | JumpDelay                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   24 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   25 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   26 | TargetConditions         | String           | nan                                                                                                                                 | nan                    | nan                |
|   27 | UseWeaponDamage          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   28 | UseWeaponProperties      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   29 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   30 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   31 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   32 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   33 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   34 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   35 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | PrepareEffectBone        | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | CastEffectTextEvent      | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | MaleImpactEffects        | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | FemaleImpactEffects      | String           | nan                                                                                                                                 | nan                    | nan                |
|   45 | ReappearEffect           | String           | nan                                                                                                                                 | nan                    | nan                |
|   46 | ReappearEffectTextEvent  | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   48 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   49 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   50 | OverrideMinAP            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   51 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Quake

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TotalSurfaceCells        | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | AreaRadius               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | TargetConditions         | String           | nan                                                                                                                                 | nan                    | nan                |
|   19 | OverrideSkillLevel       | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   20 | SurfaceMinSpawnRadius    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   21 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   22 | ShockWaveDuration        | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   23 | MinSurfaces              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   24 | MaxSurfaces              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   25 | SurfaceType              | Enumeration      | nan                                                                                                                                 | Surface Type           | nan                |
|   26 | SurfaceGrowStep          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   27 | SurfaceGrowInterval      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   28 | SurfaceLifetime          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   29 | SurfaceStatusChance      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   30 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   31 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   32 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   33 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   34 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   36 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | CastEffectTextEvent      | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | LandingEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   45 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   46 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   48 | Skillbook                | String           | nan                                                                                                                                 | nan                    | nan                |
|   49 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   50 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Storm

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TargetRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | AreaRadius               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | TargetConditions         | String           | nan                                                                                                                                 | nan                    | nan                |
|   19 | OverrideSkillLevel       | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   20 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   21 | HitRadius                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | Lifetime                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   23 | MinHitsPerTurn           | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   24 | MaxHitsPerTurn           | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   25 | HitDelay                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   26 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   27 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   28 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   29 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   30 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   31 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   32 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   33 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   34 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | CastEffectTextEvent      | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | TargetEffect             | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | StormEffect              | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | ImpactEffect             | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   45 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   46 | Skillbook                | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   48 | ProjectileSkills         | String           | nan                                                                                                                                 | nan                    | nan                |
|   49 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Rush

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   17 | TargetRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | HitRadius                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   19 | CanTargetCharacters      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   20 | CanTargetItems           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   21 | CanTargetTerrain         | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   22 | TargetConditions         | String           | nan                                                                                                                                 | nan                    | nan                |
|   23 | UseCharacterStats        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   24 | UseWeaponDamage          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   25 | UseWeaponProperties      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   26 | ContinueOnKill           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   27 | ContinueEffect           | String           | nan                                                                                                                                 | nan                    | nan                |
|   28 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   29 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   30 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   31 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   32 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   33 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   34 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | CastEffectTextEvent      | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | WeaponBones              | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   43 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   44 | TargetEffect             | String           | nan                                                                                                                                 | nan                    | nan                |
|   45 | TargetCastEffect         | String           | nan                                                                                                                                 | nan                    | nan                |
|   46 | TargetHitEffect          | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | StartTextEvent           | String           | nan                                                                                                                                 | nan                    | nan                |
|   48 | StopTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   49 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   50 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   51 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   52 | OverrideMinAP            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   53 | SurfaceType              | Enumeration      | nan                                                                                                                                 | Surface Type           | nan                |
|   54 | SurfaceRadius            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   55 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Jump

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TargetRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | HitRadius                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   19 | Damage On Jump           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   20 | Damage On Landing        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   21 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   22 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   23 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   24 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   25 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   26 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   27 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   28 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   29 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   30 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   31 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   32 | TeleportTextEvent        | String           | nan                                                                                                                                 | nan                    | nan                |
|   33 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   34 | PreviewEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | LandingEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   37 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   38 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   41 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Tornado

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TargetRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | HitRadius                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | RandomPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   19 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   20 | SurfaceType              | Enumeration      | nan                                                                                                                                 | Surface Type           | nan                |
|   21 | SurfaceRadius            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | SurfaceLifetime          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   23 | SurfaceStatusChance      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   24 | PointsMaxOffset          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   25 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   26 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   27 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   28 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   29 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   30 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   31 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   32 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   33 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   34 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | CastEffectTextEvent      | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | TargetEffect             | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   42 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   43 | CleanseStatuses          | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | StatusClearChance        | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   45 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   46 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Wall

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | TargetRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | MaxDistance              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   19 | Lifetime                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   20 | GrowSpeed                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   21 | GrowTimeout              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | SurfaceType              | Enumeration      | nan                                                                                                                                 | Surface Type           | nan                |
|   23 | TotalSurfaceCells        | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   24 | SurfaceGrowStep          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   25 | SurfaceGrowInterval      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   26 | SurfaceLifetime          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   27 | SurfaceStatusChance      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   28 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   29 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   30 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   31 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   32 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   33 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   34 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | CastEffectTextEvent      | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | SourceTargetEffect       | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | TargetTargetEffect       | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | Template1                | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | Template2                | String           | nan                                                                                                                                 | nan                    | nan                |
|   45 | Template3                | String           | nan                                                                                                                                 | nan                    | nan                |
|   46 | SpawnEffect              | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   48 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   49 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   50 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   51 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   52 | PreviewEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   53 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Teleportation

|      | @name                    | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                   | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   12 | Damage Multiplier        | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range             | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType               | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | Memory Cost              | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   16 | Magic Cost               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | TargetRadius             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   18 | AreaRadius               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   19 | DeathType                | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   20 | HitRadius                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   21 | Height                   | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | Acceleration             | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   23 | TeleportDelay            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   24 | SkillProperties          | String           | nan                                                                                                                                 | nan                    | nan                |
|   25 | TargetConditions         | String           | nan                                                                                                                                 | nan                    | nan                |
|   26 | TeleportSelf             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   27 | TeleportSurface          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   28 | CanTargetCharacters      | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   29 | CanTargetItems           | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   30 | CanTargetTerrain         | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   31 | Requirements             | String           | nan                                                                                                                                 | nan                    | nan                |
|   32 | MemorizationRequirements | String           | nan                                                                                                                                 | nan                    | nan                |
|   33 | Icon                     | String           | nan                                                                                                                                 | nan                    | nan                |
|   34 | DisplayName              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   35 | Description              | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   36 | StatsDescription         | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   37 | StatsDescriptionParams   | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | FXScale                  | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   39 | PrepareAnimationInit     | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | PrepareAnimationLoop     | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | PrepareEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | CastAnimation            | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | CastTextEvent            | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | CastEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   45 | PreviewEffect            | String           | nan                                                                                                                                 | nan                    | nan                |
|   46 | SelectedCharacterEffect  | String           | nan                                                                                                                                 | nan                    | nan                |
|   47 | SelectedObjectEffect     | String           | nan                                                                                                                                 | nan                    | nan                |
|   48 | SelectedPositionEffect   | String           | nan                                                                                                                                 | nan                    | nan                |
|   49 | DisappearEffect          | String           | nan                                                                                                                                 | nan                    | nan                |
|   50 | ReappearEffect           | String           | nan                                                                                                                                 | nan                    | nan                |
|   51 | ImpactEffect             | String           | nan                                                                                                                                 | nan                    | nan                |
|   52 | IgnoreVisionBlock        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   53 | ForceMove                | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   54 | Stealth                  | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   55 | OverrideSkillLevel       | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   56 | CycleConditions          | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Path

|      | @name                    | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                       | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                       | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                       | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                       | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                       | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                       | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                       | AIFlags                | nan                |
|   11 | SurfaceType              | Enumeration      | nan                                                                                                       | Surface Type           | nan                |
|   12 | SurfaceRadius            | Integer          | nan                                                                                                       | nan                    | nan                |
|   13 | SurfaceLifetime          | Integer          | nan                                                                                                       | nan                    | nan                |
|   14 | SurfaceStatusChance      | Integer          | nan                                                                                                       | nan                    | nan                |
|   15 | SkillProperties          | String           | nan                                                                                                       | nan                    | nan                |
|   16 | MaxDistance              | Integer          | nan                                                                                                       | nan                    | nan                |
|   17 | Offset                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   18 | HitRadius                | Integer          | nan                                                                                                       | nan                    | nan                |
|   19 | Height                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   20 | TravelSpeed              | Integer          | nan                                                                                                       | nan                    | nan                |
|   21 | Requirements             | String           | nan                                                                                                       | nan                    | nan                |
|   22 | MemorizationRequirements | String           | nan                                                                                                       | nan                    | nan                |
|   23 | Icon                     | String           | nan                                                                                                       | nan                    | nan                |
|   24 | DisplayName              | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   25 | Description              | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   26 | StatsDescription         | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   27 | StatsDescriptionParams   | String           | nan                                                                                                       | nan                    | nan                |
|   28 | FXScale                  | Integer          | nan                                                                                                       | nan                    | nan                |
|   29 | PrepareAnimationInit     | String           | nan                                                                                                       | nan                    | nan                |
|   30 | PrepareAnimationLoop     | String           | nan                                                                                                       | nan                    | nan                |
|   31 | PrepareEffect            | String           | nan                                                                                                       | nan                    | nan                |
|   32 | CastAnimation            | String           | nan                                                                                                       | nan                    | nan                |
|   33 | CastTextEvent            | String           | nan                                                                                                       | nan                    | nan                |
|   34 | CastEffect               | String           | nan                                                                                                       | nan                    | nan                |
|   35 | CastEffectTextEvent      | String           | nan                                                                                                       | nan                    | nan                |
|   36 | TargetEffect             | String           | nan                                                                                                       | nan                    | nan                |
|   37 | FlyEffect                | String           | nan                                                                                                       | nan                    | nan                |
|   38 | ImpactEffect             | String           | nan                                                                                                       | nan                    | nan                |
|   39 | Memory Cost              | Integer          | nan                                                                                                       | nan                    | nan                |
|   40 | Magic Cost               | Integer          | nan                                                                                                       | nan                    | nan                |
|   41 | Skillbook                | String           | nan                                                                                                       | nan                    | nan                |
|   42 | Stealth                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | CycleConditions          | String           | nan                                                                                                       | nan                    | nan                |

## SkillData: Rain

|      | @name                      | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :------------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                       | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                      | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster              | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill               | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                    | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                       | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement                | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                   | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                    | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Lifetime                   | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   12 | SurfaceType                | Enumeration      | nan                                                                                                                                 | Surface Type           | nan                |
|   13 | SurfaceLifetime            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   14 | SurfaceStatusChance        | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   15 | Damage                     | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier              | nan                |
|   16 | Damage Multiplier          | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   17 | Damage Range               | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   18 | DamageType                 | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   19 | DeathType                  | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   20 | SkillProperties            | String           | nan                                                                                                                                 | nan                    | nan                |
|   21 | TargetRadius               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   22 | TargetConditions           | String           | nan                                                                                                                                 | nan                    | nan                |
|   23 | UseCharacterStats          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   24 | UseWeaponDamage            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   25 | UseWeaponProperties        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   26 | AreaRadius                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   27 | TotalSurfaceCells          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   28 | SurfaceGrowStep            | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   29 | SurfaceGrowInterval        | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   30 | Requirements               | String           | nan                                                                                                                                 | nan                    | nan                |
|   31 | MemorizationRequirements   | String           | nan                                                                                                                                 | nan                    | nan                |
|   32 | Icon                       | String           | nan                                                                                                                                 | nan                    | nan                |
|   33 | DisplayName                | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   34 | Description                | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   35 | StatsDescription           | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   36 | StatsDescriptionParams     | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | FXScale                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   38 | PrepareAnimationInit       | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | PrepareAnimationLoop       | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | PrepareEffect              | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | CastAnimation              | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | CastTextEvent              | String           | nan                                                                                                                                 | nan                    | nan                |
|   43 | CastEffect                 | String           | nan                                                                                                                                 | nan                    | nan                |
|   44 | CastEffectTextEvent        | String           | nan                                                                                                                                 | nan                    | nan                |
|   45 | TargetEffect               | String           | nan                                                                                                                                 | nan                    | nan                |
|   46 | Memory Cost                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   47 | Magic Cost                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   48 | RainEffect                 | String           | nan                                                                                                                                 | nan                    | nan                |
|   49 | Atmosphere                 | Enumeration      | nan                                                                                                                                 | AtmosphereType         | nan                |
|   50 | ConsequencesStartTime      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   51 | ConsequencesDuration       | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   52 | Stealth                    | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   53 | AiCalculationSkillOverride | String           | nan                                                                                                                                 | nan                    | nan                |
|   54 | CycleConditions            | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Summon

|      | @name                      | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                       | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                      | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | Level                      | Integer          | nan                                                                                                       | nan                    | nan                |
|    3 | ForGameMaster              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | IsEnemySkill               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | Ability                    | Enumeration      | nan                                                                                                       | SkillAbility           | nan                |
|    6 | Tier                       | Enumeration      | nan                                                                                                       | SkillTier              | nan                |
|    7 | Requirement                | Enumeration      | nan                                                                                                       | SkillRequirement       | nan                |
|    8 | ActionPoints               | Integer          | nan                                                                                                       | nan                    | nan                |
|    9 | Cooldown                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   10 | AIFlags                    | Enumeration      | nan                                                                                                       | AIFlags                | nan                |
|   11 | Lifetime                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   12 | SummonLevel                | Integer          | nan                                                                                                       | nan                    | nan                |
|   13 | Requirements               | String           | nan                                                                                                       | nan                    | nan                |
|   14 | MemorizationRequirements   | String           | nan                                                                                                       | nan                    | nan                |
|   15 | SkillProperties            | String           | nan                                                                                                       | nan                    | nan                |
|   16 | AoEConditions              | String           | nan                                                                                                       | nan                    | nan                |
|   17 | AreaRadius                 | Integer          | nan                                                                                                       | nan                    | nan                |
|   18 | Memory Cost                | Integer          | nan                                                                                                       | nan                    | nan                |
|   19 | Magic Cost                 | Integer          | nan                                                                                                       | nan                    | nan                |
|   20 | Template                   | String           | nan                                                                                                       | nan                    | nan                |
|   21 | TemplateAdvanced           | String           | nan                                                                                                       | nan                    | nan                |
|   22 | TemplateOverride           | String           | nan                                                                                                       | nan                    | nan                |
|   23 | Totem                      | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   24 | LinkTeleports              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   25 | TeleportsUseCount          | Integer          | nan                                                                                                       | nan                    | nan                |
|   26 | TargetRadius               | Integer          | nan                                                                                                       | nan                    | nan                |
|   27 | SummonCount                | Integer          | nan                                                                                                       | nan                    | nan                |
|   28 | Icon                       | String           | nan                                                                                                       | nan                    | nan                |
|   29 | DisplayName                | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   30 | Description                | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   31 | StatsDescription           | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   32 | StatsDescriptionParams     | String           | nan                                                                                                       | nan                    | nan                |
|   33 | FXScale                    | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | PrepareAnimationInit       | String           | nan                                                                                                       | nan                    | nan                |
|   35 | PrepareAnimationLoop       | String           | nan                                                                                                       | nan                    | nan                |
|   36 | PrepareEffect              | String           | nan                                                                                                       | nan                    | nan                |
|   37 | CastAnimation              | String           | nan                                                                                                       | nan                    | nan                |
|   38 | CastTextEvent              | String           | nan                                                                                                       | nan                    | nan                |
|   39 | CastEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   40 | CastEffectTextEvent        | String           | nan                                                                                                       | nan                    | nan                |
|   41 | TargetCastEffect           | String           | nan                                                                                                       | nan                    | nan                |
|   42 | TargetEffect               | String           | nan                                                                                                       | nan                    | nan                |
|   43 | Skillbook                  | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Stealth                    | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   45 | AiCalculationSkillOverride | String           | nan                                                                                                       | nan                    | nan                |
|   46 | CycleConditions            | String           | nan                                                                                                       | nan                    | nan                |

## SkillData: Shout

|      | @name                      | @type            | @description                                                                                                                        | @enumeration_type_name | @loca_sub_category |
| ---: | :------------------------- | :--------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                       | Name             | nan                                                                                                                                 | nan                    | nan                |
|    1 | Using                      | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line.                           | nan                    | nan                |
|    2 | Level                      | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    3 | ForGameMaster              | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    4 | IsEnemySkill               | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|    5 | Ability                    | Enumeration      | nan                                                                                                                                 | SkillAbility           | nan                |
|    6 | Tier                       | Enumeration      | nan                                                                                                                                 | SkillTier              | nan                |
|    7 | Requirement                | Enumeration      | nan                                                                                                                                 | SkillRequirement       | nan                |
|    8 | ActionPoints               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|    9 | Cooldown                   | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   10 | AIFlags                    | Enumeration      | nan                                                                                                                                 | AIFlags                | nan                |
|   11 | Damage                     | Enumeration      | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType       | nan                |
|   12 | Damage Multiplier          | Integer          | Enter a positive percentage value. It will modify base damage. 100(%) for average damage.                                           | nan                    | nan                |
|   13 | Damage Range               | Integer          | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval.                  | nan                    | nan                |
|   14 | DamageType                 | Enumeration      | nan                                                                                                                                 | Damage Type            | nan                |
|   15 | SkillProperties            | String           | nan                                                                                                                                 | nan                    | nan                |
|   16 | AreaRadius                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   17 | AddWeaponRange             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   18 | DeathType                  | Enumeration      | nan                                                                                                                                 | Death Type             | nan                |
|   19 | TargetConditions           | String           | nan                                                                                                                                 | nan                    | nan                |
|   20 | AoEConditions              | String           | nan                                                                                                                                 | nan                    | nan                |
|   21 | UseCharacterStats          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   22 | UseWeaponDamage            | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   23 | UseWeaponProperties        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   24 | Autocast                   | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   25 | Requirements               | String           | nan                                                                                                                                 | nan                    | nan                |
|   26 | MemorizationRequirements   | String           | nan                                                                                                                                 | nan                    | nan                |
|   27 | Icon                       | String           | nan                                                                                                                                 | nan                    | nan                |
|   28 | DisplayName                | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   29 | Description                | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   30 | StatsDescription           | TranslatedString | nan                                                                                                                                 | nan                    | Stats              |
|   31 | StatsDescriptionParams     | String           | nan                                                                                                                                 | nan                    | nan                |
|   32 | FXScale                    | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   33 | PrepareAnimationInit       | String           | nan                                                                                                                                 | nan                    | nan                |
|   34 | PrepareAnimationLoop       | String           | nan                                                                                                                                 | nan                    | nan                |
|   35 | PrepareEffect              | String           | nan                                                                                                                                 | nan                    | nan                |
|   36 | CastAnimation              | String           | nan                                                                                                                                 | nan                    | nan                |
|   37 | CastTextEvent              | String           | nan                                                                                                                                 | nan                    | nan                |
|   38 | CastEffect                 | String           | nan                                                                                                                                 | nan                    | nan                |
|   39 | HitEffect                  | String           | nan                                                                                                                                 | nan                    | nan                |
|   40 | CastEffectTextEvent        | String           | nan                                                                                                                                 | nan                    | nan                |
|   41 | WeaponBones                | String           | nan                                                                                                                                 | nan                    | nan                |
|   42 | Memory Cost                | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   43 | Magic Cost                 | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   44 | CleanseStatuses            | String           | nan                                                                                                                                 | nan                    | nan                |
|   45 | StatusClearChance          | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   46 | Stealth                    | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   47 | PushDistance               | Integer          | nan                                                                                                                                 | nan                    | nan                |
|   48 | CanTargetCharacters        | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   49 | CanTargetItems             | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   50 | PushPullEffect             | String           | nan                                                                                                                                 | nan                    | nan                |
|   51 | IgnoreVisionBlock          | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   52 | AiCalculationSkillOverride | String           | nan                                                                                                                                 | nan                    | nan                |
|   53 | IgnoreSilence              | Enumeration      | nan                                                                                                                                 | YesNo                  | nan                |
|   54 | CycleConditions            | String           | nan                                                                                                                                 | nan                    | nan                |

## SkillData: Dome

|      | @name                    | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                     | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                    | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | Level                    | Integer          | nan                                                                                                       | nan                    | nan                |
|    3 | ForGameMaster            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | IsEnemySkill             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | Ability                  | Enumeration      | nan                                                                                                       | SkillAbility           | nan                |
|    6 | Tier                     | Enumeration      | nan                                                                                                       | SkillTier              | nan                |
|    7 | Requirement              | Enumeration      | nan                                                                                                       | SkillRequirement       | nan                |
|    8 | ActionPoints             | Integer          | nan                                                                                                       | nan                    | nan                |
|    9 | Cooldown                 | Integer          | nan                                                                                                       | nan                    | nan                |
|   10 | AIFlags                  | Enumeration      | nan                                                                                                       | AIFlags                | nan                |
|   11 | Lifetime                 | Integer          | nan                                                                                                       | nan                    | nan                |
|   12 | SkillProperties          | String           | nan                                                                                                       | nan                    | nan                |
|   13 | TargetConditions         | String           | nan                                                                                                       | nan                    | nan                |
|   14 | AuraSelf                 | String           | nan                                                                                                       | nan                    | nan                |
|   15 | AuraAllies               | String           | nan                                                                                                       | nan                    | nan                |
|   16 | AuraNeutrals             | String           | nan                                                                                                       | nan                    | nan                |
|   17 | AuraEnemies              | String           | nan                                                                                                       | nan                    | nan                |
|   18 | AuraItems                | String           | nan                                                                                                       | nan                    | nan                |
|   19 | TargetRadius             | Integer          | nan                                                                                                       | nan                    | nan                |
|   20 | UseCharacterStats        | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | AreaRadius               | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | Requirements             | String           | nan                                                                                                       | nan                    | nan                |
|   23 | MemorizationRequirements | String           | nan                                                                                                       | nan                    | nan                |
|   24 | Icon                     | String           | nan                                                                                                       | nan                    | nan                |
|   25 | DisplayName              | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   26 | Description              | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   27 | StatsDescription         | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|   28 | StatsDescriptionParams   | String           | nan                                                                                                       | nan                    | nan                |
|   29 | FXScale                  | Integer          | nan                                                                                                       | nan                    | nan                |
|   30 | PrepareAnimationInit     | String           | nan                                                                                                       | nan                    | nan                |
|   31 | PrepareAnimationLoop     | String           | nan                                                                                                       | nan                    | nan                |
|   32 | PrepareEffect            | String           | nan                                                                                                       | nan                    | nan                |
|   33 | CastAnimation            | String           | nan                                                                                                       | nan                    | nan                |
|   34 | CastTextEvent            | String           | nan                                                                                                       | nan                    | nan                |
|   35 | CastEffect               | String           | nan                                                                                                       | nan                    | nan                |
|   36 | CastEffectTextEvent      | String           | nan                                                                                                       | nan                    | nan                |
|   37 | TargetEffect             | String           | nan                                                                                                       | nan                    | nan                |
|   38 | Memory Cost              | Integer          | nan                                                                                                       | nan                    | nan                |
|   39 | Magic Cost               | Integer          | nan                                                                                                       | nan                    | nan                |
|   40 | DomeEffect               | String           | nan                                                                                                       | nan                    | nan                |
|   41 | Stealth                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | CycleConditions          | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_CONSUME

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   45 | Items                        | String           | nan                                                                                                       | nan                    | nan                |
|   46 | WeaponOverride               | String           | nan                                                                                                       | nan                    | nan                |
|   47 | ResetCooldowns               | String           | nan                                                                                                       | nan                    | nan                |
|   48 | ResetOncePerCombat           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   49 | ScaleWithVitality            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   50 | LeaveAction                  | String           | nan                                                                                                       | nan                    | nan                |
|   51 | DieAction                    | String           | nan                                                                                                       | nan                    | nan                |
|   52 | ForceStackOverwrite          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   53 | Toggle                       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_DAMAGE

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   45 | DamageEvent                  | Enumeration      | nan                                                                                                       | StatusEvent            | nan                |
|   46 | DamageStats                  | String           | nan                                                                                                       | nan                    | nan                |
|   47 | DeathType                    | Enumeration      | nan                                                                                                       | Death Type             | nan                |
|   48 | DamageCharacters             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   49 | DamageItems                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   50 | DamageTorches                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   51 | PermanentOnTorch             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   52 | SpawnBlood                   | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   53 | ScaleWithVitality            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   54 | TickSFX                      | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_HEAL

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | HealStat                     | Enumeration      | nan                                                                                                       | StatusHealType         | nan                |
|   45 | HealType                     | Enumeration      | nan                                                                                                       | HealValueType          | nan                |
|   46 | HealValue                    | Integer          | nan                                                                                                       | nan                    | nan                |
|   47 | AbsorbSurfaceType            | String           | nan                                                                                                       | nan                    | nan                |
|   48 | AbsorbSurfaceRange           | Integer          | nan                                                                                                       | nan                    | nan                |
|   49 | BonusFromAbility             | Enumeration      | nan                                                                                                       | Ability                | nan                |
|   50 | HealEffectId                 | String           | nan                                                                                                       | nan                    | nan                |
|   51 | VampirismType                | Enumeration      | nan                                                                                                       | VampirismType          | nan                |
|   52 | Necromantic                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_HEALING

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | OverrideDefaultDescription   | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    9 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|   10 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   11 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   12 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   15 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   16 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   17 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   18 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   22 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   24 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   28 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   29 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   30 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   31 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   33 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   35 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   40 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   41 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   42 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   45 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   46 | HealingEvent                 | Enumeration      | nan                                                                                                       | StatusEvent            | nan                |
|   47 | HealStat                     | Enumeration      | nan                                                                                                       | StatusHealType         | nan                |
|   48 | HealType                     | Enumeration      | nan                                                                                                       | HealValueType          | nan                |
|   49 | HealValue                    | Integer          | nan                                                                                                       | nan                    | nan                |
|   50 | SkipInitialEffect            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   51 | AbsorbSurfaceType            | String           | nan                                                                                                       | nan                    | nan                |
|   52 | AbsorbSurfaceRange           | Integer          | nan                                                                                                       | nan                    | nan                |
|   53 | HealEffectId                 | String           | nan                                                                                                       | nan                    | nan                |
|   54 | Necromantic                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_FEAR

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_POLYMORPHED

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   45 | PolymorphResult              | String           | nan                                                                                                       | nan                    | nan                |
|   46 | DisableInteractions          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   47 | AiCalculationSkillOverride   | String           | nan                                                                                                       | nan                    | nan                |
|   48 | Toggle                       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   49 | RetainSkills                 | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_KNOCKED_DOWN

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Instant                      | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_STANCE

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_INCAPACITATED

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   45 | FreezeTime                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   46 | ApplyStatusOnTick            | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_BLIND

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_GUARDIAN_ANGEL

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   45 | DamagePercentage             | Integer          | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_DAMAGE_ON_MOVE

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   45 | DamageEvent                  | Enumeration      | nan                                                                                                       | StatusEvent            | nan                |
|   46 | DamageStats                  | String           | nan                                                                                                       | nan                    | nan                |
|   47 | DeathType                    | Enumeration      | nan                                                                                                       | Death Type             | nan                |
|   48 | DamageCharacters             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   49 | DamageItems                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   50 | DamageTorches                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   51 | PermanentOnTorch             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   52 | SpawnBlood                   | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   53 | TickSFX                      | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_DEMONIC_BARGAIN

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_CHALLENGE

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | DescriptionCaster            | String           | nan                                                                                                       | nan                    | nan                |
|    7 | DescriptionTarget            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    9 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   13 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   15 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   16 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   17 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   18 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   22 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   24 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   28 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   29 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   30 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   31 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   33 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   35 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   40 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   41 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   45 | WinBoost                     | String           | nan                                                                                                       | nan                    | nan                |
|   46 | LoseBoost                    | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_FLOATING

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Items                        | String           | nan                                                                                                       | nan                    | nan                |
|   45 | OnlyWhileMoving              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_THROWN

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   43 | Items                        | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_DISARMED

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_HEAL_SHARING

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_HEAL_SHARING_CASTER

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | BeamEffect                   | String           | nan                                                                                                       | nan                    | nan                |
|   45 | HealMultiplier               | Integer          | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_ACTIVE_DEFENSE

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Items                        | String           | nan                                                                                                       | nan                    | nan                |
|   45 | WeaponOverride               | String           | nan                                                                                                       | nan                    | nan                |
|   46 | ResetCooldowns               | String           | nan                                                                                                       | nan                    | nan                |
|   47 | ResetOncePerCombat           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   48 | ScaleWithVitality            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   49 | TargetEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   50 | Projectile                   | String           | nan                                                                                                       | nan                    | nan                |
|   51 | Radius                       | Integer          | nan                                                                                                       | nan                    | nan                |
|   52 | Charges                      | Integer          | nan                                                                                                       | nan                    | nan                |
|   53 | DefendTargetPosition         | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   54 | TargetConditions             | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_SPARK

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Items                        | String           | nan                                                                                                       | nan                    | nan                |
|   45 | WeaponOverride               | String           | nan                                                                                                       | nan                    | nan                |
|   46 | ResetCooldowns               | String           | nan                                                                                                       | nan                    | nan                |
|   47 | ResetOncePerCombat           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   48 | ScaleWithVitality            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   49 | Projectile                   | String           | nan                                                                                                       | nan                    | nan                |
|   50 | Radius                       | Integer          | nan                                                                                                       | nan                    | nan                |
|   51 | Charges                      | Integer          | nan                                                                                                       | nan                    | nan                |
|   52 | TargetConditions             | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_PLAY_DEAD

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Items                        | String           | nan                                                                                                       | nan                    | nan                |
|   45 | WeaponOverride               | String           | nan                                                                                                       | nan                    | nan                |
|   46 | ResetCooldowns               | String           | nan                                                                                                       | nan                    | nan                |
|   47 | ResetOncePerCombat           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   48 | ScaleWithVitality            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   49 | FreezeCooldowns              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_INVISIBLE

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Items                        | String           | nan                                                                                                       | nan                    | nan                |
|   45 | WeaponOverride               | String           | nan                                                                                                       | nan                    | nan                |
|   46 | ResetCooldowns               | String           | nan                                                                                                       | nan                    | nan                |
|   47 | ResetOncePerCombat           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   48 | ScaleWithVitality            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_DEACTIVATED

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Items                        | String           | nan                                                                                                       | nan                    | nan                |
|   45 | WeaponOverride               | String           | nan                                                                                                       | nan                    | nan                |
|   46 | ResetCooldowns               | String           | nan                                                                                                       | nan                    | nan                |
|   47 | ResetOncePerCombat           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   48 | ScaleWithVitality            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_EFFECT

|      | @name              | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :----------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name               | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using              | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster      | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat     | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat    | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName        | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description        | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | Icon               | String           | nan                                                                                                       | nan                    | nan                |
|    8 | FormatColor        | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|    9 | StatusEffect       | String           | nan                                                                                                       | nan                    | nan                |
|   10 | ForceOverhead      | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | BeamEffect         | String           | nan                                                                                                       | nan                    | nan                |
|   12 | PlayerSameParty    | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   13 | PlayerHasTag       | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn | String           | nan                                                                                                       | nan                    | nan                |
|   15 | PeaceOnly          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_EXTRA_TURN

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
|   44 | Items                        | String           | nan                                                                                                       | nan                    | nan                |
|   45 | WeaponOverride               | String           | nan                                                                                                       | nan                    | nan                |
|   46 | ResetCooldowns               | String           | nan                                                                                                       | nan                    | nan                |
|   47 | ResetOncePerCombat           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   48 | ScaleWithVitality            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |

## StatusData: Status_CHARMED

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_MUTED

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |

## StatusData: Status_DECAYING_TOUCH

|      | @name                        | @type            | @description                                                                                              | @enumeration_type_name | @loca_sub_category |
| ---: | :--------------------------- | :--------------- | :-------------------------------------------------------------------------------------------------------- | :--------------------- | :----------------- |
|    0 | Name                         | Name             | nan                                                                                                       | nan                    | nan                |
|    1 | Using                        | BaseClass        | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. | nan                    | nan                |
|    2 | ForGameMaster                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    3 | InitiateCombat               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    4 | BringIntoCombat              | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|    5 | DisplayName                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    6 | Description                  | TranslatedString | nan                                                                                                       | nan                    | Stats              |
|    7 | DescriptionParams            | String           | nan                                                                                                       | nan                    | nan                |
|    8 | Icon                         | String           | nan                                                                                                       | nan                    | nan                |
|    9 | FormatColor                  | Enumeration      | nan                                                                                                       | FormatStringColor      | nan                |
|   10 | ForceOverhead                | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   11 | ApplyEffect                  | String           | nan                                                                                                       | nan                    | nan                |
|   12 | StatusEffect                 | String           | nan                                                                                                       | nan                    | nan                |
|   13 | StatusEffectOverrideForItems | String           | nan                                                                                                       | nan                    | nan                |
|   14 | StatusEffectOnTurn           | String           | nan                                                                                                       | nan                    | nan                |
|   15 | MaterialType                 | Enumeration      | nan                                                                                                       | MaterialType           | nan                |
|   16 | Material                     | String           | nan                                                                                                       | nan                    | nan                |
|   17 | MaterialApplyBody            | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   18 | MaterialApplyArmor           | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   19 | MaterialApplyWeapon          | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   20 | MaterialApplyNormalMap       | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   21 | MaterialFadeAmount           | Integer          | nan                                                                                                       | nan                    | nan                |
|   22 | MaterialOverlayOffset        | Integer          | nan                                                                                                       | nan                    | nan                |
|   23 | MaterialParameters           | String           | nan                                                                                                       | nan                    | nan                |
|   24 | SoundStart                   | String           | nan                                                                                                       | nan                    | nan                |
|   25 | SoundLoop                    | String           | nan                                                                                                       | nan                    | nan                |
|   26 | SoundStop                    | String           | nan                                                                                                       | nan                    | nan                |
|   27 | SavingThrow                  | Enumeration      | nan                                                                                                       | SavingThrow            | nan                |
|   28 | ImmuneFlag                   | Enumeration      | nan                                                                                                       | AttributeFlag          | nan                |
|   29 | IsChanneled                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   30 | StatsId                      | String           | nan                                                                                                       | nan                    | nan                |
|   31 | StackId                      | String           | nan                                                                                                       | nan                    | nan                |
|   32 | StackPriority                | Integer          | nan                                                                                                       | nan                    | nan                |
|   33 | AuraRadius                   | Integer          | nan                                                                                                       | nan                    | nan                |
|   34 | AuraSelf                     | String           | nan                                                                                                       | nan                    | nan                |
|   35 | AuraAllies                   | String           | nan                                                                                                       | nan                    | nan                |
|   36 | AuraNeutrals                 | String           | nan                                                                                                       | nan                    | nan                |
|   37 | AuraEnemies                  | String           | nan                                                                                                       | nan                    | nan                |
|   38 | AuraItems                    | String           | nan                                                                                                       | nan                    | nan                |
|   39 | AuraFX                       | String           | nan                                                                                                       | nan                    | nan                |
|   40 | SurfaceChange                | String           | nan                                                                                                       | nan                    | nan                |
|   41 | IsInvulnerable               | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   42 | IsResistingDeath             | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   43 | LoseControl                  | Enumeration      | nan                                                                                                       | YesNo                  | nan                |
|   44 | Skills                       | String           | nan                                                                                                       | nan                    | nan                |
