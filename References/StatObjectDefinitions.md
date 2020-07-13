# Reference: Stat Object Definitions

---

## Table of Contents

- [Stats: Character](#Stats:-Character)
- [Stats: Potion](#Stats:-Potion)
- [Stats: Armor](#Stats:-Armor)
- [Stats: Object](#Stats:-Object)
- [Stats: Shield](#Stats:-Shield)
- [Stats: Weapon](#Stats:-Weapon)
- [TreasureTable: TreasureTable](#TreasureTable:-TreasureTable)
- [SkillData: SkillSet](#SkillData:-SkillSet)
- [Equipment: Equipment](#Equipment:-Equipment)
- [ItemCombos: ItemCombos](#ItemCombos:-ItemCombos)
- [ItemCombos: ItemComboProperties](#ItemCombos:-ItemComboProperties)
- [ItemCombos: ObjectCategoriesItemComboPreviewData](#ItemCombos:-ObjectCategoriesItemComboPreviewData)
- [ItemCombos: CraftingStationsItemComboPreviewData](#ItemCombos:-CraftingStationsItemComboPreviewData)
- [ItemProgression: ItemProgressionVisuals](#ItemProgression:-ItemProgressionVisuals)
- [ExtraData: Requirements](#ExtraData:-Requirements)
- [Crimes: Crimes](#Crimes:-Crimes)
- [TreasureTable: TreasureGroups](#TreasureTable:-TreasureGroups)
- [DeltaModifier: DeltaModifier](#DeltaModifier:-DeltaModifier)
- [ItemColor: ItemColor](#ItemColor:-ItemColor)
- [ItemProgression: ItemProgressionNames](#ItemProgression:-ItemProgressionNames)
- [ExtraData: Data](#ExtraData:-Data)
- [ItemTypes: ItemTypes](#ItemTypes:-ItemTypes)
- [SkillData: Projectile](#SkillData:-Projectile)
- [SkillData: ProjectileStrike](#SkillData:-ProjectileStrike)
- [SkillData: Target](#SkillData:-Target)
- [SkillData: Cone](#SkillData:-Cone)
- [SkillData: Zone](#SkillData:-Zone)
- [SkillData: MultiStrike](#SkillData:-MultiStrike)
- [SkillData: Quake](#SkillData:-Quake)
- [SkillData: Storm](#SkillData:-Storm)
- [SkillData: Rush](#SkillData:-Rush)
- [SkillData: Jump](#SkillData:-Jump)
- [SkillData: Tornado](#SkillData:-Tornado)
- [SkillData: Wall](#SkillData:-Wall)
- [SkillData: Teleportation](#SkillData:-Teleportation)
- [SkillData: Path](#SkillData:-Path)
- [SkillData: Rain](#SkillData:-Rain)
- [SkillData: Summon](#SkillData:-Summon)
- [SkillData: Shout](#SkillData:-Shout)
- [SkillData: Dome](#SkillData:-Dome)
- [StatusData: Status_CONSUME](#StatusData:-Status_CONSUME)
- [StatusData: Status_DAMAGE](#StatusData:-Status_DAMAGE)
- [StatusData: Status_HEAL](#StatusData:-Status_HEAL)
- [StatusData: Status_HEALING](#StatusData:-Status_HEALING)
- [StatusData: Status_FEAR](#StatusData:-Status_FEAR)
- [StatusData: Status_POLYMORPHED](#StatusData:-Status_POLYMORPHED)
- [StatusData: Status_KNOCKED_DOWN](#StatusData:-Status_KNOCKED_DOWN)
- [StatusData: Status_STANCE](#StatusData:-Status_STANCE)
- [StatusData: Status_INCAPACITATED](#StatusData:-Status_INCAPACITATED)
- [StatusData: Status_BLIND](#StatusData:-Status_BLIND)
- [StatusData: Status_GUARDIAN_ANGEL](#StatusData:-Status_GUARDIAN_ANGEL)
- [StatusData: Status_DAMAGE_ON_MOVE](#StatusData:-Status_DAMAGE_ON_MOVE)
- [StatusData: Status_DEMONIC_BARGAIN](#StatusData:-Status_DEMONIC_BARGAIN)
- [StatusData: Status_CHALLENGE](#StatusData:-Status_CHALLENGE)
- [StatusData: Status_FLOATING](#StatusData:-Status_FLOATING)
- [StatusData: Status_THROWN](#StatusData:-Status_THROWN)
- [StatusData: Status_DISARMED](#StatusData:-Status_DISARMED)
- [StatusData: Status_HEAL_SHARING](#StatusData:-Status_HEAL_SHARING)
- [StatusData: Status_HEAL_SHARING_CASTER](#StatusData:-Status_HEAL_SHARING_CASTER)
- [StatusData: Status_ACTIVE_DEFENSE](#StatusData:-Status_ACTIVE_DEFENSE)
- [StatusData: Status_SPARK](#StatusData:-Status_SPARK)
- [StatusData: Status_PLAY_DEAD](#StatusData:-Status_PLAY_DEAD)
- [StatusData: Status_INVISIBLE](#StatusData:-Status_INVISIBLE)
- [StatusData: Status_DEACTIVATED](#StatusData:-Status_DEACTIVATED)
- [StatusData: Status_EFFECT](#StatusData:-Status_EFFECT)
- [StatusData: Status_EXTRA_TURN](#StatusData:-Status_EXTRA_TURN)
- [StatusData: Status_CHARMED](#StatusData:-Status_CHARMED)
- [StatusData: Status_MUTED](#StatusData:-Status_MUTED)
- [StatusData: Status_DECAYING_TOUCH](#StatusData:-Status_DECAYING_TOUCH)

---

## Stats: Character

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Act | Enumeration | Act |  |
| Act part | Enumeration | ActPart |  |
| Act strength | Enumeration | Penalty Qualifier |  |
| Strength | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. |
| Finesse | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. |
| Intelligence | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. |
| Constitution | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. |
| Memory | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. |
| Wits | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. |
| Armor | Integer |  | Enter a positive percentage value. 100 will give you average Armour amount for a heavy character of corresponding level. |
| ArmorBoost | Integer |  | Enter a percentage value that will modify base Armour. E.g. -50 will halve current armour, 50 will produce 150% base armour. Helpful if you are inheriting and need 200% Armour compared to the parent. |
| ArmorBoostGrowthPerLevel | Integer |  | This parameter increases ArmorBoost by (Level-1)*param*0.1 |
| MagicArmor | Integer |  | Enter a positive percentage value. 100 will give you average Armour amount for a heavy character of corresponding level. |
| MagicArmorBoost | Integer |  | Enter a percentage value that will modify base Armour. E.g. -50 will halve current armour, 50 will produce 150% base armour. Helpful if you are inheriting and need 200% Armour compared to the parent. |
| MagicArmorBoostGrowthPerLevel | Integer |  | This parameter increases MagicArmorBoost by (Level-1)*param*0.1 |
| Reflexes | String |  |  |
| Vitality | Integer |  | Enter a positive percentage value. 100 will give you average Vitality amount for a character of corresponding level. |
| DamageBoost | Integer |  | Enter a percentage value, can be negative. E.g. -30 will reduce all damage inflicted by this character by 30%. |
| DamageBoostGrowthPerLevel | Integer |  | This parameter increase DamageBoost by (Level-1)*param*0.1 |
| MagicPoints | Integer |  | Maximum amount of Source Points the character can hold |
| ChanceToHitBoost | Integer |  |  |
| APMaximum | Integer |  |  |
| APStart | Integer |  | AP granted at the start of combat. |
| APRecovery | Integer |  | AP restored each turn |
| MPStart | Integer |  | Source Points amount on character creation |
| Movement | Integer |  | Distance in centimeters per AP spent on movement in combat. |
| MovementSpeedBoost | Integer |  | Percentage value, 50 produces a character with 150% base Movement. |
| Gain | Enumeration | BigQualifier | Enter a positive percentage value. E.g. level 3 character with '5' Gain will produce enough XP to cover 5% of experience needed to advance from level 3 to level 4. |
| Sight | Enumeration | Penalty Qualifier |  |
| Hearing | Enumeration | Penalty Qualifier |  |
| Initiative | Integer |  |  |
| FOV | Integer |  |  |
| Weight | Integer |  | In grams, relevant for some types of puzzles. |
| StepsType | Enumeration | StepsType |  |
| PiercingResistance | Integer |  | Enter a percentage value, can be negative. |
| PhysicalResistance | Integer |  | Enter a percentage value, can be negative. |
| CriticalChance | Enumeration | Penalty Qualifier |  |
| MaxResistance | Integer |  | Enter a positive percentage value. Default cap is 200. |
| FireResistance | Integer |  | Enter a percentage value, can be negative. |
| EarthResistance | Integer |  | Enter a percentage value, can be negative. |
| WaterResistance | Integer |  | Enter a percentage value, can be negative. |
| AirResistance | Integer |  | Enter a percentage value, can be negative. |
| PoisonResistance | Integer |  | Enter a percentage value, can be negative. |
| SingleHanded | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| TwoHanded | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| Ranged | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| DualWielding | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| Leadership | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| PainReflection | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| Perseverance | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| RogueLore | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| WarriorLore | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| RangerLore | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| FireSpecialist | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| WaterSpecialist | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| AirSpecialist | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| EarthSpecialist | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| Sourcery | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| Necromancy | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| Polymorph | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| Summoning | Integer |  | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |
| Telekinesis | Integer |  | Enter a flat value. Default civil ability cap is 5. |
| Sneaking | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| Thievery | Integer |  | Enter a flat value. Default civil ability cap is 5. |
| Loremaster | Integer |  | Enter a flat value. Default civil ability cap is 5. |
| Repair | Integer |  | Enter a flat value. Default civil ability cap is 5. |
| Barter | Integer |  | Enter a flat value. Default civil ability cap is 5. |
| Persuasion | Integer |  | Enter a flat value. Default civil ability cap is 5. |
| Luck | Integer |  | Enter a flat value. Default civil ability cap is 5. |
| Accuracy | Integer |  | Enter a percentage value |
| Dodge | Integer |  | Enter a percentage value |
| Reflection | String |  |  |
| MaxSummons | Integer |  |  |
| ExtraProperties | String |  |  |
| Flags | EnumerationList | AttributeFlags |  |
| Talents | String |  |  |
| Traits | String |  |  |
| PathInfluence | String |  |  |
| Comment | Comment |  |  |

## Stats: Potion

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| RootTemplate | RootTemplate |  |  |
| Act | Enumeration | Act |  |
| Act part | Enumeration | ActPart |  |
| Act strength | String |  |  |
| StackId | String |  |  |
| ComboCategory | String |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| Weight | Integer |  |  |
| Value | Integer |  |  |
| Strength | Enumeration | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| Finesse | Enumeration | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| Intelligence | Enumeration | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| Constitution | Enumeration | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| Memory | Enumeration | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| Wits | Enumeration | Penalty PreciseQualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| SingleHanded | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| TwoHanded | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| Ranged | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| DualWielding | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| PhysicalArmorMastery | String |  | Enter a flat value. Combat Ability cap is 10. |
| MagicArmorMastery | String |  | Enter a flat value. Combat Ability cap is 10. |
| VitalityMastery | String |  | Enter a flat value. Combat Ability cap is 10. |
| PainReflection | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| WarriorLore | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| RangerLore | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| RogueLore | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| Sourcery | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| Telekinesis | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| FireSpecialist | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| WaterSpecialist | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| AirSpecialist | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| EarthSpecialist | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| Necromancy | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| Polymorph | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| Summoning | Integer |  | Enter a flat value. Combat Ability cap is 10. |
| Sneaking | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| Thievery | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| Loremaster | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| Repair | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| Barter | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| Persuasion | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| Leadership | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| Luck | Integer |  | Enter a flat value. Civil Ability cap is 5. |
| FireResistance | Integer |  | Enter a percentage value, can be negative. |
| EarthResistance | Integer |  | Enter a percentage value, can be negative. |
| WaterResistance | Integer |  | Enter a percentage value, can be negative. |
| AirResistance | Integer |  | Enter a percentage value, can be negative. |
| PoisonResistance | Integer |  | Enter a percentage value, can be negative. |
| PiercingResistance | Integer |  | Enter a percentage value, can be negative. |
| PhysicalResistance | Integer |  | Enter a percentage value, can be negative. |
| Sight | Integer |  |  |
| Hearing | Enumeration | Penalty Qualifier |  |
| Initiative | Integer |  |  |
| Movement | Integer |  | Enter a flat value in centimeters. |
| MovementSpeedBoost | Integer |  | Enter a percentage value, can be negative. |
| Vitality | Integer |  | Enter a percentage value. Potion will heal the character for Vitality amount provided by code. E.g. 100 is the standard heal amount for the level of the character. |
| VitalityBoost | Integer |  | Enter a percentage value, can be negative. E.g. '10' produces you +10% character's base maximum Vitality. |
| VitalityPercentage | Integer |  | Enter a positive percentage value. Potion will heal the character for Vitality amount equal to the percentage of their maximum Vitality. |
| ChanceToHitBoost | Integer |  |  |
| AccuracyBoost | Integer |  |  |
| DodgeBoost | Integer |  |  |
| DamageBoost | Integer |  |  |
| RangeBoost | Integer |  |  |
| APCostBoost | Integer |  |  |
| SPCostBoost | Integer |  |  |
| APMaximum | Integer |  |  |
| APStart | Integer |  |  |
| APRecovery | Integer |  |  |
| CriticalChance | Integer |  |  |
| Gain | Enumeration | BigQualifier |  |
| Armor | Integer |  | Enter a percentage value, can be negative. Code will turn it into a flat bonus\malus. E.g. '50' produces half of an average Armour buff. |
| ArmorBoost | Integer |  | Enter a percentage value, can be negative. This value modifies character's maximum Armour by a percentage. E.g. '10' produces +10% of character's maximum Armour. |
| MagicArmor | Integer |  | Enter a percentage value, can be negative. Code will turn it into a flat bonus\malus. E.g. '50' produces half of an average Armour buff. |
| MagicArmorBoost | Integer |  | Enter a percentage value, can be negative. This value modifies character's maximum Armour by a percentage. E.g. '10' produces +10% of character's maximum Armour. |
| Duration | Integer |  |  |
| UseAPCost | Integer |  |  |
| Reflection | String |  |  |
| LifeSteal | Integer |  | Enter a positive percentage value. Any damage to Vitality that owner character inflicts will turn into a heal modified by this percentage value. |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| ActionPoints | Integer |  |  |
| MagicPoints | Integer |  |  |
| BloodSurfaceType | String |  |  |
| MaxSummons | Integer |  |  |
| AddToBottomBar | Enumeration | YesNo |  |
| ExtraProperties | String |  |  |
| BoostConditions | String |  |  |
| Flags | EnumerationList | AttributeFlags |  |
| BonusWeapon | String |  | Enter a stat name from Weapon file. |
| StatusEffect | String |  |  |
| StatusIcon | String |  |  |
| StatusMaterial | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| InventoryTab | Enumeration | InventoryTabs |  |
| UnknownBeforeConsume | Enumeration | YesNo |  |
| IsConsumable | Enumeration | YesNo |  |
| IsFood | Enumeration | YesNo |  |
| SummonLifelinkModifier | Integer |  |  |
| IgnoredByAI | Enumeration | YesNo |  |
| AiCalculationStatsOverride | String |  |  |
| RuneLevel | Integer |  |  |
| RuneEffectWeapon | String |  |  |
| RuneEffectUpperbody | String |  |  |
| RuneEffectAmulet | String |  |  |
| ObjectCategory | String |  |  |
| MinAmount | Integer |  |  |
| MaxAmount | Integer |  |  |
| Priority | Integer |  |  |
| Unique | Integer |  |  |
| MinLevel | Integer |  |  |
| MaxLevel | Integer |  |  |
| Comment | Comment |  |  |

## Stats: Armor

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ItemGroup | String |  |  |
| ModifierType | Enumeration | ModifierType |  |
| Act | Enumeration | Act |  |
| Act part | Enumeration | ActPart |  |
| Slot | Enumeration | Itemslot |  |
| Requirements | String |  |  |
| Armor Defense Value | Integer |  | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |
| ArmorBoost | Integer |  | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base. |
| Magic Armor Value | Integer |  | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |
| MagicArmorBoost | Integer |  | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base. |
| Durability | Integer |  |  |
| DurabilityDegradeSpeed | Enumeration | Qualifier |  |
| Value | Integer |  |  |
| Weight | Integer |  |  |
| Movement | Integer |  | Enter a flat value in centimeters. |
| Initiative | Integer |  |  |
| Fire | Integer |  | Enter a percentage resistance value. |
| Air | Integer |  | Enter a percentage resistance value. |
| Water | Integer |  | Enter a percentage resistance value. |
| Earth | Integer |  | Enter a percentage resistance value. |
| Poison | Integer |  | Enter a percentage resistance value. |
| Piercing | Integer |  | Enter a percentage resistance value. |
| Physical | Integer |  | Enter a percentage resistance value. |
| StrengthBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| FinesseBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| IntelligenceBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| ConstitutionBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| MemoryBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| WitsBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| SingleHanded | Integer |  |  |
| TwoHanded | Integer |  |  |
| Ranged | Integer |  |  |
| DualWielding | Integer |  |  |
| Perseverance | Integer |  |  |
| Leadership | Integer |  |  |
| PainReflection | Integer |  |  |
| WarriorLore | Integer |  |  |
| RangerLore | Integer |  |  |
| RogueLore | Integer |  |  |
| Sourcery | Integer |  |  |
| FireSpecialist | Integer |  |  |
| WaterSpecialist | Integer |  |  |
| AirSpecialist | Integer |  |  |
| EarthSpecialist | Integer |  |  |
| Necromancy | Integer |  |  |
| Polymorph | Integer |  |  |
| Summoning | Integer |  |  |
| Telekinesis | Integer |  |  |
| Sneaking | Integer |  |  |
| Thievery | Integer |  |  |
| Loremaster | Integer |  |  |
| Repair | Integer |  |  |
| Barter | Integer |  |  |
| Persuasion | Integer |  |  |
| Luck | Integer |  |  |
| SightBoost | Enumeration | Penalty Qualifier |  |
| HearingBoost | Enumeration | Penalty Qualifier |  |
| VitalityBoost | Integer |  |  |
| MagicPointsBoost | Enumeration | Penalty Qualifier |  |
| ChanceToHitBoost | Integer |  |  |
| APMaximum | Integer |  |  |
| APStart | Integer |  |  |
| APRecovery | Integer |  |  |
| AccuracyBoost | Integer |  |  |
| DodgeBoost | Integer |  |  |
| CriticalChance | Integer |  |  |
| Reflection | String |  |  |
| MaxSummons | Integer |  |  |
| Skills | String |  |  |
| Talents | String |  |  |
| Tags | String |  |  |
| ExtraProperties | String |  |  |
| Flags | EnumerationList | AttributeFlags |  |
| Boosts | String |  |  |
| ComboCategory | String |  |  |
| InventoryTab | Enumeration | InventoryTabs |  |
| ArmorType | Enumeration | ArmorType |  |
| ItemColor | String |  |  |
| NeedsIdentification | Enumeration | YesNo |  |
| Charges | Integer |  |  |
| MaxCharges | Integer |  |  |
| RuneSlots | Integer |  |  |
| RuneSlots_V1 | Integer |  |  |
| ObjectCategory | String |  |  |
| MinAmount | Integer |  |  |
| MaxAmount | Integer |  |  |
| Priority | Integer |  |  |
| Unique | Integer |  |  |
| MinLevel | Integer |  |  |
| MaxLevel | Integer |  |  |
| Comment | Comment |  |  |

## Stats: Object

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| RootTemplate | RootTemplate |  |  |
| ModifierType | Enumeration | ModifierType |  |
| Act | Enumeration | Act |  |
| Act part | Enumeration | ActPart |  |
| UseAPCost | Integer |  |  |
| Value | Integer |  |  |
| Weight | Integer |  |  |
| ComboCategory | String |  |  |
| Requirements | String |  |  |
| Strength | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. |
| Finesse | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. |
| Intelligence | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. |
| Constitution | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. |
| Memory | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. |
| Wits | Enumeration | PreciseQualifier | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. |
| Vitality | Integer |  |  |
| Armor | Enumeration | PreciseQualifier |  |
| PiercingResistance | Integer |  |  |
| PhysicalResistance | Integer |  |  |
| FireResistance | Integer |  |  |
| EarthResistance | Integer |  |  |
| WaterResistance | Integer |  |  |
| AirResistance | Integer |  |  |
| PoisonResistance | Integer |  |  |
| Flags | EnumerationList | AttributeFlags |  |
| InventoryTab | Enumeration | InventoryTabs |  |
| AddToBottomBar | Enumeration | YesNo |  |
| IgnoredByAI | Enumeration | YesNo |  |
| RuneLevel | Integer |  |  |
| RuneEffectWeapon | String |  |  |
| RuneEffectUpperbody | String |  |  |
| RuneEffectAmulet | String |  |  |
| ObjectCategory | String |  |  |
| MinAmount | Integer |  |  |
| MaxAmount | Integer |  |  |
| Priority | Integer |  |  |
| Unique | Integer |  |  |
| MinLevel | Integer |  |  |
| MaxLevel | Integer |  |  |
| Comment | Comment |  |  |

## Stats: Shield

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ItemGroup | String |  |  |
| ModifierType | Enumeration | ModifierType |  |
| Act | Enumeration | Act |  |
| Act part | Enumeration | ActPart |  |
| Requirements | String |  |  |
| Armor Defense Value | Integer |  | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |
| ArmorBoost | Integer |  | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base. |
| Magic Armor Value | Integer |  | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |
| MagicArmorBoost | Integer |  | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base. |
| Blocking | Integer |  |  |
| Durability | Integer |  |  |
| DurabilityDegradeSpeed | Enumeration | Qualifier |  |
| Value | Integer |  |  |
| Weight | Integer |  |  |
| Movement | Integer |  | Enter a flat value in centimeters. |
| Initiative | Integer |  |  |
| Slot | Enumeration | Itemslot |  |
| Fire | Integer |  | Enter a percentage resistance value. |
| Air | Integer |  | Enter a percentage resistance value. |
| Water | Integer |  | Enter a percentage resistance value. |
| Earth | Integer |  | Enter a percentage resistance value. |
| Poison | Integer |  | Enter a percentage resistance value. |
| Piercing | Integer |  | Enter a percentage resistance value. |
| Physical | Integer |  | Enter a percentage resistance value. |
| StrengthBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| FinesseBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| IntelligenceBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| ConstitutionBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| MemoryBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| WitsBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| SingleHanded | Integer |  |  |
| TwoHanded | Integer |  |  |
| Ranged | Integer |  |  |
| DualWielding | Integer |  |  |
| Perseverance | Integer |  |  |
| Leadership | Integer |  |  |
| PainReflection | Integer |  |  |
| RogueLore | Integer |  |  |
| WarriorLore | Integer |  |  |
| RangerLore | Integer |  |  |
| FireSpecialist | Integer |  |  |
| WaterSpecialist | Integer |  |  |
| AirSpecialist | Integer |  |  |
| EarthSpecialist | Integer |  |  |
| Sourcery | Integer |  |  |
| Necromancy | Integer |  |  |
| Polymorph | Integer |  |  |
| Summoning | Integer |  |  |
| Telekinesis | Integer |  |  |
| Sneaking | Integer |  |  |
| LockPicking | String |  |  |
| Loremaster | Integer |  |  |
| Repair | Integer |  |  |
| Barter | Integer |  |  |
| Persuasion | Integer |  |  |
| Luck | Integer |  |  |
| SightBoost | Enumeration | Penalty Qualifier |  |
| HearingBoost | Enumeration | Penalty Qualifier |  |
| VitalityBoost | Integer |  |  |
| MagicPointsBoost | Enumeration | Penalty Qualifier |  |
| ChanceToHitBoost | Integer |  |  |
| APMaximum | Integer |  |  |
| APStart | Integer |  |  |
| APRecovery | Integer |  |  |
| AccuracyBoost | Integer |  |  |
| DodgeBoost | Integer |  |  |
| CriticalChance | Enumeration | Penalty Qualifier |  |
| Reflection | String |  |  |
| Bodybuilding | String |  |  |
| Willpower | String |  |  |
| MaxSummons | Integer |  |  |
| Skills | String |  |  |
| Talents | String |  |  |
| Tags | String |  |  |
| ExtraProperties | String |  |  |
| Flags | EnumerationList | AttributeFlags |  |
| ComboCategory | String |  |  |
| InventoryTab | Enumeration | InventoryTabs |  |
| ItemColor | String |  |  |
| NeedsIdentification | Enumeration | YesNo |  |
| Charges | String |  |  |
| MaxCharges | String |  |  |
| RuneSlots | Integer |  |  |
| RuneSlots_V1 | Integer |  |  |
| ObjectCategory | String |  |  |
| MinAmount | Integer |  |  |
| MaxAmount | Integer |  |  |
| Priority | Integer |  |  |
| Unique | Integer |  |  |
| MinLevel | Integer |  |  |
| MaxLevel | Integer |  |  |
| Comment | Comment |  |  |

## Stats: Weapon

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  |  |
| ItemGroup | String |  |  |
| ModifierType | Enumeration | ModifierType |  |
| Act | Enumeration | Act |  |
| Act part | Enumeration | ActPart |  |
| Requirements | String |  |  |
| IsTwoHanded | Enumeration | YesNo |  |
| AttackAPCost | Integer |  |  |
| Damage Type | Enumeration | Damage Type |  |
| Damage | Integer |  | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageBoost | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| DamageFromBase | Integer |  | Used by boosts, percentage value. |
| CriticalDamage | Integer |  |  |
| CriticalChance | Integer |  |  |
| WeaponRange | Integer |  |  |
| CleavePercentage | Integer |  |  |
| CleaveAngle | Integer |  |  |
| Durability | Integer |  |  |
| DurabilityDegradeSpeed | Enumeration | Qualifier |  |
| Value | Integer |  |  |
| Weight | Integer |  |  |
| Movement | Integer |  |  |
| Initiative | Integer |  |  |
| WeaponType | Enumeration | WeaponType |  |
| AnimType | Enumeration | AnimType |  |
| Slot | Enumeration | Itemslot |  |
| Projectile | String |  |  |
| IgnoreVisionBlock | Enumeration | YesNo |  |
| StrengthBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| FinesseBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| IntelligenceBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| ConstitutionBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| MemoryBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| WitsBoost | Enumeration | Penalty Qualifier | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. |
| TwoHanded | Integer |  |  |
| SingleHanded | Integer |  |  |
| Ranged | Integer |  |  |
| DualWielding | Integer |  |  |
| Perseverance | Integer |  |  |
| Leadership | Integer |  |  |
| PainReflection | Integer |  |  |
| WarriorLore | Integer |  |  |
| RangerLore | Integer |  |  |
| RogueLore | Integer |  |  |
| FireSpecialist | Integer |  |  |
| WaterSpecialist | Integer |  |  |
| AirSpecialist | Integer |  |  |
| EarthSpecialist | Integer |  |  |
| Necromancy | Integer |  |  |
| Polymorph | Integer |  |  |
| Summoning | Integer |  |  |
| Sourcery | Integer |  |  |
| Telekinesis | Integer |  |  |
| Sneaking | Integer |  |  |
| Thievery | Integer |  |  |
| Loremaster | Integer |  |  |
| Repair | Integer |  |  |
| Barter | Integer |  |  |
| Persuasion | Integer |  |  |
| Luck | Integer |  |  |
| Fire | Integer |  |  |
| Earth | Integer |  |  |
| Water | Integer |  |  |
| Air | Integer |  |  |
| Poison | Integer |  |  |
| SightBoost | Enumeration | Penalty Qualifier |  |
| HearingBoost | Enumeration | Penalty Qualifier |  |
| VitalityBoost | Integer |  |  |
| ChanceToHitBoost | Integer |  |  |
| APMaximum | Integer |  |  |
| APStart | Integer |  |  |
| APRecovery | Integer |  |  |
| AccuracyBoost | Integer |  |  |
| DodgeBoost | Integer |  |  |
| ComboCategory | String |  |  |
| Reflection | String |  |  |
| MaxSummons | Integer |  |  |
| LifeSteal | Integer |  |  |
| Skills | String |  |  |
| Talents | String |  |  |
| Tags | String |  |  |
| ExtraProperties | String |  |  |
| Flags | EnumerationList | AttributeFlags |  |
| Boosts | String |  |  |
| InventoryTab | Enumeration | InventoryTabs |  |
| NeedsIdentification | Enumeration | YesNo |  |
| Charges | Integer |  |  |
| MaxCharges | Integer |  |  |
| ItemColor | String |  |  |
| RuneSlots | Integer |  |  |
| RuneSlots_V1 | Integer |  |  |
| ObjectCategory | String |  |  |
| MinAmount | Integer |  |  |
| MaxAmount | Integer |  |  |
| Priority | Integer |  |  |
| Unique | Integer |  |  |
| MinLevel | Integer |  |  |
| MaxLevel | Integer |  |  |
| Comment | Comment |  |  |

## TreasureTable: TreasureTable

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| CanMerge | Enumeration | YesNo |  |
| MinLevelDiff | Integer |  |  |
| MaxLevelDiff | Integer |  |  |
| IgnoreLevelDiff | Enumeration | YesNo |  |
| UseTreasureGroups | Enumeration | YesNo |  |
| StartLevel | Integer |  |  |
| EndLevel | Integer |  |  |
| DropCount | String |  |  |
| ObjectCategory | String |  |  |
| Frequency | Integer |  |  |
| Common | Integer |  |  |
| Uncommon | Integer |  |  |
| Rare | Integer |  |  |
| Epic | Integer |  |  |
| Legendary | String |  |  |
| Divine | Integer |  |  |
| Unique | Integer |  |  |
| Comment | Comment |  |  |
| Using | BaseClass |  |  |

## SkillData: SkillSet

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Skills | StatReference |  |  |
| Comment | Comment |  |  |
| Using | BaseClass |  |  |

## Equipment: Equipment

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| 1 | StatReference |  |  |
| 2 | StatReference |  |  |
| 3 | StatReference |  |  |
| 4 | StatReference |  |  |
| 5 | StatReference |  |  |
| 6 | StatReference |  |  |
| 7 | StatReference |  |  |
| 8 | StatReference |  |  |
| 9 | StatReference |  |  |
| 10 | StatReference |  |  |
| 11 | StatReference |  |  |
| 12 | StatReference |  |  |
| 13 | StatReference |  |  |
| 14 | StatReference |  |  |
| 15 | StatReference |  |  |
| 16 | StatReference |  |  |
| 17 | StatReference |  |  |
| 18 | StatReference |  |  |
| 19 | StatReference |  |  |
| 20 | StatReference |  |  |
| Comment | Comment |  |  |

## ItemCombos: ItemCombos

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  |  |
| RecipeCategory | Enumeration | RecipeCategory |  |
| CraftingStation | Enumeration | CraftingStationType |  |
| Type 1 | Enumeration | IngredientType |  |
| Object 1 | String |  |  |
| Transform 1 | Enumeration | IngredientTransformType |  |
| Type 2 | Enumeration | IngredientType |  |
| Object 2 | String |  |  |
| Transform 2 | Enumeration | IngredientTransformType |  |
| Type 3 | Enumeration | IngredientType |  |
| Object 3 | String |  |  |
| Transform 3 | Enumeration | IngredientTransformType |  |
| Type 4 | Enumeration | IngredientType |  |
| Object 4 | String |  |  |
| Transform 4 | Enumeration | IngredientTransformType |  |
| Type 5 | Enumeration | IngredientType |  |
| Object 5 | String |  |  |
| Transform 5 | Enumeration | IngredientTransformType |  |
| AutoLevel | Integer |  |  |
| Requirement | String |  |  |
| ReqLevel | String |  |  |
| ResultAmount 1 | Integer |  |  |
| Result 1 | String |  |  |
| Boost 1 | String |  |  |
| ResultAmount 2 | Integer |  |  |
| Result 2 | String |  |  |
| Boost 2 | String |  |  |
| ResultAmount 3 | Integer |  |  |
| Result 3 | String |  |  |
| Boost 3 | String |  |  |
| PreviewStatsID | String |  |  |
| PreviewIcon | String |  |  |
| PreviewTooltip | TranslatedString |  |  |
| Comment | Comment |  |  |

## ItemCombos: ItemComboProperties

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| PreviewIcon | String |  |  |
| PreviewTooltip | TranslatedString |  |  |
| ObjectID | String |  |  |
| Type | String |  |  |
| Result | String |  |  |
| Comment | Comment |  |  |
| Using | BaseClass |  |  |

## ItemCombos: ObjectCategoriesItemComboPreviewData

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Type | String |  |  |
| Icon | String |  |  |
| Tooltip | TranslatedString |  |  |
| Comment | Comment |  |  |

## ItemCombos: CraftingStationsItemComboPreviewData

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Type | String |  |  |
| StatsID | String |  |  |
| Icon | String |  |  |
| Tooltip | TranslatedString |  |  |
| Comment | Comment |  |  |

## ItemProgression: ItemProgressionVisuals

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| MinLevel | Integer |  |  |
| MaxLevel | Integer |  |  |
| Rarity | String |  |  |
| RootTemplate | RootTemplate |  |  |
| ItemColor | String |  |  |
| NameGroup | String |  |  |
| AffixType | String |  |  |
| Icon | String |  |  |
| Comment | Comment |  |  |
| Using | BaseClass |  |  |

## ExtraData: Requirements

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Requirements | String |  |  |
| Comment | Comment |  |  |

## Crimes: Crimes

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| TensionWeight | Integer |  |  |
| Lifetime | Integer |  |  |
| DetectionRange | Integer |  |  |
| AudibleRange | Integer |  |  |
| Audible | Enumeration | YesNo |  |
| Continuous | Enumeration | YesNo |  |
| ContinuousDelayTimer | Integer |  |  |
| CreatesCrimescene | Enumeration | YesNo |  |
| CanRaiseAlarm | Enumeration | YesNo |  |
| CanMerge | Enumeration | YesNo |  |
| MaxInvestigators | Integer |  |  |
| InterrogateDialog | String |  |  |
| SoundEvent | String |  |  |
| ReactionCategory_Tag | String |  |  |
| Tension | String |  |  |
| Priority | String |  |  |
| DisableInvestigate | String |  |  |
| StopsAndInterruptsCrimes | String |  |  |
| VictimReaction | String |  |  |
| VictimDialog | String |  |  |
| Dialog | String |  |  |
| PrimarySensibleAction | String |  |  |
| SecondarySensibleAction | String |  |  |
| NoticedAD | String |  |  |
| Comment | Comment |  |  |
| Using | BaseClass |  |  |

## TreasureTable: TreasureGroups

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| TreasureGroup | String |  |  |
| WeaponTreasureGroup | String |  |  |
| WeaponDefaultCounter | Integer |  |  |
| SkillbookTreasureGroup | String |  |  |
| SkillbookDefaultCounter | Integer |  |  |
| ArmorTreasureGroup | String |  |  |
| ArmorDefaultCounter | Integer |  |  |
| Comment | Comment |  |  |

## DeltaModifier: DeltaModifier

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| BoostType | String |  |  |
| MinLevel | Integer |  |  |
| MaxLevel | Integer |  |  |
| Frequency | Integer |  |  |
| ModifierType | String |  |  |
| SlotType | String |  |  |
| ArmorType | String |  |  |
| WeaponType | String |  |  |
| Handedness | Integer |  |  |
| Boost | String |  |  |
| Multiplier | Integer |  |  |
| Comment | Comment |  |  |
| Using | BaseClass |  |  |

## ItemColor: ItemColor

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Primary Color | Color |  |  |
| Secondary Color | Color |  |  |
| Tertiary Color | Color |  |  |
| Comment | Comment |  |  |

## ItemProgression: ItemProgressionNames

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| ItemName | TranslatedString |  |  |
| NameCool | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| Comment | Comment |  |  |
| Using | BaseClass |  |  |

## ExtraData: Data

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Value | Float |  |  |
| Comment | Comment |  |  |

## ItemTypes: ItemTypes

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Color | String |  |  |
| OverlayTexture | String |  |  |
| ValueMultiplier | Float |  |  |
| FirstItemTypeShift | String |  |  |
| SecondItemTypeShift | String |  |  |
| UIBorderID | String |  |  |
| MinLevel | Integer |  |  |
| RowChance | Integer |  |  |
| BoostTypes | String |  |  |
| BoostType 2 | String |  |  |
| BoostType 3 | String |  |  |
| BoostType 4 | String |  |  |
| BoostType 5 | String |  |  |
| BoostType 6 | String |  |  |
| BoostType 7 | String |  |  |
| BoostType 8 | String |  |  |
| BoostType 9 | String |  |  |
| BoostType 10 | String |  |  |
| BoostType 11 | String |  |  |
| BoostType 12 | String |  |  |
| Comment | Comment |  |  |
| Using | BaseClass |  |  |

## SkillData: Projectile

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | DamageSourceType | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| AddRangeFromAbility | Enumeration | Ability |  |
| AreaRadius | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| ExplodeRadius | Integer |  |  |
| CanTargetCharacters | Enumeration | YesNo |  |
| CanTargetItems | Enumeration | YesNo |  |
| CanTargetTerrain | Enumeration | YesNo |  |
| ForceTarget | Enumeration | YesNo |  |
| AmountOfTargets | Integer |  |  |
| AutoAim | Enumeration | YesNo |  |
| TargetConditions | String |  |  |
| ForkingConditions | String |  |  |
| UseCharacterStats | Enumeration | YesNo |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| ProjectileCount | Integer |  |  |
| ProjectileDelay | Integer |  |  |
| Angle | Integer |  |  |
| Template | String |  |  |
| IgnoreVisionBlock | Enumeration | YesNo |  |
| TemplateCheck | Enumeration | CastCheckType |  |
| ChanceToPierce | Integer |  |  |
| MaxPierceCount | Integer |  |  |
| MaxForkCount | Integer |  |  |
| ForkLevels | Integer |  |  |
| ForkChance | Integer |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastAnimationCheck | Enumeration | CastCheckType |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| PreviewEffect | String |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| DivideDamage | Enumeration | YesNo |  |
| ProjectileTerrainOffset | Enumeration | YesNo |  |
| MovingObject | String |  |  |
| ProjectileType | Enumeration | ProjectileType |  |
| OverrideMinAP | Enumeration | YesNo |  |
| Stealth | Enumeration | YesNo |  |
| Stealth Damage Multiplier | Integer |  |  |
| Distance Damage Multiplier | Integer |  |  |
| HeightOffset | Integer |  |  |
| SpawnObject | String |  |  |
| SpawnEffect | String |  |  |
| SpawnFXOverridesImpactFX | Enumeration | YesNo |  |
| SpawnLifetime | Integer |  |  |
| AiCalculationSkillOverride | String |  |  |
| CycleConditions | String |  |  |

## SkillData: ProjectileStrike

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | DamageSourceType | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| AddRangeFromAbility | Enumeration | Ability |  |
| AreaRadius | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| ExplodeRadius | Integer |  |  |
| StrikeCount | Integer |  |  |
| StrikeDelay | Integer |  |  |
| CanTargetCharacters | Enumeration | YesNo |  |
| CanTargetItems | Enumeration | YesNo |  |
| CanTargetTerrain | Enumeration | YesNo |  |
| ForceTarget | Enumeration | YesNo |  |
| TargetConditions | String |  |  |
| OverrideSkillLevel | Enumeration | YesNo |  |
| UseCharacterStats | Enumeration | YesNo |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| TargetProjectiles | Enumeration | YesNo |  |
| ProjectileCount | Integer |  |  |
| ProjectileDelay | Integer |  |  |
| Angle | Integer |  |  |
| Height | Integer |  |  |
| SingleSource | Enumeration | YesNo |  |
| Template | String |  |  |
| MaxForkCount | Integer |  |  |
| ForkLevels | Integer |  |  |
| ForkChance | Integer |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| PreviewEffect | String |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| ProjectileType | Enumeration | ProjectileType |  |
| Stealth | Enumeration | YesNo |  |
| Distribution | Enumeration | ProjectileDistribution |  |
| Shuffle | Enumeration | YesNo |  |
| PreviewStrikeHits | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Target

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | DamageSourceType | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| AreaRadius | Integer |  |  |
| AddWeaponRange | Enumeration | YesNo |  |
| IsMelee | Enumeration | YesNo |  |
| DeathType | Enumeration | Death Type |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| CanTargetCharacters | Enumeration | YesNo |  |
| CanTargetItems | Enumeration | YesNo |  |
| CanTargetTerrain | Enumeration | YesNo |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| TargetConditions | String |  |  |
| AoEConditions | String |  |  |
| UseCharacterStats | Enumeration | YesNo |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastSelfAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| PreviewEffect | String |  |  |
| WeaponBones | String |  |  |
| TargetEffect | String |  |  |
| TargetGroundEffect | String |  |  |
| PositionEffect | String |  |  |
| BeamEffect | String |  |  |
| SkillEffect | String |  |  |
| CleanseStatuses | String |  |  |
| StatusClearChance | Integer |  |  |
| Autocast | Enumeration | YesNo |  |
| IgnoreVisionBlock | Enumeration | YesNo |  |
| Stealth | Enumeration | YesNo |  |
| Stealth Damage Multiplier | Integer |  |  |
| OverrideMinAP | Enumeration | YesNo |  |
| AmountOfTargets | Integer |  |  |
| AiCalculationSkillOverride | String |  |  |
| IgnoreHeight | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Cone

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | DamageSourceType | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| Range | Integer |  |  |
| Angle | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| SurfaceType | Enumeration | Surface Type |  |
| IgnoreCursed | Enumeration | YesNo |  |
| SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | Integer |  |  |
| SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | Integer |  |  |
| TargetConditions | String |  |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| CanTargetCharacters | Enumeration | YesNo |  |
| CanTargetItems | Enumeration | YesNo |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| PushDistance | Integer |  |  |
| Stealth | Enumeration | YesNo |  |
| BackStart | Integer |  |  |
| FrontOffset | Integer |  |  |
| OverrideMinAP | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Zone

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | DamageSourceType | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| DeathType | Enumeration | Death Type |  |
| SurfaceType | Enumeration | Surface Type |  |
| IgnoreCursed | Enumeration | YesNo |  |
| SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | Integer |  |  |
| SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | Integer |  |  |
| TargetConditions | String |  |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| CanTargetCharacters | Enumeration | YesNo |  |
| CanTargetItems | Enumeration | YesNo |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| PushDistance | Integer |  |  |
| Stealth | Enumeration | YesNo |  |
| Shape | String |  |  |
| BackStart | Integer |  |  |
| FrontOffset | Integer |  |  |
| Range | Integer |  |  |
| Base | Integer |  |  |
| Angle | Integer |  |  |
| CycleConditions | String |  |  |

## SkillData: MultiStrike

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| AreaRadius | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| MaxAttacks | Integer |  |  |
| NextAttackChance | Integer |  |  |
| NextAttackChanceDivider | Integer |  |  |
| EndPosRadius | Integer |  |  |
| JumpDelay | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| TargetConditions | String |  |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| PrepareEffectBone | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| MaleImpactEffects | String |  |  |
| FemaleImpactEffects | String |  |  |
| ReappearEffect | String |  |  |
| ReappearEffectTextEvent | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Stealth | Enumeration | YesNo |  |
| OverrideMinAP | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Quake

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TotalSurfaceCells | Integer |  |  |
| AreaRadius | Integer |  |  |
| TargetConditions | String |  |  |
| OverrideSkillLevel | Enumeration | YesNo |  |
| SurfaceMinSpawnRadius | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| ShockWaveDuration | Integer |  |  |
| MinSurfaces | Integer |  |  |
| MaxSurfaces | Integer |  |  |
| SurfaceType | Enumeration | Surface Type |  |
| SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | Integer |  |  |
| SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | Integer |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| LandingEffect | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Skillbook | String |  |  |
| Stealth | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Storm

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| AreaRadius | Integer |  |  |
| TargetConditions | String |  |  |
| OverrideSkillLevel | Enumeration | YesNo |  |
| DeathType | Enumeration | Death Type |  |
| HitRadius | Integer |  |  |
| Lifetime | Integer |  |  |
| MinHitsPerTurn | Integer |  |  |
| MaxHitsPerTurn | Integer |  |  |
| HitDelay | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| TargetEffect | String |  |  |
| StormEffect | String |  |  |
| ImpactEffect | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Skillbook | String |  |  |
| Stealth | Enumeration | YesNo |  |
| ProjectileSkills | String |  |  |
| CycleConditions | String |  |  |

## SkillData: Rush

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| DeathType | Enumeration | Death Type |  |
| TargetRadius | Integer |  |  |
| HitRadius | Integer |  |  |
| CanTargetCharacters | Enumeration | YesNo |  |
| CanTargetItems | Enumeration | YesNo |  |
| CanTargetTerrain | Enumeration | YesNo |  |
| TargetConditions | String |  |  |
| UseCharacterStats | Enumeration | YesNo |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| ContinueOnKill | Enumeration | YesNo |  |
| ContinueEffect | String |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| WeaponBones | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| TargetEffect | String |  |  |
| TargetCastEffect | String |  |  |
| TargetHitEffect | String |  |  |
| StartTextEvent | String |  |  |
| StopTextEvent | String |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Stealth | Enumeration | YesNo |  |
| OverrideMinAP | Enumeration | YesNo |  |
| SurfaceType | Enumeration | Surface Type |  |
| SurfaceRadius | Integer |  |  |
| CycleConditions | String |  |  |

## SkillData: Jump

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| HitRadius | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| Damage On Jump | Enumeration | YesNo |  |
| Damage On Landing | Enumeration | YesNo |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| TeleportTextEvent | String |  |  |
| CastEffect | String |  |  |
| PreviewEffect | String |  |  |
| LandingEffect | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Stealth | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Tornado

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| HitRadius | Integer |  |  |
| RandomPoints | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| SurfaceType | Enumeration | Surface Type |  |
| SurfaceRadius | Integer |  |  |
| SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | Integer |  |  |
| PointsMaxOffset | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| TargetEffect | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| CleanseStatuses | String |  |  |
| StatusClearChance | Integer |  |  |
| Stealth | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Wall

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| MaxDistance | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| Lifetime | Integer |  |  |
| GrowSpeed | Integer |  |  |
| GrowTimeout | Integer |  |  |
| SurfaceType | Enumeration | Surface Type |  |
| TotalSurfaceCells | Integer |  |  |
| SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | Integer |  |  |
| SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | Integer |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| SourceTargetEffect | String |  |  |
| TargetTargetEffect | String |  |  |
| Template1 | String |  |  |
| Template2 | String |  |  |
| Template3 | String |  |  |
| SpawnEffect | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Stealth | Enumeration | YesNo |  |
| PreviewEffect | String |  |  |
| CycleConditions | String |  |  |

## SkillData: Teleportation

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| TargetRadius | Integer |  |  |
| AreaRadius | Integer |  |  |
| DeathType | Enumeration | Death Type |  |
| HitRadius | Integer |  |  |
| Height | Integer |  |  |
| Acceleration | Integer |  |  |
| TeleportDelay | Integer |  |  |
| SkillProperties | String |  |  |
| TargetConditions | String |  |  |
| TeleportSelf | Enumeration | YesNo |  |
| TeleportSurface | Enumeration | YesNo |  |
| CanTargetCharacters | Enumeration | YesNo |  |
| CanTargetItems | Enumeration | YesNo |  |
| CanTargetTerrain | Enumeration | YesNo |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| PreviewEffect | String |  |  |
| SelectedCharacterEffect | String |  |  |
| SelectedObjectEffect | String |  |  |
| SelectedPositionEffect | String |  |  |
| DisappearEffect | String |  |  |
| ReappearEffect | String |  |  |
| ImpactEffect | String |  |  |
| IgnoreVisionBlock | Enumeration | YesNo |  |
| ForceMove | Enumeration | YesNo |  |
| Stealth | Enumeration | YesNo |  |
| OverrideSkillLevel | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Path

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| SurfaceType | Enumeration | Surface Type |  |
| SurfaceRadius | Integer |  |  |
| SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | Integer |  |  |
| SkillProperties | String |  |  |
| MaxDistance | Integer |  |  |
| Offset | Integer |  |  |
| HitRadius | Integer |  |  |
| Height | Integer |  |  |
| TravelSpeed | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| TargetEffect | String |  |  |
| FlyEffect | String |  |  |
| ImpactEffect | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Skillbook | String |  |  |
| Stealth | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Rain

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Lifetime | Integer |  |  |
| SurfaceType | Enumeration | Surface Type |  |
| SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | Integer |  |  |
| Damage | Enumeration | Qualifier | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| DeathType | Enumeration | Death Type |  |
| SkillProperties | String |  |  |
| TargetRadius | Integer |  |  |
| TargetConditions | String |  |  |
| UseCharacterStats | Enumeration | YesNo |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| AreaRadius | Integer |  |  |
| TotalSurfaceCells | Integer |  |  |
| SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| TargetEffect | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| RainEffect | String |  |  |
| Atmosphere | Enumeration | AtmosphereType |  |
| ConsequencesStartTime | Integer |  |  |
| ConsequencesDuration | Integer |  |  |
| Stealth | Enumeration | YesNo |  |
| AiCalculationSkillOverride | String |  |  |
| CycleConditions | String |  |  |

## SkillData: Summon

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Lifetime | Integer |  |  |
| SummonLevel | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| SkillProperties | String |  |  |
| AoEConditions | String |  |  |
| AreaRadius | Integer |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| Template | String |  |  |
| TemplateAdvanced | String |  |  |
| TemplateOverride | String |  |  |
| Totem | Enumeration | YesNo |  |
| LinkTeleports | Enumeration | YesNo |  |
| TeleportsUseCount | Integer |  |  |
| TargetRadius | Integer |  |  |
| SummonCount | Integer |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| TargetCastEffect | String |  |  |
| TargetEffect | String |  |  |
| Skillbook | String |  |  |
| Stealth | Enumeration | YesNo |  |
| AiCalculationSkillOverride | String |  |  |
| CycleConditions | String |  |  |

## SkillData: Shout

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Damage | Enumeration | DamageSourceType | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |
| Damage Multiplier | Integer |  | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |
| Damage Range | Integer |  | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |
| DamageType | Enumeration | Damage Type |  |
| SkillProperties | String |  |  |
| AreaRadius | Integer |  |  |
| AddWeaponRange | Enumeration | YesNo |  |
| DeathType | Enumeration | Death Type |  |
| TargetConditions | String |  |  |
| AoEConditions | String |  |  |
| UseCharacterStats | Enumeration | YesNo |  |
| UseWeaponDamage | Enumeration | YesNo |  |
| UseWeaponProperties | Enumeration | YesNo |  |
| Autocast | Enumeration | YesNo |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| HitEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| WeaponBones | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| CleanseStatuses | String |  |  |
| StatusClearChance | Integer |  |  |
| Stealth | Enumeration | YesNo |  |
| PushDistance | Integer |  |  |
| CanTargetCharacters | Enumeration | YesNo |  |
| CanTargetItems | Enumeration | YesNo |  |
| PushPullEffect | String |  |  |
| IgnoreVisionBlock | Enumeration | YesNo |  |
| AiCalculationSkillOverride | String |  |  |
| IgnoreSilence | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## SkillData: Dome

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| Level | Integer |  |  |
| ForGameMaster | Enumeration | YesNo |  |
| IsEnemySkill | Enumeration | YesNo |  |
| Ability | Enumeration | SkillAbility |  |
| Tier | Enumeration | SkillTier |  |
| Requirement | Enumeration | SkillRequirement |  |
| ActionPoints | Integer |  |  |
| Cooldown | Integer |  |  |
| AIFlags | Enumeration | AIFlags |  |
| Lifetime | Integer |  |  |
| SkillProperties | String |  |  |
| TargetConditions | String |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| TargetRadius | Integer |  |  |
| UseCharacterStats | Enumeration | YesNo |  |
| AreaRadius | Integer |  |  |
| Requirements | String |  |  |
| MemorizationRequirements | String |  |  |
| Icon | String |  |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | String |  |  |
| FXScale | Integer |  |  |
| PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | String |  |  |
| PrepareEffect | String |  |  |
| CastAnimation | String |  |  |
| CastTextEvent | String |  |  |
| CastEffect | String |  |  |
| CastEffectTextEvent | String |  |  |
| TargetEffect | String |  |  |
| Memory Cost | Integer |  |  |
| Magic Cost | Integer |  |  |
| DomeEffect | String |  |  |
| Stealth | Enumeration | YesNo |  |
| CycleConditions | String |  |  |

## StatusData: Status_CONSUME

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |
| WeaponOverride | String |  |  |
| ResetCooldowns | String |  |  |
| ResetOncePerCombat | Enumeration | YesNo |  |
| ScaleWithVitality | Enumeration | YesNo |  |
| LeaveAction | String |  |  |
| DieAction | String |  |  |
| ForceStackOverwrite | Enumeration | YesNo |  |
| Toggle | Enumeration | YesNo |  |

## StatusData: Status_DAMAGE

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| DamageEvent | Enumeration | StatusEvent |  |
| DamageStats | String |  |  |
| DeathType | Enumeration | Death Type |  |
| DamageCharacters | Enumeration | YesNo |  |
| DamageItems | Enumeration | YesNo |  |
| DamageTorches | Enumeration | YesNo |  |
| PermanentOnTorch | Enumeration | YesNo |  |
| SpawnBlood | Enumeration | YesNo |  |
| ScaleWithVitality | Enumeration | YesNo |  |
| TickSFX | String |  |  |

## StatusData: Status_HEAL

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| Skills | String |  |  |
| HealStat | Enumeration | StatusHealType |  |
| HealType | Enumeration | HealValueType |  |
| HealValue | Integer |  |  |
| AbsorbSurfaceType | String |  |  |
| AbsorbSurfaceRange | Integer |  |  |
| BonusFromAbility | Enumeration | Ability |  |
| HealEffectId | String |  |  |
| VampirismType | Enumeration | VampirismType |  |
| Necromantic | Enumeration | YesNo |  |

## StatusData: Status_HEALING

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| OverrideDefaultDescription | Enumeration | YesNo |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| HealingEvent | Enumeration | StatusEvent |  |
| HealStat | Enumeration | StatusHealType |  |
| HealType | Enumeration | HealValueType |  |
| HealValue | Integer |  |  |
| SkipInitialEffect | Enumeration | YesNo |  |
| AbsorbSurfaceType | String |  |  |
| AbsorbSurfaceRange | Integer |  |  |
| HealEffectId | String |  |  |
| Necromantic | Enumeration | YesNo |  |

## StatusData: Status_FEAR

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |

## StatusData: Status_POLYMORPHED

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| PolymorphResult | String |  |  |
| DisableInteractions | Enumeration | YesNo |  |
| AiCalculationSkillOverride | String |  |  |
| Toggle | Enumeration | YesNo |  |
| RetainSkills | String |  |  |

## StatusData: Status_KNOCKED_DOWN

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| Skills | String |  |  |
| Instant | Enumeration | YesNo |  |

## StatusData: Status_STANCE

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |

## StatusData: Status_INCAPACITATED

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| FreezeTime | Integer |  |  |
| ApplyStatusOnTick | String |  |  |

## StatusData: Status_BLIND

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |

## StatusData: Status_GUARDIAN_ANGEL

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| DamagePercentage | Integer |  |  |

## StatusData: Status_DAMAGE_ON_MOVE

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| DamageEvent | Enumeration | StatusEvent |  |
| DamageStats | String |  |  |
| DeathType | Enumeration | Death Type |  |
| DamageCharacters | Enumeration | YesNo |  |
| DamageItems | Enumeration | YesNo |  |
| DamageTorches | Enumeration | YesNo |  |
| PermanentOnTorch | Enumeration | YesNo |  |
| SpawnBlood | Enumeration | YesNo |  |
| TickSFX | String |  |  |

## StatusData: Status_DEMONIC_BARGAIN

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| Skills | String |  |  |

## StatusData: Status_CHALLENGE

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| DescriptionCaster | String |  |  |
| DescriptionTarget | String |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| LoseControl | Enumeration | YesNo |  |
| IsInvulnerable | Enumeration | YesNo |  |
| Skills | String |  |  |
| WinBoost | String |  |  |
| LoseBoost | String |  |  |

## StatusData: Status_FLOATING

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |
| OnlyWhileMoving | Enumeration | YesNo |  |

## StatusData: Status_THROWN

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |

## StatusData: Status_DISARMED

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |

## StatusData: Status_HEAL_SHARING

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |

## StatusData: Status_HEAL_SHARING_CASTER

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| BeamEffect | String |  |  |
| HealMultiplier | Integer |  |  |

## StatusData: Status_ACTIVE_DEFENSE

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |
| WeaponOverride | String |  |  |
| ResetCooldowns | String |  |  |
| ResetOncePerCombat | Enumeration | YesNo |  |
| ScaleWithVitality | Enumeration | YesNo |  |
| TargetEffect | String |  |  |
| Projectile | String |  |  |
| Radius | Integer |  |  |
| Charges | Integer |  |  |
| DefendTargetPosition | Enumeration | YesNo |  |
| TargetConditions | String |  |  |

## StatusData: Status_SPARK

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |
| WeaponOverride | String |  |  |
| ResetCooldowns | String |  |  |
| ResetOncePerCombat | Enumeration | YesNo |  |
| ScaleWithVitality | Enumeration | YesNo |  |
| Projectile | String |  |  |
| Radius | Integer |  |  |
| Charges | Integer |  |  |
| TargetConditions | String |  |  |

## StatusData: Status_PLAY_DEAD

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |
| WeaponOverride | String |  |  |
| ResetCooldowns | String |  |  |
| ResetOncePerCombat | Enumeration | YesNo |  |
| ScaleWithVitality | Enumeration | YesNo |  |
| FreezeCooldowns | Enumeration | YesNo |  |

## StatusData: Status_INVISIBLE

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |
| WeaponOverride | String |  |  |
| ResetCooldowns | String |  |  |
| ResetOncePerCombat | Enumeration | YesNo |  |
| ScaleWithVitality | Enumeration | YesNo |  |

## StatusData: Status_DEACTIVATED

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |
| WeaponOverride | String |  |  |
| ResetCooldowns | String |  |  |
| ResetOncePerCombat | Enumeration | YesNo |  |
| ScaleWithVitality | Enumeration | YesNo |  |

## StatusData: Status_EFFECT

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| StatusEffect | String |  |  |
| ForceOverhead | Enumeration | YesNo |  |
| BeamEffect | String |  |  |
| PlayerSameParty | Enumeration | YesNo |  |
| PlayerHasTag | String |  |  |
| StatusEffectOnTurn | String |  |  |
| PeaceOnly | Enumeration | YesNo |  |

## StatusData: Status_EXTRA_TURN

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |
| Items | String |  |  |
| WeaponOverride | String |  |  |
| ResetCooldowns | String |  |  |
| ResetOncePerCombat | Enumeration | YesNo |  |
| ScaleWithVitality | Enumeration | YesNo |  |

## StatusData: Status_CHARMED

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |

## StatusData: Status_MUTED

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |

## StatusData: Status_DECAYING_TOUCH

| @name | @type | @enumeration_type_name | @description |
|-----|-----|-----|-----|
| Name | Name |  |  |
| Using | BaseClass |  | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |
| ForGameMaster | Enumeration | YesNo |  |
| InitiateCombat | Enumeration | YesNo |  |
| BringIntoCombat | Enumeration | YesNo |  |
| DisplayName | TranslatedString |  |  |
| Description | TranslatedString |  |  |
| DescriptionParams | String |  |  |
| Icon | String |  |  |
| FormatColor | Enumeration | FormatStringColor |  |
| ForceOverhead | Enumeration | YesNo |  |
| ApplyEffect | String |  |  |
| StatusEffect | String |  |  |
| StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | String |  |  |
| MaterialType | Enumeration | MaterialType |  |
| Material | String |  |  |
| MaterialApplyBody | Enumeration | YesNo |  |
| MaterialApplyArmor | Enumeration | YesNo |  |
| MaterialApplyWeapon | Enumeration | YesNo |  |
| MaterialApplyNormalMap | Enumeration | YesNo |  |
| MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | String |  |  |
| SoundStart | String |  |  |
| SoundLoop | String |  |  |
| SoundStop | String |  |  |
| SavingThrow | Enumeration | SavingThrow |  |
| ImmuneFlag | Enumeration | AttributeFlag |  |
| IsChanneled | Enumeration | YesNo |  |
| StatsId | String |  |  |
| StackId | String |  |  |
| StackPriority | Integer |  |  |
| AuraRadius | Integer |  |  |
| AuraSelf | String |  |  |
| AuraAllies | String |  |  |
| AuraNeutrals | String |  |  |
| AuraEnemies | String |  |  |
| AuraItems | String |  |  |
| AuraFX | String |  |  |
| SurfaceChange | String |  |  |
| IsInvulnerable | Enumeration | YesNo |  |
| IsResistingDeath | Enumeration | YesNo |  |
| LoseControl | Enumeration | YesNo |  |
| Skills | String |  |  |

