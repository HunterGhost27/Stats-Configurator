# Reference: Stat Object Definitions

---

## Stats: Character

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Act | Act | Act | Enumeration |  | Act |
| Act part | Level | Act part | Enumeration |  | ActPart |
| Act strength | Act strength | Act strength | Enumeration |  | Penalty Qualifier |
| Strength | Strength | Strength | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. | PreciseQualifier |
| Finesse | Finesse | Finesse | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. | PreciseQualifier |
| Intelligence | Intelligence | Intelligence | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. | PreciseQualifier |
| Constitution | Constitution | Constitution | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. | PreciseQualifier |
| Memory | Memory | Memory | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. | PreciseQualifier |
| Wits | Wits | Wits | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. 10 is roughly the amount that a dedicated player can gather at that level. | PreciseQualifier |
| Armor | Armor | Armor | Integer | Enter a positive percentage value. 100 will give you average Armour amount for a heavy character of corresponding level. |  |
| ArmorBoost | ArmorBoost | ArmorBoost | Integer | Enter a percentage value that will modify base Armour. E.g. -50 will halve current armour, 50 will produce 150% base armour. Helpful if you are inheriting and need 200% Armour compared to the parent. |  |
| ArmorBoostGrowthPerLevel | ArmorBoostGrowthPerLevel | ArmorBoostGrowthPerLevel | Integer | This parameter increases ArmorBoost by (Level-1)*param*0.1 |  |
| MagicArmor | MagicArmor | MagicArmor | Integer | Enter a positive percentage value. 100 will give you average Armour amount for a heavy character of corresponding level. |  |
| MagicArmorBoost | MagicArmorBoost | MagicArmorBoost | Integer | Enter a percentage value that will modify base Armour. E.g. -50 will halve current armour, 50 will produce 150% base armour. Helpful if you are inheriting and need 200% Armour compared to the parent. |  |
| MagicArmorBoostGrowthPerLevel | MagicArmorBoostGrowthPerLevel | MagicArmorBoostGrowthPerLevel | Integer | This parameter increases MagicArmorBoost by (Level-1)*param*0.1 |  |
| Reflexes | Reflexes | Reflexes | String |  |  |
| Vitality | Vitality | Vitality | Integer | Enter a positive percentage value. 100 will give you average Vitality amount for a character of corresponding level. |  |
| DamageBoost | DamageBoost | DamageBoost | Integer | Enter a percentage value, can be negative. E.g. -30 will reduce all damage inflicted by this character by 30%. |  |
| DamageBoostGrowthPerLevel | DamageBoostGrowthPerLevel | DamageBoostGrowthPerLevel | Integer | This parameter increase DamageBoost by (Level-1)*param*0.1 |  |
| MagicPoints | MagicPoints | MagicPoints | Integer | Maximum amount of Source Points the character can hold |  |
| ChanceToHitBoost | ChanceToHitBoost | ChanceToHitBoost | Integer |  |  |
| APMaximum | APMaximum | APMaximum | Integer |  |  |
| APStart | APStart | APStart | Integer | AP granted at the start of combat. |  |
| APRecovery | APRecovery | APRecovery | Integer | AP restored each turn |  |
| MPStart | MPStart | MPStart | Integer | Source Points amount on character creation |  |
| Movement | Movement | Movement | Integer | Distance in centimeters per AP spent on movement in combat. |  |
| MovementSpeedBoost | MovementSpeedBoost | MovementSpeedBoost | Integer | Percentage value, 50 produces a character with 150% base Movement. |  |
| Gain | Gain | Gain | Enumeration | Enter a positive percentage value. E.g. level 3 character with '5' Gain will produce enough XP to cover 5% of experience needed to advance from level 3 to level 4. | BigQualifier |
| Sight | Sight | Sight | Enumeration |  | Penalty Qualifier |
| Hearing | Hearing | Hearing | Enumeration |  | Penalty Qualifier |
| Initiative | Initiative | Initiative | Integer |  |  |
| FOV | FOV | FOV | Integer |  |  |
| Weight | Weight | Weight | Integer | In grams, relevant for some types of puzzles. |  |
| StepsType | StepsType | StepsType | Enumeration |  | StepsType |
| PiercingResistance | PiercingResistance | PiercingResistance | Integer | Enter a percentage value, can be negative. |  |
| PhysicalResistance | PhysicalResistance | PhysicalResistance | Integer | Enter a percentage value, can be negative. |  |
| CriticalChance | CriticalChance | CriticalChance | Enumeration |  | Penalty Qualifier |
| MaxResistance | MaxResistance | MaxResistance | Integer | Enter a positive percentage value. Default cap is 200. |  |
| FireResistance | FireResistance | FireResistance | Integer | Enter a percentage value, can be negative. |  |
| EarthResistance | EarthResistance | EarthResistance | Integer | Enter a percentage value, can be negative. |  |
| WaterResistance | WaterResistance | WaterResistance | Integer | Enter a percentage value, can be negative. |  |
| AirResistance | AirResistance | AirResistance | Integer | Enter a percentage value, can be negative. |  |
| PoisonResistance | PoisonResistance | PoisonResistance | Integer | Enter a percentage value, can be negative. |  |
| SingleHanded | SingleHanded | SingleHanded | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| TwoHanded | TwoHanded | TwoHanded | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| Ranged | Ranged | Ranged | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| DualWielding | DualWielding | DualWielding | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| Leadership | Leadership | Leadership | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| PainReflection | PainReflection | PainReflection | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| Perseverance | Perseverance | Perseverance | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| RogueLore | RogueLore | RogueLore | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| WarriorLore | WarriorLore | WarriorLore | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| RangerLore | RangerLore | RangerLore | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| FireSpecialist | FireSpecialist | FireSpecialist | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| WaterSpecialist | WaterSpecialist | WaterSpecialist | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| AirSpecialist | AirSpecialist | AirSpecialist | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| EarthSpecialist | EarthSpecialist | EarthSpecialist | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| Sourcery | Sourcery | Sourcery | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| Necromancy | Necromancy | Necromancy | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| Polymorph | Polymorph | Polymorph | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| Summoning | Summoning | Summoning | Integer | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of ability. 10 is roughly the maximum amount that a player can gather at that level. |  |
| Telekinesis | Telekinesis | Telekinesis | Integer | Enter a flat value. Default civil ability cap is 5. |  |
| Sneaking | Sneaking | Sneaking | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| Thievery | Thievery | Thievery | Integer | Enter a flat value. Default civil ability cap is 5. |  |
| Loremaster | Loremaster | Loremaster | Integer | Enter a flat value. Default civil ability cap is 5. |  |
| Repair | Repair | Repair | Integer | Enter a flat value. Default civil ability cap is 5. |  |
| Barter | Barter | Barter | Integer | Enter a flat value. Default civil ability cap is 5. |  |
| Persuasion | Persuasion | Persuasion | Integer | Enter a flat value. Default civil ability cap is 5. |  |
| Luck | Luck | Luck | Integer | Enter a flat value. Default civil ability cap is 5. |  |
| Accuracy | Accuracy | Accuracy | Integer | Enter a percentage value |  |
| Dodge | Dodge | Dodge | Integer | Enter a percentage value |  |
| Reflection | Reflection | Reflection | String |  |  |
| MaxSummons | MaxSummons | MaxSummons | Integer |  |  |
| ExtraProperties | ExtraProperties | ExtraProperties | String |  |  |
| Flags | Flags | Flags | EnumerationList |  | AttributeFlags |
| Talents | Talents | Talents | String |  |  |
| Traits | Traits | Traits | String |  |  |
| PathInfluence | PathInfluence | PathInfluence | String |  |  |
| Comment | Comment |  | Comment |  |  |

## Stats: Potion

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| RootTemplate | RootTemplate | RootTemplate | RootTemplate |  |  |
| Act | Act | Act | Enumeration |  | Act |
| Act part | Level | Act part | Enumeration |  | ActPart |
| Act strength | Act strength | Act strength | String |  |  |
| StackId | StackId | StackId | String |  |  |
| ComboCategory | ComboCategory | ComboCategory | String |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| Weight | Weight | Weight | Integer |  |  |
| Value | Value | Value | Integer |  |  |
| Strength | Strength | Strength | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty PreciseQualifier |
| Finesse | Finesse | Finesse | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty PreciseQualifier |
| Intelligence | Intelligence | Intelligence | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty PreciseQualifier |
| Constitution | Constitution | Constitution | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty PreciseQualifier |
| Memory | Memory | Memory | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty PreciseQualifier |
| Wits | Wits | Wits | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty PreciseQualifier |
| SingleHanded | SingleHanded | SingleHanded | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| TwoHanded | TwoHanded | TwoHanded | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| Ranged | Ranged | Ranged | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| DualWielding | DualWielding | DualWielding | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| PhysicalArmorMastery | PhysicalArmorMastery | PhysicalArmorMastery | String | Enter a flat value. Combat Ability cap is 10. |  |
| MagicArmorMastery | MagicArmorMastery | MagicArmorMastery | String | Enter a flat value. Combat Ability cap is 10. |  |
| VitalityMastery | VitalityMastery | VitalityMastery | String | Enter a flat value. Combat Ability cap is 10. |  |
| PainReflection | PainReflection | PainReflection | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| WarriorLore | WarriorLore | WarriorLore | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| RangerLore | RangerLore | RangerLore | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| RogueLore | RogueLore | RogueLore | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| Sourcery | Sourcery | Sourcery | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| Telekinesis | Telekinesis | Telekinesis | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| FireSpecialist | FireSpecialist | FireSpecialist | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| WaterSpecialist | WaterSpecialist | WaterSpecialist | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| AirSpecialist | AirSpecialist | AirSpecialist | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| EarthSpecialist | EarthSpecialist | EarthSpecialist | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| Necromancy | Necromancy | Necromancy | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| Polymorph | Polymorph | Polymorph | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| Summoning | Summoning | Summoning | Integer | Enter a flat value. Combat Ability cap is 10. |  |
| Sneaking | Sneaking | Sneaking | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| Thievery | Thievery | Thievery | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| Loremaster | Loremaster | Loremaster | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| Repair | Repair | Repair | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| Barter | Barter | Barter | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| Persuasion | Persuasion | Persuasion | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| Leadership | Leadership | Leadership | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| Luck | Luck | Luck | Integer | Enter a flat value. Civil Ability cap is 5. |  |
| FireResistance | FireResistance | FireResistance | Integer | Enter a percentage value, can be negative. |  |
| EarthResistance | EarthResistance | EarthResistance | Integer | Enter a percentage value, can be negative. |  |
| WaterResistance | WaterResistance | WaterResistance | Integer | Enter a percentage value, can be negative. |  |
| AirResistance | AirResistance | AirResistance | Integer | Enter a percentage value, can be negative. |  |
| PoisonResistance | PoisonResistance | PoisonResistance | Integer | Enter a percentage value, can be negative. |  |
| PiercingResistance | PiercingResistance | PiercingResistance | Integer | Enter a percentage value, can be negative. |  |
| PhysicalResistance | PhysicalResistance | PhysicalResistance | Integer | Enter a percentage value, can be negative. |  |
| Sight | Sight | Sight | Integer |  |  |
| Hearing | Hearing | Hearing | Enumeration |  | Penalty Qualifier |
| Initiative | Initiative | Initiative | Integer |  |  |
| Movement | Movement | Movement | Integer | Enter a flat value in centimeters. |  |
| MovementSpeedBoost | MovementSpeedBoost | MovementSpeedBoost | Integer | Enter a percentage value, can be negative. |  |
| Vitality | Vitality | Vitality | Integer | Enter a percentage value. Potion will heal the character for Vitality amount provided by code. E.g. 100 is the standard heal amount for the level of the character. |  |
| VitalityBoost | VitalityBoost | VitalityBoost | Integer | Enter a percentage value, can be negative. E.g. '10' produces you +10% character's base maximum Vitality. |  |
| VitalityPercentage | VitalityPercentage | VitalityPercentage | Integer | Enter a positive percentage value. Potion will heal the character for Vitality amount equal to the percentage of their maximum Vitality. |  |
| ChanceToHitBoost | ChanceToHitBoost | ChanceToHitBoost | Integer |  |  |
| AccuracyBoost | AccuracyBoost | AccuracyBoost | Integer |  |  |
| DodgeBoost | DodgeBoost | DodgeBoost | Integer |  |  |
| DamageBoost | DamageBoost | DamageBoost | Integer |  |  |
| RangeBoost | RangeBoost | RangeBoost | Integer |  |  |
| APCostBoost | APCostBoost | APCostBoost | Integer |  |  |
| SPCostBoost | SPCostBoost | SPCostBoost | Integer |  |  |
| APMaximum | APMaximum | APMaximum | Integer |  |  |
| APStart | APStart | APStart | Integer |  |  |
| APRecovery | APRecovery | APRecovery | Integer |  |  |
| CriticalChance | CriticalChance | CriticalChance | Integer |  |  |
| Gain | Gain | Gain | Enumeration |  | BigQualifier |
| Armor | Armor | Armor | Integer | Enter a percentage value, can be negative. Code will turn it into a flat bonus\malus. E.g. '50' produces half of an average Armour buff. |  |
| ArmorBoost | ArmorBoost | ArmorBoost | Integer | Enter a percentage value, can be negative. This value modifies character's maximum Armour by a percentage. E.g. '10' produces +10% of character's maximum Armour. |  |
| MagicArmor | MagicArmor | MagicArmor | Integer | Enter a percentage value, can be negative. Code will turn it into a flat bonus\malus. E.g. '50' produces half of an average Armour buff. |  |
| MagicArmorBoost | MagicArmorBoost | MagicArmorBoost | Integer | Enter a percentage value, can be negative. This value modifies character's maximum Armour by a percentage. E.g. '10' produces +10% of character's maximum Armour. |  |
| Duration | Duration | Duration | Integer |  |  |
| UseAPCost | UseAPCost | UseAPCost | Integer |  |  |
| Reflection | Reflection | Reflection | String |  |  |
| LifeSteal | LifeSteal | LifeSteal | Integer | Enter a positive percentage value. Any damage to Vitality that owner character inflicts will turn into a heal modified by this percentage value. |  |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| MagicPoints | MagicPoints | MagicPoints | Integer |  |  |
| BloodSurfaceType | BloodSurfaceType | BloodSurfaceType | String |  |  |
| MaxSummons | MaxSummons | MaxSummons | Integer |  |  |
| AddToBottomBar | AddToBottomBar | AddToBottomBar | Enumeration |  | YesNo |
| ExtraProperties | ExtraProperties | ExtraProperties | String |  |  |
| BoostConditions | BoostConditions | BoostConditions | String |  |  |
| Flags | Flags | Flags | EnumerationList |  | AttributeFlags |
| BonusWeapon | BonusWeapon | BonusWeapon | String | Enter a stat name from Weapon file. |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusIcon | StatusIcon | StatusIcon | String |  |  |
| StatusMaterial | StatusMaterial | StatusMaterial | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| InventoryTab | InventoryTab | InventoryTab | Enumeration |  | InventoryTabs |
| UnknownBeforeConsume | UnknownBeforeConsume | UnknownBeforeConsume | Enumeration |  | YesNo |
| IsConsumable | IsConsumable | IsConsumable | Enumeration |  | YesNo |
| IsFood | IsFood | IsFood | Enumeration |  | YesNo |
| SummonLifelinkModifier | SummonLifelinkModifier | SummonLifelinkModifier | Integer |  |  |
| IgnoredByAI | IgnoredByAI | IgnoredByAI | Enumeration |  | YesNo |
| AiCalculationStatsOverride | AiCalculationStatsOverride | AiCalculationStatsOverride | String |  |  |
| RuneLevel | RuneLevel | RuneLevel | Integer |  |  |
| RuneEffectWeapon | RuneEffectWeapon | RuneEffectWeapon | String |  |  |
| RuneEffectUpperbody | RuneEffectUpperbody | RuneEffectUpperbody | String |  |  |
| RuneEffectAmulet | RuneEffectAmulet | RuneEffectAmulet | String |  |  |
| ObjectCategory | ObjectCategory | ObjectCategory | String |  |  |
| MinAmount | MinAmount | MinAmount | Integer |  |  |
| MaxAmount | MaxAmount | MaxAmount | Integer |  |  |
| Priority | Priority | Priority | Integer |  |  |
| Unique | Unique | Unique | Integer |  |  |
| MinLevel | MinLevel | MinLevel | Integer |  |  |
| MaxLevel | MaxLevel | MaxLevel | Integer |  |  |
| Comment | Comment |  | Comment |  |  |

## Stats: Armor

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ItemGroup | ItemGroup | ItemGroup | String |  |  |
| ModifierType | ModifierType | ModifierType | Enumeration |  | ModifierType |
| Act | Act | Act | Enumeration |  | Act |
| Act part | Level | Act part | Enumeration |  | ActPart |
| Slot | Slot | Slot | Enumeration |  | Itemslot |
| Requirements | Requirements | Requirements | String |  |  |
| Armor Defense Value | Armor Defense Value | Armor Defense Value | Integer | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |  |
| ArmorBoost | ArmorBoost | ArmorBoost | Integer | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base. |  |
| Magic Armor Value | Magic Armor Value | Magic Armor Value | Integer | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |  |
| MagicArmorBoost | MagicArmorBoost | MagicArmorBoost | Integer | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base. |  |
| Durability | Durability | Durability | Integer |  |  |
| DurabilityDegradeSpeed | DurabilityDegradeSpeed | DurabilityDegradeSpeed | Enumeration |  | Qualifier |
| Value | Value | Value | Integer |  |  |
| Weight | Weight | Weight | Integer |  |  |
| Movement | Movement | Movement | Integer | Enter a flat value in centimeters. |  |
| Initiative | Initiative | Initiative | Integer |  |  |
| Fire | Fire | Fire | Integer | Enter a percentage resistance value. |  |
| Air | Air | Air | Integer | Enter a percentage resistance value. |  |
| Water | Water | Water | Integer | Enter a percentage resistance value. |  |
| Earth | Earth | Earth | Integer | Enter a percentage resistance value. |  |
| Poison | Poison | Poison | Integer | Enter a percentage resistance value. |  |
| Piercing | Piercing | Piercing | Integer | Enter a percentage resistance value. |  |
| Physical | Physical | Physical | Integer | Enter a percentage resistance value. |  |
| StrengthBoost | StrengthBoost | StrengthBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| FinesseBoost | FinesseBoost | FinesseBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| IntelligenceBoost | IntelligenceBoost | IntelligenceBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| ConstitutionBoost | ConstitutionBoost | ConstitutionBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| MemoryBoost | MemoryBoost | MemoryBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| WitsBoost | WitsBoost | WitsBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| SingleHanded | SingleHanded | SingleHanded | Integer |  |  |
| TwoHanded | TwoHanded | TwoHanded | Integer |  |  |
| Ranged | Ranged | Ranged | Integer |  |  |
| DualWielding | DualWielding | DualWielding | Integer |  |  |
| Perseverance | Perseverance | Perseverance | Integer |  |  |
| Leadership | Leadership | Leadership | Integer |  |  |
| PainReflection | PainReflection | PainReflection | Integer |  |  |
| WarriorLore | WarriorLore | WarriorLore | Integer |  |  |
| RangerLore | RangerLore | RangerLore | Integer |  |  |
| RogueLore | RogueLore | RogueLore | Integer |  |  |
| Sourcery | Sourcery | Sourcery | Integer |  |  |
| FireSpecialist | FireSpecialist | FireSpecialist | Integer |  |  |
| WaterSpecialist | WaterSpecialist | WaterSpecialist | Integer |  |  |
| AirSpecialist | AirSpecialist | AirSpecialist | Integer |  |  |
| EarthSpecialist | EarthSpecialist | EarthSpecialist | Integer |  |  |
| Necromancy | Necromancy | Necromancy | Integer |  |  |
| Polymorph | Polymorph | Polymorph | Integer |  |  |
| Summoning | Summoning | Summoning | Integer |  |  |
| Telekinesis | Telekinesis | Telekinesis | Integer |  |  |
| Sneaking | Sneaking | Sneaking | Integer |  |  |
| Thievery | Thievery | Thievery | Integer |  |  |
| Loremaster | Loremaster | Loremaster | Integer |  |  |
| Repair | Repair | Repair | Integer |  |  |
| Barter | Barter | Barter | Integer |  |  |
| Persuasion | Persuasion | Persuasion | Integer |  |  |
| Luck | Luck | Luck | Integer |  |  |
| SightBoost | SightBoost | SightBoost | Enumeration |  | Penalty Qualifier |
| HearingBoost | HearingBoost | HearingBoost | Enumeration |  | Penalty Qualifier |
| VitalityBoost | VitalityBoost | VitalityBoost | Integer |  |  |
| MagicPointsBoost | MagicPointsBoost | MagicPointsBoost | Enumeration |  | Penalty Qualifier |
| ChanceToHitBoost | ChanceToHitBoost | ChanceToHitBoost | Integer |  |  |
| APMaximum | APMaximum | APMaximum | Integer |  |  |
| APStart | APStart | APStart | Integer |  |  |
| APRecovery | APRecovery | APRecovery | Integer |  |  |
| AccuracyBoost | AccuracyBoost | AccuracyBoost | Integer |  |  |
| DodgeBoost | DodgeBoost | DodgeBoost | Integer |  |  |
| CriticalChance | CriticalChance | CriticalChance | Integer |  |  |
| Reflection | Reflection | Reflection | String |  |  |
| MaxSummons | MaxSummons | MaxSummons | Integer |  |  |
| Skills | Skills | Skills | String |  |  |
| Talents | Talents | Talents | String |  |  |
| Tags | Tags | Tags | String |  |  |
| ExtraProperties | ExtraProperties | ExtraProperties | String |  |  |
| Flags | Flags | Flags | EnumerationList |  | AttributeFlags |
| Boosts | Boosts | Boosts | String |  |  |
| ComboCategory | ComboCategory | ComboCategory | String |  |  |
| InventoryTab | InventoryTab | InventoryTab | Enumeration |  | InventoryTabs |
| ArmorType | ArmorType | ArmorType | Enumeration |  | ArmorType |
| ItemColor | ItemColor | ItemColor | String |  |  |
| NeedsIdentification | NeedsIdentification | NeedsIdentification | Enumeration |  | YesNo |
| Charges | Charges | Charges | Integer |  |  |
| MaxCharges | MaxCharges | MaxCharges | Integer |  |  |
| RuneSlots | RuneSlots | RuneSlots | Integer |  |  |
| RuneSlots_V1 | RuneSlots_V1 | RuneSlots_V1 | Integer |  |  |
| ObjectCategory | ObjectCategory | ObjectCategory | String |  |  |
| MinAmount | MinAmount | MinAmount | Integer |  |  |
| MaxAmount | MaxAmount | MaxAmount | Integer |  |  |
| Priority | Priority | Priority | Integer |  |  |
| Unique | Unique | Unique | Integer |  |  |
| MinLevel | MinLevel | MinLevel | Integer |  |  |
| MaxLevel | MaxLevel | MaxLevel | Integer |  |  |
| Comment | Comment |  | Comment |  |  |

## Stats: Object

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| RootTemplate | RootTemplate | RootTemplate | RootTemplate |  |  |
| ModifierType | ModifierType | ModifierType | Enumeration |  | ModifierType |
| Act | Act | Act | Enumeration |  | Act |
| Act part | Level | Act part | Enumeration |  | ActPart |
| UseAPCost | UseAPCost | UseAPCost | Integer |  |  |
| Value | Value | Value | Integer |  |  |
| Weight | Weight | Weight | Integer |  |  |
| ComboCategory | ComboCategory | ComboCategory | String |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| Strength | Strength | Strength | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. | PreciseQualifier |
| Finesse | Finesse | Finesse | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. | PreciseQualifier |
| Intelligence | Intelligence | Intelligence | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. | PreciseQualifier |
| Constitution | Constitution | Constitution | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. | PreciseQualifier |
| Memory | Memory | Memory | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. | PreciseQualifier |
| Wits | Wits | Wits | Enumeration | Enter a value in [0,10] range. Code will turn it into level-appropriate amount of attribute. | PreciseQualifier |
| Vitality | Vitality | Vitality | Integer |  |  |
| Armor | Armor | Armor | Enumeration |  | PreciseQualifier |
| PiercingResistance | PiercingResistance | PiercingResistance | Integer |  |  |
| PhysicalResistance | PhysicalResistance | PhysicalResistance | Integer |  |  |
| FireResistance | FireResistance | FireResistance | Integer |  |  |
| EarthResistance | EarthResistance | EarthResistance | Integer |  |  |
| WaterResistance | WaterResistance | WaterResistance | Integer |  |  |
| AirResistance | AirResistance | AirResistance | Integer |  |  |
| PoisonResistance | PoisonResistance | PoisonResistance | Integer |  |  |
| Flags | Flags | Flags | EnumerationList |  | AttributeFlags |
| InventoryTab | InventoryTab | InventoryTab | Enumeration |  | InventoryTabs |
| AddToBottomBar | AddToBottomBar | AddToBottomBar | Enumeration |  | YesNo |
| IgnoredByAI | IgnoredByAI | IgnoredByAI | Enumeration |  | YesNo |
| RuneLevel | RuneLevel | RuneLevel | Integer |  |  |
| RuneEffectWeapon | RuneEffectWeapon | RuneEffectWeapon | String |  |  |
| RuneEffectUpperbody | RuneEffectUpperbody | RuneEffectUpperbody | String |  |  |
| RuneEffectAmulet | RuneEffectAmulet | RuneEffectAmulet | String |  |  |
| ObjectCategory | ObjectCategory | ObjectCategory | String |  |  |
| MinAmount | MinAmount | MinAmount | Integer |  |  |
| MaxAmount | MaxAmount | MaxAmount | Integer |  |  |
| Priority | Priority | Priority | Integer |  |  |
| Unique | Unique | Unique | Integer |  |  |
| MinLevel | MinLevel | MinLevel | Integer |  |  |
| MaxLevel | MaxLevel | MaxLevel | Integer |  |  |
| Comment | Comment |  | Comment |  |  |

## Stats: Shield

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ItemGroup | ItemGroup | ItemGroup | String |  |  |
| ModifierType | ModifierType | ModifierType | Enumeration |  | ModifierType |
| Act | Act | Act | Enumeration |  | Act |
| Act part | Level | Act part | Enumeration |  | ActPart |
| Requirements | Requirements | Requirements | String |  |  |
| Armor Defense Value | Armor Defense Value | Armor Defense Value | Integer | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |  |
| ArmorBoost | ArmorBoost | ArmorBoost | Integer | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base. |  |
| Magic Armor Value | Magic Armor Value | Magic Armor Value | Integer | Enter a positive percentage value. Code will turn it into level-appropriate amount of Armour, using 100 as average. |  |
| MagicArmorBoost | MagicArmorBoost | MagicArmorBoost | Integer | Enter a percentage value, can be negative. Modifies base amount of Armour, '10' produces +10% of base. |  |
| Blocking | Blocking | Blocking | Integer |  |  |
| Durability | Durability | Durability | Integer |  |  |
| DurabilityDegradeSpeed | DurabilityDegradeSpeed | DurabilityDegradeSpeed | Enumeration |  | Qualifier |
| Value | Value | Value | Integer |  |  |
| Weight | Weight | Weight | Integer |  |  |
| Movement | Movement | Movement | Integer | Enter a flat value in centimeters. |  |
| Initiative | Initiative | Initiative | Integer |  |  |
| Slot | Slot | Slot | Enumeration |  | Itemslot |
| Fire | Fire | Fire | Integer | Enter a percentage resistance value. |  |
| Air | Air | Air | Integer | Enter a percentage resistance value. |  |
| Water | Water | Water | Integer | Enter a percentage resistance value. |  |
| Earth | Earth | Earth | Integer | Enter a percentage resistance value. |  |
| Poison | Poison | Poison | Integer | Enter a percentage resistance value. |  |
| Piercing | Piercing | Piercing | Integer | Enter a percentage resistance value. |  |
| Physical | Physical | Physical | Integer | Enter a percentage resistance value. |  |
| StrengthBoost | StrengthBoost | StrengthBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| FinesseBoost | FinesseBoost | FinesseBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| IntelligenceBoost | IntelligenceBoost | IntelligenceBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| ConstitutionBoost | ConstitutionBoost | ConstitutionBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| MemoryBoost | MemoryBoost | MemoryBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| WitsBoost | WitsBoost | WitsBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| SingleHanded | SingleHanded | SingleHanded | Integer |  |  |
| TwoHanded | TwoHanded | TwoHanded | Integer |  |  |
| Ranged | Ranged | Ranged | Integer |  |  |
| DualWielding | DualWielding | DualWielding | Integer |  |  |
| Perseverance | Perseverance | Perseverance | Integer |  |  |
| Leadership | Leadership | Leadership | Integer |  |  |
| PainReflection | PainReflection | PainReflection | Integer |  |  |
| RogueLore | RogueLore | RogueLore | Integer |  |  |
| WarriorLore | WarriorLore | WarriorLore | Integer |  |  |
| RangerLore | RangerLore | RangerLore | Integer |  |  |
| FireSpecialist | FireSpecialist | FireSpecialist | Integer |  |  |
| WaterSpecialist | WaterSpecialist | WaterSpecialist | Integer |  |  |
| AirSpecialist | AirSpecialist | AirSpecialist | Integer |  |  |
| EarthSpecialist | EarthSpecialist | EarthSpecialist | Integer |  |  |
| Sourcery | Sourcery | Sourcery | Integer |  |  |
| Necromancy | Necromancy | Necromancy | Integer |  |  |
| Polymorph | Polymorph | Polymorph | Integer |  |  |
| Summoning | Summoning | Summoning | Integer |  |  |
| Telekinesis | Telekinesis | Telekinesis | Integer |  |  |
| Sneaking | Sneaking | Sneaking | Integer |  |  |
| LockPicking | LockPicking | LockPicking | String |  |  |
| Loremaster | Loremaster | Loremaster | Integer |  |  |
| Repair | Repair | Repair | Integer |  |  |
| Barter | Barter | Barter | Integer |  |  |
| Persuasion | Persuasion | Persuasion | Integer |  |  |
| Luck | Luck | Luck | Integer |  |  |
| SightBoost | SightBoost | SightBoost | Enumeration |  | Penalty Qualifier |
| HearingBoost | HearingBoost | HearingBoost | Enumeration |  | Penalty Qualifier |
| VitalityBoost | VitalityBoost | VitalityBoost | Integer |  |  |
| MagicPointsBoost | MagicPointsBoost | MagicPointsBoost | Enumeration |  | Penalty Qualifier |
| ChanceToHitBoost | ChanceToHitBoost | ChanceToHitBoost | Integer |  |  |
| APMaximum | APMaximum | APMaximum | Integer |  |  |
| APStart | APStart | APStart | Integer |  |  |
| APRecovery | APRecovery | APRecovery | Integer |  |  |
| AccuracyBoost | AccuracyBoost | AccuracyBoost | Integer |  |  |
| DodgeBoost | DodgeBoost | DodgeBoost | Integer |  |  |
| CriticalChance | CriticalChance | CriticalChance | Enumeration |  | Penalty Qualifier |
| Reflection | Reflection | Reflection | String |  |  |
| Bodybuilding | Bodybuilding | Bodybuilding | String |  |  |
| Willpower | Willpower | Willpower | String |  |  |
| MaxSummons | MaxSummons | MaxSummons | Integer |  |  |
| Skills | Skills | Skills | String |  |  |
| Talents | Talents | Talents | String |  |  |
| Tags | Tags | Tags | String |  |  |
| ExtraProperties | ExtraProperties | ExtraProperties | String |  |  |
| Flags | Flags | Flags | EnumerationList |  | AttributeFlags |
| ComboCategory | ComboCategory | ComboCategory | String |  |  |
| InventoryTab | InventoryTab | InventoryTab | Enumeration |  | InventoryTabs |
| ItemColor | ItemColor | ItemColor | String |  |  |
| NeedsIdentification | NeedsIdentification | NeedsIdentification | Enumeration |  | YesNo |
| Charges | Charges | Charges | String |  |  |
| MaxCharges | MaxCharges | MaxCharges | String |  |  |
| RuneSlots | RuneSlots | RuneSlots | Integer |  |  |
| RuneSlots_V1 | RuneSlots_V1 | RuneSlots_V1 | Integer |  |  |
| ObjectCategory | ObjectCategory | ObjectCategory | String |  |  |
| MinAmount | MinAmount | MinAmount | Integer |  |  |
| MaxAmount | MaxAmount | MaxAmount | Integer |  |  |
| Priority | Priority | Priority | Integer |  |  |
| Unique | Unique | Unique | Integer |  |  |
| MinLevel | MinLevel | MinLevel | Integer |  |  |
| MaxLevel | MaxLevel | MaxLevel | Integer |  |  |
| Comment | Comment |  | Comment |  |  |

## Stats: Weapon

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass |  |  |
| ItemGroup | ItemGroup | ItemGroup | String |  |  |
| ModifierType | ModifierType | ModifierType | Enumeration |  | ModifierType |
| Act | Act | Act | Enumeration |  | Act |
| Act part | Level | Act part | Enumeration |  | ActPart |
| Requirements | Requirements | Requirements | String |  |  |
| IsTwoHanded | IsTwoHanded | IsTwoHanded | Enumeration |  | YesNo |
| AttackAPCost | AttackAPCost | AttackAPCost | Integer |  |  |
| Damage Type | Damage Type | Damage Type | Enumeration |  | Damage Type |
| Damage | Damage | Damage | Integer | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageBoost | DamageBoost | DamageBoost | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| DamageFromBase | DamageFromBase | DamageFromBase | Integer | Used by boosts, percentage value. |  |
| CriticalDamage | CriticalDamage | CriticalDamage | Integer |  |  |
| CriticalChance | CriticalChance | CriticalChance | Integer |  |  |
| WeaponRange | WeaponRange | WeaponRange | Integer |  |  |
| CleavePercentage | CleavePercentage | CleavePercentage | Integer |  |  |
| CleaveAngle | CleaveAngle | CleaveAngle | Integer |  |  |
| Durability | Durability | Durability | Integer |  |  |
| DurabilityDegradeSpeed | DurabilityDegradeSpeed | DurabilityDegradeSpeed | Enumeration |  | Qualifier |
| Value | Value | Value | Integer |  |  |
| Weight | Weight | Weight | Integer |  |  |
| Movement | Movement | Movement | Integer |  |  |
| Initiative | Initiative | Initiative | Integer |  |  |
| WeaponType | WeaponType | WeaponType | Enumeration |  | WeaponType |
| AnimType | AnimType | AnimType | Enumeration |  | AnimType |
| Slot | Slot | Slot | Enumeration |  | Itemslot |
| Projectile | Projectile | Projectile | String |  |  |
| IgnoreVisionBlock | IgnoreVisionBlock | IgnoreVisionBlock | Enumeration |  | YesNo |
| StrengthBoost | StrengthBoost | StrengthBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| FinesseBoost | FinesseBoost | FinesseBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| IntelligenceBoost | IntelligenceBoost | IntelligenceBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| ConstitutionBoost | ConstitutionBoost | ConstitutionBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| MemoryBoost | MemoryBoost | MemoryBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| WitsBoost | WitsBoost | WitsBoost | Enumeration | Enter a value in [-10,10] range. Code will turn it into level-appropriate amount of attribute. | Penalty Qualifier |
| TwoHanded | TwoHanded | TwoHanded | Integer |  |  |
| SingleHanded | SingleHanded | SingleHanded | Integer |  |  |
| Ranged | Ranged | Ranged | Integer |  |  |
| DualWielding | DualWielding | DualWielding | Integer |  |  |
| Perseverance | Perseverance | Perseverance | Integer |  |  |
| Leadership | Leadership | Leadership | Integer |  |  |
| PainReflection | PainReflection | PainReflection | Integer |  |  |
| WarriorLore | WarriorLore | WarriorLore | Integer |  |  |
| RangerLore | RangerLore | RangerLore | Integer |  |  |
| RogueLore | RogueLore | RogueLore | Integer |  |  |
| FireSpecialist | FireSpecialist | FireSpecialist | Integer |  |  |
| WaterSpecialist | WaterSpecialist | WaterSpecialist | Integer |  |  |
| AirSpecialist | AirSpecialist | AirSpecialist | Integer |  |  |
| EarthSpecialist | EarthSpecialist | EarthSpecialist | Integer |  |  |
| Necromancy | Necromancy | Necromancy | Integer |  |  |
| Polymorph | Polymorph | Polymorph | Integer |  |  |
| Summoning | Summoning | Summoning | Integer |  |  |
| Sourcery | Sourcery | Sourcery | Integer |  |  |
| Telekinesis | Telekinesis | Telekinesis | Integer |  |  |
| Sneaking | Sneaking | Sneaking | Integer |  |  |
| Thievery | Thievery | Thievery | Integer |  |  |
| Loremaster | Loremaster | Loremaster | Integer |  |  |
| Repair | Repair | Repair | Integer |  |  |
| Barter | Barter | Barter | Integer |  |  |
| Persuasion | Persuasion | Persuasion | Integer |  |  |
| Luck | Luck | Luck | Integer |  |  |
| Fire | Fire | Fire | Integer |  |  |
| Earth | Earth | Earth | Integer |  |  |
| Water | Water | Water | Integer |  |  |
| Air | Air | Air | Integer |  |  |
| Poison | Poison | Poison | Integer |  |  |
| SightBoost | SightBoost | SightBoost | Enumeration |  | Penalty Qualifier |
| HearingBoost | HearingBoost | HearingBoost | Enumeration |  | Penalty Qualifier |
| VitalityBoost | VitalityBoost | VitalityBoost | Integer |  |  |
| ChanceToHitBoost | ChanceToHitBoost | ChanceToHitBoost | Integer |  |  |
| APMaximum | APMaximum | APMaximum | Integer |  |  |
| APStart | APStart | APStart | Integer |  |  |
| APRecovery | APRecovery | APRecovery | Integer |  |  |
| AccuracyBoost | AccuracyBoost | AccuracyBoost | Integer |  |  |
| DodgeBoost | DodgeBoost | DodgeBoost | Integer |  |  |
| ComboCategory | ComboCategory | ComboCategory | String |  |  |
| Reflection | Reflection | Reflection | String |  |  |
| MaxSummons | MaxSummons | MaxSummons | Integer |  |  |
| LifeSteal | LifeSteal | LifeSteal | Integer |  |  |
| Skills | Skills | Skills | String |  |  |
| Talents | Talents | Talents | String |  |  |
| Tags | Tags | Tags | String |  |  |
| ExtraProperties | ExtraProperties | ExtraProperties | String |  |  |
| Flags | Flags | Flags | EnumerationList |  | AttributeFlags |
| Boosts | Boosts | Boosts | String |  |  |
| InventoryTab | InventoryTab | InventoryTab | Enumeration |  | InventoryTabs |
| NeedsIdentification | NeedsIdentification | NeedsIdentification | Enumeration |  | YesNo |
| Charges | Charges | Charges | Integer |  |  |
| MaxCharges | MaxCharges | MaxCharges | Integer |  |  |
| ItemColor | ItemColor | ItemColor | String |  |  |
| RuneSlots | RuneSlots | RuneSlots | Integer |  |  |
| RuneSlots_V1 | RuneSlots_V1 | RuneSlots_V1 | Integer |  |  |
| ObjectCategory | ObjectCategory | ObjectCategory | String |  |  |
| MinAmount | MinAmount | MinAmount | Integer |  |  |
| MaxAmount | MaxAmount | MaxAmount | Integer |  |  |
| Priority | Priority | Priority | Integer |  |  |
| Unique | Unique | Unique | Integer |  |  |
| MinLevel | MinLevel | MinLevel | Integer |  |  |
| MaxLevel | MaxLevel | MaxLevel | Integer |  |  |
| Comment | Comment |  | Comment |  |  |

## TreasureTable: TreasureTable

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| CanMerge | AppendToParent | CanMerge | Enumeration |  | YesNo |
| MinLevelDiff | MinLevelDiff | MinLevel | Integer |  |  |
| MaxLevelDiff | MaxLevelDiff | MaxLevel | Integer |  |  |
| IgnoreLevelDiff | IgnoreLevelDiff | IgnoreLevelDiff | Enumeration |  | YesNo |
| UseTreasureGroups | UseTreasureGroups | UseTreasureGroups | Enumeration |  | YesNo |
| StartLevel | StartLevel | StartLevel | Integer |  |  |
| EndLevel | EndLevel | EndLevel | Integer |  |  |
| DropCount | DropCount | DropCount | String |  |  |
| ObjectCategory | ObjectCategory | ObjectCategory | String |  |  |
| Frequency | Frequency | Frequency | Integer |  |  |
| Common | Common | Common | Integer |  |  |
| Uncommon | Uncommon | Uncommon | Integer |  |  |
| Rare | Rare | Rare | Integer |  |  |
| Epic | Epic | Epic | Integer |  |  |
| Legendary | Legendary | Legendary | String |  |  |
| Divine | Divine | Divine | Integer |  |  |
| Unique | Unique | Unique | Integer |  |  |
| Comment | Comment | Comment | Comment |  |  |
| Using | Parent | Using | BaseClass |  |  |

## SkillData: SkillSet

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Skills | Skills | Skills | StatReference |  |  |
| Comment | Comment | Comment | Comment |  |  |
| Using | Parent | Using | BaseClass |  |  |

## Equipment: Equipment

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| 1 | 1 | 1 | StatReference |  |  |
| 2 | 2 | 2 | StatReference |  |  |
| 3 | 3 | 3 | StatReference |  |  |
| 4 | 4 | 4 | StatReference |  |  |
| 5 | 5 | 5 | StatReference |  |  |
| 6 | 6 | 6 | StatReference |  |  |
| 7 | 7 | 7 | StatReference |  |  |
| 8 | 8 | 8 | StatReference |  |  |
| 9 | 9 | 9 | StatReference |  |  |
| 10 | 10 | 10 | StatReference |  |  |
| 11 | 11 | 11 | StatReference |  |  |
| 12 | 12 | 12 | StatReference |  |  |
| 13 | 13 | 13 | StatReference |  |  |
| 14 | 14 | 14 | StatReference |  |  |
| 15 | 15 | 15 | StatReference |  |  |
| 16 | 16 | 16 | StatReference |  |  |
| 17 | 17 | 17 | StatReference |  |  |
| 18 | 18 | 18 | StatReference |  |  |
| 19 | 19 | 19 | StatReference |  |  |
| 20 | 20 | 20 | StatReference |  |  |
| Comment | Comment | Comment | Comment |  |  |

## ItemCombos: ItemCombos

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass |  |  |
| RecipeCategory | RecipeCategory | RecipeCategory | Enumeration |  | RecipeCategory |
| CraftingStation | CraftingStation | CraftingStation | Enumeration |  | CraftingStationType |
| Type 1 | Type 1 | Type 1 | Enumeration |  | IngredientType |
| Object 1 | Object 1 | Object 1 | String |  |  |
| Transform 1 | Transform 1 | Transform 1 | Enumeration |  | IngredientTransformType |
| Type 2 | Type 2 | Type 2 | Enumeration |  | IngredientType |
| Object 2 | Object 2 | Object 2 | String |  |  |
| Transform 2 | Transform 2 | Transform 2 | Enumeration |  | IngredientTransformType |
| Type 3 | Type 3 | Type 3 | Enumeration |  | IngredientType |
| Object 3 | Object 3 | Object 3 | String |  |  |
| Transform 3 | Transform 3 | Transform 3 | Enumeration |  | IngredientTransformType |
| Type 4 | Type 4 | Type 4 | Enumeration |  | IngredientType |
| Object 4 | Object 4 | Object 4 | String |  |  |
| Transform 4 | Transform 4 | Transform 4 | Enumeration |  | IngredientTransformType |
| Type 5 | Type 5 | Type 5 | Enumeration |  | IngredientType |
| Object 5 | Object 5 | Object 5 | String |  |  |
| Transform 5 | Transform 5 | Transform 5 | Enumeration |  | IngredientTransformType |
| AutoLevel | AutoLevel | AutoLevel | Integer |  |  |
| Requirement | Requirement | Requirement | String |  |  |
| ReqLevel | ReqLevel | ReqLevel | String |  |  |
| ResultAmount 1 | ResultAmount 1 | ResultAmount 1 | Integer |  |  |
| Result 1 | Result 1 | Result 1 | String |  |  |
| Boost 1 | Boost 1 | Boost 1 | String |  |  |
| ResultAmount 2 | ResultAmount 2 | ResultAmount 2 | Integer |  |  |
| Result 2 | Result 2 | Result 2 | String |  |  |
| Boost 2 | Boost 2 | Boost 2 | String |  |  |
| ResultAmount 3 | ResultAmount 3 | ResultAmount 3 | Integer |  |  |
| Result 3 | Result 3 | Result 3 | String |  |  |
| Boost 3 | Boost 3 | Boost 3 | String |  |  |
| PreviewStatsID | PreviewStatsID | PreviewStatsID | String |  |  |
| PreviewIcon | PreviewIcon | PreviewIcon | String |  |  |
| PreviewTooltip | PreviewTooltip | PreviewTooltip | TranslatedString |  |  |
| Comment | Comment | Comment | Comment |  |  |

## ItemCombos: ItemComboProperties

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| PreviewIcon | PreviewIcon | PreviewIcon | String |  |  |
| PreviewTooltip | PreviewTooltip | PreviewTooltip | TranslatedString |  |  |
| ObjectID | ObjectID | ObjectID | String |  |  |
| Type | Type | Type | String |  |  |
| Result | Result | Result | String |  |  |
| Comment | Comment | Comment | Comment |  |  |
| Using | Parent | Using | BaseClass |  |  |

## ItemCombos: ObjectCategoriesItemComboPreviewData

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Category | Name |  |  |
| Type | Type | ObjectCategories | String |  |  |
| Icon | Icon | Icon | String |  |  |
| Tooltip | Tooltip | Tooltip | TranslatedString |  |  |
| Comment | Comment | Comment | Comment |  |  |

## ItemCombos: CraftingStationsItemComboPreviewData

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Station | Name |  |  |
| Type | Type | CraftingStations | String |  |  |
| StatsID | StatsID | StatsID | String |  |  |
| Icon | Icon | Icon | String |  |  |
| Tooltip | Tooltip | Tooltip | TranslatedString |  |  |
| Comment | Comment | Comment | Comment |  |  |

## ItemProgression: ItemProgressionVisuals

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | ItemGroup | Name |  |  |
| MinLevel | MinLevel | MinLevel | Integer |  |  |
| MaxLevel | MaxLevel | MaxLevel | Integer |  |  |
| Rarity | Rarity | Rarity | String |  |  |
| RootTemplate | RootTemplate | RootTemplate | RootTemplate |  |  |
| ItemColor | ItemColor | ItemColor | String |  |  |
| NameGroup | NameGroup | NameGroup | String |  |  |
| AffixType | AffixType | AffixType | String |  |  |
| Icon | Icon | Icon | String |  |  |
| Comment | Comment |  | Comment |  |  |
| Using | Parent | Using | BaseClass |  |  |

## ExtraData: Requirements

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Key | Name |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| Comment | Comment |  | Comment |  |  |

## Crimes: Crimes

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | CrimeType | Name |  |  |
| TensionWeight | TensionWeight | TensionWeight | Integer |  |  |
| Lifetime | Lifetime | Lifetime | Integer |  |  |
| DetectionRange | DetectionRange | DetectionRange | Integer |  |  |
| AudibleRange | AudibleRange | AudibleRange | Integer |  |  |
| Audible | Audible | Audible | Enumeration |  | YesNo |
| Continuous | Continuous | Continuous | Enumeration |  | YesNo |
| ContinuousDelayTimer | ContinuousDelayTimer | ContinuousDelayTimer | Integer |  |  |
| CreatesCrimescene | CreatesCrimescene | CreatesCrimescene | Enumeration |  | YesNo |
| CanRaiseAlarm | CanRaiseAlarm | CanRaiseAlarm | Enumeration |  | YesNo |
| CanMerge | CanMerge | CanMerge | Enumeration |  | YesNo |
| MaxInvestigators | MaxInvestigators | MaxInvestigators | Integer |  |  |
| InterrogateDialog | InterrogateDialog | InterrogateDialog | String |  |  |
| SoundEvent | SoundEvent | SoundEvent | String |  |  |
| ReactionCategory_Tag | ReactionCategory_Tag | ReactionCategory_Tag | String |  |  |
| Tension | Tension | Tension | String |  |  |
| Priority | Priority | Priority | String |  |  |
| DisableInvestigate | DisableInvestigate | DisableInvestigate | String |  |  |
| StopsAndInterruptsCrimes | StopsAndInterruptsCrimes | StopsAndInterruptsCrimes | String |  |  |
| VictimReaction | VictimReaction | VictimReaction | String |  |  |
| VictimDialog | VictimDialog | VictimDialog | String |  |  |
| Dialog | Dialog | Dialog | String |  |  |
| PrimarySensibleAction | PrimarySensibleAction | PrimarySensibleAction | String |  |  |
| SecondarySensibleAction | SecondarySensibleAction | SecondarySensibleAction | String |  |  |
| NoticedAD | NoticedAD | NoticedAD | String |  |  |
| Comment | Comment |  | Comment |  |  |
| Using | Parent | Using | BaseClass |  |  |

## TreasureTable: TreasureGroups

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | ObjectCategory | Name |  |  |
| TreasureGroup | TreasureGroup | TreasureGroup | String |  |  |
| WeaponTreasureGroup | WeaponTreasureGroup | WeaponTreasureGroup | String |  |  |
| WeaponDefaultCounter | WeaponDefaultCounter | WeaponDefaultCounter | Integer |  |  |
| SkillbookTreasureGroup | SkillbookTreasureGroup | SkillbookTreasureGroup | String |  |  |
| SkillbookDefaultCounter | SkillbookDefaultCounter | SkillbookDefaultCounter | Integer |  |  |
| ArmorTreasureGroup | ArmorTreasureGroup | ArmorTreasureGroup | String |  |  |
| ArmorDefaultCounter | ArmorDefaultCounter | ArmorDefaultCounter | Integer |  |  |
| Comment | Comment |  | Comment |  |  |

## DeltaModifier: DeltaModifier

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| BoostType | BoostType | BoostType | String |  |  |
| MinLevel | MinLevel | MinLevel | Integer |  |  |
| MaxLevel | MaxLevel | MaxLevel | Integer |  |  |
| Frequency | Frequency | Frequency | Integer |  |  |
| ModifierType | ModifierType | ModifierType | String |  |  |
| SlotType | SlotType | SlotType | String |  |  |
| ArmorType | ArmorType | ArmorType | String |  |  |
| WeaponType | WeaponType | WeaponType | String |  |  |
| Handedness | Handedness | Handedness | Integer |  |  |
| Boost | Boost | Boost | String |  |  |
| Multiplier | Multiplier | Multiplier | Integer |  |  |
| Comment | Comment |  | Comment |  |  |
| Using | Parent | Using | BaseClass |  |  |

## ItemColor: ItemColor

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | ItemColor | Name |  |  |
| Primary Color | Primary Color | Primary Color | Color |  |  |
| Secondary Color | Secondary Color | Secondary Color | Color |  |  |
| Tertiary Color | Tertiary Color | Tertiary Color | Color |  |  |
| Comment | Comment |  | Comment |  |  |

## ItemProgression: ItemProgressionNames

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | NameGroup | Name |  |  |
| ItemName | ItemName | ItemName | TranslatedString |  |  |
| NameCool | NameCool | NameCool | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| Comment | Comment |  | Comment |  |  |
| Using | Parent | Using | BaseClass |  |  |

## ExtraData: Data

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Key | Name |  |  |
| Value | Value | Value | Float |  |  |
| Comment | Comment |  | Comment |  |  |

## ItemTypes: ItemTypes

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | ItemType | Name |  |  |
| Color | Color | Color | String |  |  |
| OverlayTexture | OverlayTexture | OverlayTexture | String |  |  |
| ValueMultiplier | ValueMultiplier | ValueMultiplier | Float |  |  |
| FirstItemTypeShift | FirstItemTypeShift | FirstItemTypeShift | String |  |  |
| SecondItemTypeShift | SecondItemTypeShift | SecondItemTypeShift | String |  |  |
| UIBorderID | UIBorderID | UIBorderID | String |  |  |
| MinLevel | MinLevel | MinLevel | Integer |  |  |
| RowChance | RowChance | RowChance | Integer |  |  |
| BoostTypes | BoostTypes | BoostTypes | String |  |  |
| BoostType 2 | BoostType 2 | BoostType 2 | String |  |  |
| BoostType 3 | BoostType 3 | BoostType 3 | String |  |  |
| BoostType 4 | BoostType 4 | BoostType 4 | String |  |  |
| BoostType 5 | BoostType 5 | BoostType 5 | String |  |  |
| BoostType 6 | BoostType 6 | BoostType 6 | String |  |  |
| BoostType 7 | BoostType 7 | BoostType 7 | String |  |  |
| BoostType 8 | BoostType 8 | BoostType 8 | String |  |  |
| BoostType 9 | BoostType 9 | BoostType 9 | String |  |  |
| BoostType 10 | BoostType 10 | BoostType 10 | String |  |  |
| BoostType 11 | BoostType 11 | BoostType 11 | String |  |  |
| BoostType 12 | BoostType 12 | BoostType 12 | String |  |  |
| Comment | Comment |  | Comment |  |  |
| Using | Parent | Using | BaseClass |  |  |

## SkillData: Projectile

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| AddRangeFromAbility | AddRangeFromAbility | AddRangeFromAbility | Enumeration |  | Ability |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| ExplodeRadius | ExplodeRadius | ExplodeRadius | Integer |  |  |
| CanTargetCharacters | CanTargetCharacters | CanTargetCharacters | Enumeration |  | YesNo |
| CanTargetItems | CanTargetItems | CanTargetItems | Enumeration |  | YesNo |
| CanTargetTerrain | CanTargetTerrain | CanTargetTerrain | Enumeration |  | YesNo |
| ForceTarget | ForceTarget | ForceTarget | Enumeration |  | YesNo |
| AmountOfTargets | AmountOfTargets | AmountOfTargets | Integer |  |  |
| AutoAim | AutoAim | AutoAim | Enumeration |  | YesNo |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| ForkingConditions | ForkingConditions | ForkingConditions | String |  |  |
| UseCharacterStats | UseCharacterStats | UseCharacterStats | Enumeration |  | YesNo |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| ProjectileCount | ProjectileCount | ProjectileCount | Integer |  |  |
| ProjectileDelay | ProjectileDelay | ProjectileDelay | Integer |  |  |
| Angle | Angle | Angle | Integer |  |  |
| Template | Template | Template | String |  |  |
| IgnoreVisionBlock | IgnoreVisionBlock | IgnoreVisionBlock | Enumeration |  | YesNo |
| TemplateCheck | TemplateCheck | TemplateCheck | Enumeration |  | CastCheckType |
| ChanceToPierce | ChanceToPierce | ChanceToPierce | Integer |  |  |
| MaxPierceCount | MaxPierceCount | MaxPierceCount | Integer |  |  |
| MaxForkCount | MaxForkCount | MaxForkCount | Integer |  |  |
| ForkLevels | ForkLevels | ForkLevels | Integer |  |  |
| ForkChance | ForkChance | ForkChance | Integer |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastAnimationCheck | CastAnimationCheck | CastAnimationCheck | Enumeration |  | CastCheckType |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| PreviewEffect | PreviewEffect | PreviewEffect | String |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| DivideDamage | DivideDamage | DivideDamage | Enumeration |  | YesNo |
| ProjectileTerrainOffset | ProjectileTerrainOffset | ProjectileTerrainOffset | Enumeration |  | YesNo |
| MovingObject | MovingObject | MovingObject | String |  |  |
| ProjectileType | ProjectileType | ProjectileType | Enumeration |  | ProjectileType |
| OverrideMinAP | OverrideMinAP | OverrideMinAP | Enumeration |  | YesNo |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| Stealth Damage Multiplier | Stealth Damage Multiplier | Stealth Damage Multiplier | Integer |  |  |
| Distance Damage Multiplier | Distance Damage Multiplier | Distance Damage Multiplier | Integer |  |  |
| HeightOffset | HeightOffset | HeightOffset | Integer |  |  |
| SpawnObject | SpawnObject | SpawnObject | String |  |  |
| SpawnEffect | SpawnEffect | SpawnEffect | String |  |  |
| SpawnFXOverridesImpactFX | SpawnFXOverridesImpactFX | SpawnFXOverridesImpactFX | Enumeration |  | YesNo |
| SpawnLifetime | SpawnLifetime | SpawnLifetime | Integer |  |  |
| AiCalculationSkillOverride | AiCalculationSkillOverride | AiCalculationSkillOverride | String |  |  |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: ProjectileStrike

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| AddRangeFromAbility | AddRangeFromAbility | AddRangeFromAbility | Enumeration |  | Ability |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| ExplodeRadius | ExplodeRadius | ExplodeRadius | Integer |  |  |
| StrikeCount | StrikeCount | StrikeCount | Integer |  |  |
| StrikeDelay | StrikeDelay | StrikeDelay | Integer |  |  |
| CanTargetCharacters | CanTargetCharacters | CanTargetCharacters | Enumeration |  | YesNo |
| CanTargetItems | CanTargetItems | CanTargetItems | Enumeration |  | YesNo |
| CanTargetTerrain | CanTargetTerrain | CanTargetTerrain | Enumeration |  | YesNo |
| ForceTarget | ForceTarget | ForceTarget | Enumeration |  | YesNo |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| OverrideSkillLevel | OverrideSkillLevel | OverrideSkillLevel | Enumeration |  | YesNo |
| UseCharacterStats | UseCharacterStats | UseCharacterStats | Enumeration |  | YesNo |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| TargetProjectiles | TargetProjectiles | TargetProjectiles | Enumeration |  | YesNo |
| ProjectileCount | ProjectileCount | ProjectileCount | Integer |  |  |
| ProjectileDelay | ProjectileDelay | ProjectileDelay | Integer |  |  |
| Angle | Angle | Angle | Integer |  |  |
| Height | Height | Height | Integer |  |  |
| SingleSource | SingleSource | SingleSource | Enumeration |  | YesNo |
| Template | Template | Template | String |  |  |
| MaxForkCount | MaxForkCount | MaxForkCount | Integer |  |  |
| ForkLevels | ForkLevels | ForkLevels | Integer |  |  |
| ForkChance | ForkChance | ForkChance | Integer |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| PreviewEffect | PreviewEffect | PreviewEffect | String |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| ProjectileType | ProjectileType | ProjectileType | Enumeration |  | ProjectileType |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| Distribution | Distribution | Distribution | Enumeration |  | ProjectileDistribution |
| Shuffle | Shuffle | Shuffle | Enumeration |  | YesNo |
| PreviewStrikeHits | PreviewStrikeHits | PreviewStrikeHits | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Target

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| AddWeaponRange | AddWeaponRange | AddWeaponRange | Enumeration |  | YesNo |
| IsMelee | IsMelee | IsMelee | Enumeration |  | YesNo |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| CanTargetCharacters | CanTargetCharacters | CanTargetCharacters | Enumeration |  | YesNo |
| CanTargetItems | CanTargetItems | CanTargetItems | Enumeration |  | YesNo |
| CanTargetTerrain | CanTargetTerrain | CanTargetTerrain | Enumeration |  | YesNo |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| AoEConditions | AoEConditions | AoEConditions | String |  |  |
| UseCharacterStats | UseCharacterStats | UseCharacterStats | Enumeration |  | YesNo |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastSelfAnimation | CastSelfAnimation | CastSelfAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| PreviewEffect | PreviewEffect | PreviewEffect | String |  |  |
| WeaponBones | WeaponBones | WeaponBones | String |  |  |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| TargetGroundEffect | TargetGroundEffect | TargetGroundEffect | String |  |  |
| PositionEffect | PositionEffect | PositionEffect | String |  |  |
| BeamEffect | BeamEffect | BeamEffect | String |  |  |
| SkillEffect | SkillEffect | SkillEffect | String |  |  |
| CleanseStatuses | CleanseStatuses | CleanseStatuses | String |  |  |
| StatusClearChance | StatusClearChance | StatusClearChance | Integer |  |  |
| Autocast | Autocast | Autocast | Enumeration |  | YesNo |
| IgnoreVisionBlock | IgnoreVisionBlock | IgnoreVisionBlock | Enumeration |  | YesNo |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| Stealth Damage Multiplier | Stealth Damage Multiplier | Stealth Damage Multiplier | Integer |  |  |
| OverrideMinAP | OverrideMinAP | OverrideMinAP | Enumeration |  | YesNo |
| AmountOfTargets | AmountOfTargets | AmountOfTargets | Integer |  |  |
| AiCalculationSkillOverride | AiCalculationSkillOverride | AiCalculationSkillOverride | String |  |  |
| IgnoreHeight | IgnoreHeight | IgnoreHeight | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Cone

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| Range | Range | Range | Integer |  |  |
| Angle | Angle | Angle | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| SurfaceType | SurfaceType | SurfaceType | Enumeration |  | Surface Type |
| IgnoreCursed | IgnoreCursed | IgnoreCursed | Enumeration |  | YesNo |
| SurfaceLifetime | SurfaceLifetime | SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | SurfaceStatusChance | SurfaceStatusChance | Integer |  |  |
| SurfaceGrowStep | SurfaceGrowStep | SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | SurfaceGrowInterval | SurfaceGrowInterval | Integer |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| CanTargetCharacters | CanTargetCharacters | CanTargetCharacters | Enumeration |  | YesNo |
| CanTargetItems | CanTargetItems | CanTargetItems | Enumeration |  | YesNo |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| PushDistance | PushDistance | PushDistance | Integer |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| BackStart | BackStart | BackStart | Integer |  |  |
| FrontOffset | FrontOffset | FrontOffset | Integer |  |  |
| OverrideMinAP | OverrideMinAP | OverrideMinAP | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Zone

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| SurfaceType | SurfaceType | SurfaceType | Enumeration |  | Surface Type |
| IgnoreCursed | IgnoreCursed | IgnoreCursed | Enumeration |  | YesNo |
| SurfaceLifetime | SurfaceLifetime | SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | SurfaceStatusChance | SurfaceStatusChance | Integer |  |  |
| SurfaceGrowStep | SurfaceGrowStep | SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | SurfaceGrowInterval | SurfaceGrowInterval | Integer |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| CanTargetCharacters | CanTargetCharacters | CanTargetCharacters | Enumeration |  | YesNo |
| CanTargetItems | CanTargetItems | CanTargetItems | Enumeration |  | YesNo |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| PushDistance | PushDistance | PushDistance | Integer |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| Shape | Shape | Shape | String |  |  |
| BackStart | BackStart | BackStart | Integer |  |  |
| FrontOffset | FrontOffset | FrontOffset | Integer |  |  |
| Range | Range | Range | Integer |  |  |
| Base | Base | Base | Integer |  |  |
| Angle | Angle | Angle | Integer |  |  |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: MultiStrike

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| MaxAttacks | MaxAttacks | MaxAttacks | Integer |  |  |
| NextAttackChance | NextAttackChance | NextAttackChance | Integer |  |  |
| NextAttackChanceDivider | NextAttackChanceDivider | NextAttackChanceDivider | Integer |  |  |
| EndPosRadius | EndPosRadius | EndPosRadius | Integer |  |  |
| JumpDelay | JumpDelay | JumpDelay | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| PrepareEffectBone | PrepareEffectBone | PrepareEffectBone | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| MaleImpactEffects | MaleImpactEffects | MaleImpactEffects | String |  |  |
| FemaleImpactEffects | FemaleImpactEffects | FemaleImpactEffects | String |  |  |
| ReappearEffect | ReappearEffect | ReappearEffect | String |  |  |
| ReappearEffectTextEvent | ReappearEffectTextEvent | ReappearEffectTextEvent | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| OverrideMinAP | OverrideMinAP | OverrideMinAP | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Quake

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TotalSurfaceCells | TotalSurfaceCells | TotalSurfaceCells | Integer |  |  |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| OverrideSkillLevel | OverrideSkillLevel | OverrideSkillLevel | Enumeration |  | YesNo |
| SurfaceMinSpawnRadius | SurfaceMinSpawnRadius | SurfaceMinSpawnRadius | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| ShockWaveDuration | ShockWaveDuration | ShockWaveDuration | Integer |  |  |
| MinSurfaces | MinSurfaces | MinSurfaces | Integer |  |  |
| MaxSurfaces | MaxSurfaces | MaxSurfaces | Integer |  |  |
| SurfaceType | SurfaceType | SurfaceType | Enumeration |  | Surface Type |
| SurfaceGrowStep | SurfaceGrowStep | SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | SurfaceGrowInterval | SurfaceGrowInterval | Integer |  |  |
| SurfaceLifetime | SurfaceLifetime | SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | SurfaceStatusChance | SurfaceStatusChance | Integer |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| LandingEffect | LandingEffect | LandingEffect | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Skillbook | Skillbook | Skillbook | String |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Storm

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| OverrideSkillLevel | OverrideSkillLevel | OverrideSkillLevel | Enumeration |  | YesNo |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| HitRadius | HitRadius | HitRadius | Integer |  |  |
| Lifetime | Lifetime | Lifetime | Integer |  |  |
| MinHitsPerTurn | MinHitsPerTurn | MinHitsPerTurn | Integer |  |  |
| MaxHitsPerTurn | MaxHitsPerTurn | MaxHitsPerTurn | Integer |  |  |
| HitDelay | HitDelay | HitDelay | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| StormEffect | StormEffect | StormEffect | String |  |  |
| ImpactEffect | ImpactEffect | ImpactEffect | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Skillbook | Skillbook | Skillbook | String |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| ProjectileSkills | ProjectileSkills | ProjectileSkills | String |  |  |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Rush

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| HitRadius | HitRadius | HitRadius | Integer |  |  |
| CanTargetCharacters | CanTargetCharacters | CanTargetCharacters | Enumeration |  | YesNo |
| CanTargetItems | CanTargetItems | CanTargetItems | Enumeration |  | YesNo |
| CanTargetTerrain | CanTargetTerrain | CanTargetTerrain | Enumeration |  | YesNo |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| UseCharacterStats | UseCharacterStats | UseCharacterStats | Enumeration |  | YesNo |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| ContinueOnKill | ContinueOnKill | ContinueOnKill | Enumeration |  | YesNo |
| ContinueEffect | ContinueEffect | ContinueEffect | String |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| WeaponBones | WeaponBones | WeaponBones | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| TargetCastEffect | TargetCastEffect | TargetCastEffect | String |  |  |
| TargetHitEffect | TargetHitEffect | TargetHitEffect | String |  |  |
| StartTextEvent | StartTextEvent | StartTextEvent | String |  |  |
| StopTextEvent | StopTextEvent | StopTextEvent | String |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| OverrideMinAP | OverrideMinAP | OverrideMinAP | Enumeration |  | YesNo |
| SurfaceType | SurfaceType | SurfaceType | Enumeration |  | Surface Type |
| SurfaceRadius | SurfaceRadius | SurfaceRadius | Integer |  |  |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Jump

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| HitRadius | HitRadius | HitRadius | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| Damage On Jump | Damage On Jump | Damage On Jump | Enumeration |  | YesNo |
| Damage On Landing | Damage On Landing | Damage On Landing | Enumeration |  | YesNo |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| TeleportTextEvent | TeleportTextEvent | TeleportTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| PreviewEffect | PreviewEffect | PreviewEffect | String |  |  |
| LandingEffect | LandingEffect | LandingEffect | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Tornado

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| HitRadius | HitRadius | HitRadius | Integer |  |  |
| RandomPoints | RandomPoints | RandomPoints | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| SurfaceType | SurfaceType | SurfaceType | Enumeration |  | Surface Type |
| SurfaceRadius | SurfaceRadius | SurfaceRadius | Integer |  |  |
| SurfaceLifetime | SurfaceLifetime | SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | SurfaceStatusChance | SurfaceStatusChance | Integer |  |  |
| PointsMaxOffset | PointsMaxOffset | PointsMaxOffset | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| CleanseStatuses | CleanseStatuses | CleanseStatuses | String |  |  |
| StatusClearChance | StatusClearChance | StatusClearChance | Integer |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Wall

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| MaxDistance | MaxDistance | MaxDistance | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| Lifetime | Lifetime | Lifetime | Integer |  |  |
| GrowSpeed | GrowSpeed | GrowSpeed | Integer |  |  |
| GrowTimeout | GrowTimeout | GrowTimeout | Integer |  |  |
| SurfaceType | SurfaceType | SurfaceType | Enumeration |  | Surface Type |
| TotalSurfaceCells | TotalSurfaceCells | TotalSurfaceCells | Integer |  |  |
| SurfaceGrowStep | SurfaceGrowStep | SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | SurfaceGrowInterval | SurfaceGrowInterval | Integer |  |  |
| SurfaceLifetime | SurfaceLifetime | SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | SurfaceStatusChance | SurfaceStatusChance | Integer |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| SourceTargetEffect | SourceTargetEffect | SourceTargetEffect | String |  |  |
| TargetTargetEffect | TargetTargetEffect | TargetTargetEffect | String |  |  |
| Template1 | Template1 | Template1 | String |  |  |
| Template2 | Template2 | Template2 | String |  |  |
| Template3 | Template3 | Template3 | String |  |  |
| SpawnEffect | SpawnEffect | SpawnEffect | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| PreviewEffect | PreviewEffect | PreviewEffect | String |  |  |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Teleportation

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| HitRadius | HitRadius | HitRadius | Integer |  |  |
| Height | Height | Height | Integer |  |  |
| Acceleration | Acceleration | Acceleration | Integer |  |  |
| TeleportDelay | TeleportDelay | TeleportDelay | Integer |  |  |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| TeleportSelf | TeleportSelf | TeleportSelf | Enumeration |  | YesNo |
| TeleportSurface | TeleportSurface | TeleportSurface | Enumeration |  | YesNo |
| CanTargetCharacters | CanTargetCharacters | CanTargetCharacters | Enumeration |  | YesNo |
| CanTargetItems | CanTargetItems | CanTargetItems | Enumeration |  | YesNo |
| CanTargetTerrain | CanTargetTerrain | CanTargetTerrain | Enumeration |  | YesNo |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| PreviewEffect | PreviewEffect | PreviewEffect | String |  |  |
| SelectedCharacterEffect | SelectedCharacterEffect | SelectedCharacterEffect | String |  |  |
| SelectedObjectEffect | SelectedObjectEffect | SelectedObjectEffect | String |  |  |
| SelectedPositionEffect | SelectedPositionEffect | SelectedPositionEffect | String |  |  |
| DisappearEffect | DisappearEffect | DisappearEffect | String |  |  |
| ReappearEffect | ReappearEffect | ReappearEffect | String |  |  |
| ImpactEffect | ImpactEffect | ImpactEffect | String |  |  |
| IgnoreVisionBlock | IgnoreVisionBlock | IgnoreVisionBlock | Enumeration |  | YesNo |
| ForceMove | ForceMove | ForceMove | Enumeration |  | YesNo |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| OverrideSkillLevel | OverrideSkillLevel | OverrideSkillLevel | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Path

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| SurfaceType | SurfaceType | SurfaceType | Enumeration |  | Surface Type |
| SurfaceRadius | SurfaceRadius | SurfaceRadius | Integer |  |  |
| SurfaceLifetime | SurfaceLifetime | SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | SurfaceStatusChance | SurfaceStatusChance | Integer |  |  |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| MaxDistance | MaxDistance | MaxDistance | Integer |  |  |
| Offset | Offset | Offset | Integer |  |  |
| HitRadius | HitRadius | HitRadius | Integer |  |  |
| Height | Height | Height | Integer |  |  |
| TravelSpeed | TravelSpeed | TravelSpeed | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| FlyEffect | FlyEffect | FlyEffect | String |  |  |
| ImpactEffect | ImpactEffect | ImpactEffect | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Skillbook | Skillbook | Skillbook | String |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Rain

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Lifetime | Lifetime | Lifetime | Integer |  |  |
| SurfaceType | SurfaceType | SurfaceType | Enumeration |  | Surface Type |
| SurfaceLifetime | SurfaceLifetime | SurfaceLifetime | Integer |  |  |
| SurfaceStatusChance | SurfaceStatusChance | SurfaceStatusChance | Integer |  |  |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | Qualifier |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| UseCharacterStats | UseCharacterStats | UseCharacterStats | Enumeration |  | YesNo |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| TotalSurfaceCells | TotalSurfaceCells | TotalSurfaceCells | Integer |  |  |
| SurfaceGrowStep | SurfaceGrowStep | SurfaceGrowStep | Integer |  |  |
| SurfaceGrowInterval | SurfaceGrowInterval | SurfaceGrowInterval | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| RainEffect | RainEffect | RainEffect | String |  |  |
| Atmosphere | Atmosphere | Atmosphere | Enumeration |  | AtmosphereType |
| ConsequencesStartTime | ConsequencesStartTime | ConsequencesStartTime | Integer |  |  |
| ConsequencesDuration | ConsequencesDuration | ConsequencesDuration | Integer |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| AiCalculationSkillOverride | AiCalculationSkillOverride | AiCalculationSkillOverride | String |  |  |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Summon

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Lifetime | Lifetime | Lifetime | Integer |  |  |
| SummonLevel | SummonLevel | SummonLevel | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| AoEConditions | AoEConditions | AoEConditions | String |  |  |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| Template | Template | Template | String |  |  |
| TemplateAdvanced | TemplateAdvanced | TemplateAdvanced | String |  |  |
| TemplateOverride | TemplateOverride | TemplateOverride | String |  |  |
| Totem | Totem | Totem | Enumeration |  | YesNo |
| LinkTeleports | LinkTeleports | LinkTeleports | Enumeration |  | YesNo |
| TeleportsUseCount | TeleportUseCount | TeleportsUseCount | Integer |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| SummonCount | SummonCount | SummonCount | Integer |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| TargetCastEffect | TargetCastEffect | TargetCastEffect | String |  |  |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| Skillbook | Skillbook | Skillbook | String |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| AiCalculationSkillOverride | AiCalculationSkillOverride | AiCalculationSkillOverride | String |  |  |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Shout

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Damage | Damage | Damage | Enumeration | Enter an integer that corresponds to DamageSourceType enum and defines which damage curve to pick. E.g. 1 is average player damage. | DamageSourceType |
| Damage Multiplier | Damage Multiplier | Damage Multiplier | Integer | Enter a positive percentage value. It will modify base damage. 100(%) for average damage. |  |
| Damage Range | Damage Range | Damage Range | Integer | Enter a positive percentage value. Base damage will be randomized in (base - halfRange,base + halfRange) interval. |  |
| DamageType | DamageType | DamageType | Enumeration |  | Damage Type |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| AddWeaponRange | AddWeaponRange | AddWeaponRange | Enumeration |  | YesNo |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| AoEConditions | AoEConditions | AoEConditions | String |  |  |
| UseCharacterStats | UseCharacterStats | UseCharacterStats | Enumeration |  | YesNo |
| UseWeaponDamage | UseWeaponDamage | UseWeaponDamage | Enumeration |  | YesNo |
| UseWeaponProperties | UseWeaponProperties | UseWeaponProperties | Enumeration |  | YesNo |
| Autocast | Autocast | Autocast | Enumeration |  | YesNo |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| HitEffect | HitEffect | HitEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| WeaponBones | WeaponBones | WeaponBones | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| CleanseStatuses | CleanseStatuses | CleanseStatuses | String |  |  |
| StatusClearChance | StatusClearChance | StatusClearChance | Integer |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| PushDistance | PushDistance | PushDistance | Integer |  |  |
| CanTargetCharacters | CanTargetCharacters | CanTargetCharacters | Enumeration |  | YesNo |
| CanTargetItems | CanTargetItems | CanTargetItems | Enumeration |  | YesNo |
| PushPullEffect | PushPullEffect | PushPullEffect | String |  |  |
| IgnoreVisionBlock | IgnoreVisionBlock | IgnoreVisionBlock | Enumeration |  | YesNo |
| AiCalculationSkillOverride | AiCalculationSkillOverride | AiCalculationSkillOverride | String |  |  |
| IgnoreSilence | IgnoreSilence | IgnoreSilence | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## SkillData: Dome

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| Level | Level | Level | Integer |  |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| IsEnemySkill | IsEnemySkill | IsEnemySkill | Enumeration |  | YesNo |
| Ability | Ability | Ability | Enumeration |  | SkillAbility |
| Tier | Tier | Tier | Enumeration |  | SkillTier |
| Requirement | Requirement | Requirement | Enumeration |  | SkillRequirement |
| ActionPoints | ActionPoints | ActionPoints | Integer |  |  |
| Cooldown | Cooldown | Cooldown | Integer |  |  |
| AIFlags | AIFlags | AIFlags | Enumeration |  | AIFlags |
| Lifetime | Lifetime | Lifetime | Integer |  |  |
| SkillProperties | SkillProperties | SkillProperties | String |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| TargetRadius | TargetRadius | TargetRadius | Integer |  |  |
| UseCharacterStats | UseCharacterStats | UseCharacterStats | Enumeration |  | YesNo |
| AreaRadius | AreaRadius | AreaRadius | Integer |  |  |
| Requirements | Requirements | Requirements | String |  |  |
| MemorizationRequirements | MemorizationRequirements | MemorizationRequirements | String |  |  |
| Icon | Icon | Icon | String |  |  |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| StatsDescription | StatsDescription | StatsDescription | TranslatedString |  |  |
| StatsDescriptionParams | StatsDescriptionParams | StatsDescriptionParams | String |  |  |
| FXScale | FXScale | FXScale | Integer |  |  |
| PrepareAnimationInit | PrepareAnimationInit | PrepareAnimationInit | String |  |  |
| PrepareAnimationLoop | PrepareAnimationLoop | PrepareAnimationLoop | String |  |  |
| PrepareEffect | PrepareEffect | PrepareEffect | String |  |  |
| CastAnimation | CastAnimation | CastAnimation | String |  |  |
| CastTextEvent | CastTextEvent | CastTextEvent | String |  |  |
| CastEffect | CastEffect | CastEffect | String |  |  |
| CastEffectTextEvent | CastEffectTextEvent | CastEffectTextEvent | String |  |  |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| Memory Cost | Memory Cost | Memory Cost | Integer |  |  |
| Magic Cost | Magic Cost | Magic Cost | Integer |  |  |
| DomeEffect | DomeEffect | DomeEffect | String |  |  |
| Stealth | Stealth | Stealth | Enumeration |  | YesNo |
| CycleConditions | CycleConditions | CycleConditions | String |  |  |

## StatusData: Status_CONSUME

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |
| WeaponOverride | WeaponOverride | WeaponOverride | String |  |  |
| ResetCooldowns | ResetCooldowns | ResetCooldowns | String |  |  |
| ResetOncePerCombat | ResetOncePerCombat | ResetOncePerCombat | Enumeration |  | YesNo |
| ScaleWithVitality | ScaleWithVitality | ScaleWithVitality | Enumeration |  | YesNo |
| LeaveAction | LeaveAction | LeaveAction | String |  |  |
| DieAction | DieAction | DieAction | String |  |  |
| ForceStackOverwrite | ForceStackOverwrite | ForceStackOverwrite | Enumeration |  | YesNo |
| Toggle | Toggle | Toggle | Enumeration |  | YesNo |

## StatusData: Status_DAMAGE

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| DamageEvent | DamageEvent | DamageEvent | Enumeration |  | StatusEvent |
| DamageStats | DamageStats | DamageStats | String |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| DamageCharacters | DamageCharacters | DamageCharacters | Enumeration |  | YesNo |
| DamageItems | DamageItems | DamageItems | Enumeration |  | YesNo |
| DamageTorches | DamageTorches | DamageTorches | Enumeration |  | YesNo |
| PermanentOnTorch | PermanentOnTorch | PermanentOnTorch | Enumeration |  | YesNo |
| SpawnBlood | SpawnBlood | SpawnBlood | Enumeration |  | YesNo |
| ScaleWithVitality | ScaleWithVitality | ScaleWithVitality | Enumeration |  | YesNo |
| TickSFX | TickSFX | TickSFX | String |  |  |

## StatusData: Status_HEAL

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| HealStat | HealStat | HealStat | Enumeration |  | StatusHealType |
| HealType | HealType | HealType | Enumeration |  | HealValueType |
| HealValue | HealValue | HealValue | Integer |  |  |
| AbsorbSurfaceType | AbsorbSurfaceType | AbsorbSurfaceType | String |  |  |
| AbsorbSurfaceRange | AbsorbSurfaceRange | AbsorbSurfaceRange | Integer |  |  |
| BonusFromAbility | BonusFromAbility | BonusFromAbility | Enumeration |  | Ability |
| HealEffectId | HealEffectId | HealEffectId | String |  |  |
| VampirismType | VampirismType | VampirismType | Enumeration |  | VampirismType |
| Necromantic | Necromantic | Necromantic | Enumeration |  | YesNo |

## StatusData: Status_HEALING

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| OverrideDefaultDescription | OverrideDefaultDescription | OverrideDefaultDescription | Enumeration |  | YesNo |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| HealingEvent | HealingEvent | HealingEvent | Enumeration |  | StatusEvent |
| HealStat | HealStat | HealStat | Enumeration |  | StatusHealType |
| HealType | HealType | HealType | Enumeration |  | HealValueType |
| HealValue | HealValue | HealValue | Integer |  |  |
| SkipInitialEffect | SkipInitialEffect | SkipInitialEffect | Enumeration |  | YesNo |
| AbsorbSurfaceType | AbsorbSurfaceType | AbsorbSurfaceType | String |  |  |
| AbsorbSurfaceRange | AbsorbSurfaceRange | AbsorbSurfaceRange | Integer |  |  |
| HealEffectId | HealEffectId | HealEffectId | String |  |  |
| Necromantic | Necromantic | Necromantic | Enumeration |  | YesNo |

## StatusData: Status_FEAR

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

## StatusData: Status_POLYMORPHED

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| PolymorphResult | PolymorphResult | PolymorphResult | String |  |  |
| DisableInteractions | DisableInteractions | DisableInteractions | Enumeration |  | YesNo |
| AiCalculationSkillOverride | AiCalculationSkillOverride | AiCalculationSkillOverride | String |  |  |
| Toggle | Toggle | Toggle | Enumeration |  | YesNo |
| RetainSkills | RetainSkills | RetainSkills | String |  |  |

## StatusData: Status_KNOCKED_DOWN

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Instant | Instant | Instant | Enumeration |  | YesNo |

## StatusData: Status_STANCE

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

## StatusData: Status_INCAPACITATED

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| FreezeTime | FreezeTime | FreezeTime | Integer |  |  |
| ApplyStatusOnTick | ApplyStatusOnTick | ApplyStatusOnTick | String |  |  |

## StatusData: Status_BLIND

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

## StatusData: Status_GUARDIAN_ANGEL

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| DamagePercentage | DamagePercentage | DamagePercentage | Integer |  |  |

## StatusData: Status_DAMAGE_ON_MOVE

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| DamageEvent | DamageEvent | DamageEvent | Enumeration |  | StatusEvent |
| DamageStats | DamageStats | DamageStats | String |  |  |
| DeathType | DeathType | DeathType | Enumeration |  | Death Type |
| DamageCharacters | DamageCharacters | DamageCharacters | Enumeration |  | YesNo |
| DamageItems | DamageItems | DamageItems | Enumeration |  | YesNo |
| DamageTorches | DamageTorches | DamageTorches | Enumeration |  | YesNo |
| PermanentOnTorch | PermanentOnTorch | PermanentOnTorch | Enumeration |  | YesNo |
| SpawnBlood | SpawnBlood | SpawnBlood | Enumeration |  | YesNo |
| TickSFX | TickSFX | TickSFX | String |  |  |

## StatusData: Status_DEMONIC_BARGAIN

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

## StatusData: Status_CHALLENGE

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| DescriptionCaster | DescriptionCaster | DescriptionCaster | String |  |  |
| DescriptionTarget | DescriptionTarget | DescriptionTarget | String |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| WinBoost | WinBoost | WinBoost | String |  |  |
| LoseBoost | LoseBoost | LoseBoost | String |  |  |

## StatusData: Status_FLOATING

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |
| OnlyWhileMoving | OnlyWhileMoving | OnlyWhileMoving | Enumeration |  | YesNo |

## StatusData: Status_THROWN

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |

## StatusData: Status_DISARMED

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

## StatusData: Status_HEAL_SHARING

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

## StatusData: Status_HEAL_SHARING_CASTER

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| BeamEffect | BeamEffect | BeamEffect | String |  |  |
| HealMultiplier | HealMultiplier | HealMultiplier | Integer |  |  |

## StatusData: Status_ACTIVE_DEFENSE

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |
| WeaponOverride | WeaponOverride | WeaponOverride | String |  |  |
| ResetCooldowns | ResetCooldowns | ResetCooldowns | String |  |  |
| ResetOncePerCombat | ResetOncePerCombat | ResetOncePerCombat | Enumeration |  | YesNo |
| ScaleWithVitality | ScaleWithVitality | ScaleWithVitality | Enumeration |  | YesNo |
| TargetEffect | TargetEffect | TargetEffect | String |  |  |
| Projectile | Projectile | Projectile | String |  |  |
| Radius | Radius | Radius | Integer |  |  |
| Charges | Charges | Charges | Integer |  |  |
| DefendTargetPosition | DefendTargetPosition | DefendTargetPosition | Enumeration |  | YesNo |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |

## StatusData: Status_SPARK

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |
| WeaponOverride | WeaponOverride | WeaponOverride | String |  |  |
| ResetCooldowns | ResetCooldowns | ResetCooldowns | String |  |  |
| ResetOncePerCombat | ResetOncePerCombat | ResetOncePerCombat | Enumeration |  | YesNo |
| ScaleWithVitality | ScaleWithVitality | ScaleWithVitality | Enumeration |  | YesNo |
| Projectile | Projectile | Projectile | String |  |  |
| Radius | Radius | Radius | Integer |  |  |
| Charges | Charges | Charges | Integer |  |  |
| TargetConditions | TargetConditions | TargetConditions | String |  |  |

## StatusData: Status_PLAY_DEAD

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |
| WeaponOverride | WeaponOverride | WeaponOverride | String |  |  |
| ResetCooldowns | ResetCooldowns | ResetCooldowns | String |  |  |
| ResetOncePerCombat | ResetOncePerCombat | ResetOncePerCombat | Enumeration |  | YesNo |
| ScaleWithVitality | ScaleWithVitality | ScaleWithVitality | Enumeration |  | YesNo |
| FreezeCooldowns | FreezeCooldowns | FreezeCooldowns | Enumeration |  | YesNo |

## StatusData: Status_INVISIBLE

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |
| WeaponOverride | WeaponOverride | WeaponOverride | String |  |  |
| ResetCooldowns | ResetCooldowns | ResetCooldowns | String |  |  |
| ResetOncePerCombat | ResetOncePerCombat | ResetOncePerCombat | Enumeration |  | YesNo |
| ScaleWithVitality | ScaleWithVitality | ScaleWithVitality | Enumeration |  | YesNo |

## StatusData: Status_DEACTIVATED

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |
| WeaponOverride | WeaponOverride | WeaponOverride | String |  |  |
| ResetCooldowns | ResetCooldowns | ResetCooldowns | String |  |  |
| ResetOncePerCombat | ResetOncePerCombat | ResetOncePerCombat | Enumeration |  | YesNo |
| ScaleWithVitality | ScaleWithVitality | ScaleWithVitality | Enumeration |  | YesNo |

## StatusData: Status_EFFECT

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| BeamEffect | BeamEffect | BeamEffect | String |  |  |
| PlayerSameParty | PlayerSameParty | PlayerSameParty | Enumeration |  | YesNo |
| PlayerHasTag | PlayerHasTag | PlayerHasTag | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| PeaceOnly | PeaceOnly | PeaceOnly | Enumeration |  | YesNo |

## StatusData: Status_EXTRA_TURN

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |
| Items | Items | Items | String |  |  |
| WeaponOverride | WeaponOverride | WeaponOverride | String |  |  |
| ResetCooldowns | ResetCooldowns | ResetCooldowns | String |  |  |
| ResetOncePerCombat | ResetOncePerCombat | ResetOncePerCombat | Enumeration |  | YesNo |
| ScaleWithVitality | ScaleWithVitality | ScaleWithVitality | Enumeration |  | YesNo |

## StatusData: Status_CHARMED

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

## StatusData: Status_MUTED

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

## StatusData: Status_DECAYING_TOUCH

| @name | @display_name | @export_name | @type | @description | @enumeration_type_name |
|-----|-----|-----|-----|-----|-----|
| Name | Name | Name | Name |  |  |
| Using | Parent | Using | BaseClass | To enable inheritance, enter the name of the parent entry. Parent needs to be defined above current line. |  |
| ForGameMaster | ForGameMaster | ForGameMaster | Enumeration |  | YesNo |
| InitiateCombat | InitiateCombat | InitiateCombat | Enumeration |  | YesNo |
| BringIntoCombat | BringIntoCombat | BringIntoCombat | Enumeration |  | YesNo |
| DisplayName | DisplayName | DisplayName | TranslatedString |  |  |
| Description | Description | Description | TranslatedString |  |  |
| DescriptionParams | DescriptionParams | DescriptionParams | String |  |  |
| Icon | Icon | Icon | String |  |  |
| FormatColor | FormatColor | FormatColor | Enumeration |  | FormatStringColor |
| ForceOverhead | ForceOverhead | ForceOverhead | Enumeration |  | YesNo |
| ApplyEffect | ApplyEffect | ApplyEffect | String |  |  |
| StatusEffect | StatusEffect | StatusEffect | String |  |  |
| StatusEffectOverrideForItems | StatusEffectOverrideForItems | StatusEffectOverrideForItems | String |  |  |
| StatusEffectOnTurn | StatusEffectOnTurn | StatusEffectOnTurn | String |  |  |
| MaterialType | MaterialType | MaterialType | Enumeration |  | MaterialType |
| Material | Material | Material | String |  |  |
| MaterialApplyBody | MaterialApplyBody | MaterialApplyBody | Enumeration |  | YesNo |
| MaterialApplyArmor | MaterialApplyArmor | MaterialApplyArmor | Enumeration |  | YesNo |
| MaterialApplyWeapon | MaterialApplyWeapon | MaterialApplyWeapon | Enumeration |  | YesNo |
| MaterialApplyNormalMap | MaterialApplyNormalMap | MaterialApplyNormalMap | Enumeration |  | YesNo |
| MaterialFadeAmount | MaterialFadeAmount | MaterialFadeAmount | Integer |  |  |
| MaterialOverlayOffset | MaterialOverlayOffset | MaterialOverlayOffset | Integer |  |  |
| MaterialParameters | MaterialParameters | MaterialParameters | String |  |  |
| SoundStart | SoundStart | SoundStart | String |  |  |
| SoundLoop | SoundLoop | SoundLoop | String |  |  |
| SoundStop | SoundStop | SoundStop | String |  |  |
| SavingThrow | SavingThrow | SavingThrow | Enumeration |  | SavingThrow |
| ImmuneFlag | ImmuneFlag | ImmuneFlag | Enumeration |  | AttributeFlag |
| IsChanneled | IsChanneled | IsChanneled | Enumeration |  | YesNo |
| StatsId | StatsId | StatsId | String |  |  |
| StackId | StackId | StackId | String |  |  |
| StackPriority | StackPriority | StackPriority | Integer |  |  |
| AuraRadius | AuraRadius | AuraRadius | Integer |  |  |
| AuraSelf | AuraSelf | AuraSelf | String |  |  |
| AuraAllies | AuraAllies | AuraAllies | String |  |  |
| AuraNeutrals | AuraNeutrals | AuraNeutrals | String |  |  |
| AuraEnemies | AuraEnemies | AuraEnemies | String |  |  |
| AuraItems | AuraItems | AuraItems | String |  |  |
| AuraFX | AuraFX | AuraFX | String |  |  |
| SurfaceChange | SurfaceChange | SurfaceChange | String |  |  |
| IsInvulnerable | IsInvulnerable | IsInvulnerable | Enumeration |  | YesNo |
| IsResistingDeath | IsResistingDeath | IsResistingDeath | Enumeration |  | YesNo |
| LoseControl | LoseControl | LoseControl | Enumeration |  | YesNo |
| Skills | Skills | Skills | String |  |  |

