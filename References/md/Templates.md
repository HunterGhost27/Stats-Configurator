# STAT TEMPLATES

## TreasureTable

```json
"<TreasureTableName>:TreasureTable": {
    "Categories": [
        {
            "Common": 0,
            "Divine": 0,
            "Epic": 0,
            "Frequency": 1,
            "Legendary": 0,
            "Rare": 0,
            "TreasureCategory":  "<TreasureCategoryName>",
            "Uncommon": 0,
            "Unique": 0
        }
    ],
    "DropCounts": [
        {
            "Amount": 1,
            "Chance": 0
        },
        {
            "Amount": 1,
            "Chance": 1
        }
    ],
    "EndLevel": 0,
    "StartLevel": 0,
    "TotalCount": 1
}
```

## TreasureCategory

```json
"<TreasureCategoryName>:TreasureCategory": {
    "Category":  "<TreasureCategoryName>",
    "Items":
    [
        {
            "ActPart":  5,
            "MaxAmount":  1,
            "MaxLevel":  0,
            "MinAmount":  1,
            "MinLevel":  5,
            "Name":  "<TreasureCategoryName>",
            "Priority":  1,
            "Unique":  0
        },
    ]
}
```

## SkillSet

```json
"<SkillSetName>:SkillSet": {
    "Name":  "<SkillSetName>",
    "Skills":
    [
        "<SkillName>",
        "<SkillName>",
        "<SkillName>"
    ]
}
```

## ItemCombo

```json
{
  "AutoLevel": false,
  "CraftingStation": "None",
  "Ingredients": [
    {
      "IngredientType": "Category",
      "ItemRarity": "Sentinel",
      "Object": "Bone",
      "Transform": "Transform"
    },
    {
      "IngredientType": "Object",
      "ItemRarity": "Sentinel",
      "Object": "LAB_MortarPestle_A",
      "Transform": "None"
    }
  ],
  "Name": "Bone_LAB_MortarPestle_A",
  "RecipeCategory": "Runes",
  "Results": [
    {
      "Name": "Bone_LAB_MortarPestle_A_1",
      "PreviewIcon": "",
      "PreviewStatsId": "TOOL_Pouch_Dust_Bone_A",
      "PreviewTooltip": "",
      "ReqLevel": 0,
      "Requirement": "Sentinel",
      "Results": [
        {
          "Boost": "",
          "Result": "TOOL_Pouch_Dust_Bone_A",
          "ResultAmount": 1
        }
      ]
    }
  ]
}
```

## ItemComboPreviewData

## ItemComboProperties

```json
{
  "Entries": [
    {
      "IngredientType": "Object",
      "ObjectId": "CONT_Barrel_Oil_A",
      "Result": "CONT_Barrel_Oil_A"
    },
    {
      "IngredientType": "Object",
      "ObjectId": "CON_Drink_Cup_A_Oil",
      "Result": "CON_Drink_Cup_A_Empty"
    },
    {
      "IngredientType": "Object",
      "ObjectId": "ITEM_BottleWithOil",
      "Result": "ITEM_EmptyBottle"
    }
  ],
  "Name": "Oil",
  "PreviewIcon": "Item_Cont_Barrel_Oil_A",
  "PreviewTooltip": "ItemCombinationProperty_Oil_Tooltip"
}
```

## EquipmentSet

```json
"<EquipmentSetName>:EquipmentSet": {
  "Groups": [
    {
      "Equipment": ["<EquipmentName>"]
    }
  ],
  "Name": "<EquipmentSetName>"
}
```

## DeltaModifier

```json
"<DeltaModName>:DeltaModifier": {
    "ArmorType":  "Leather",
    "BoostType":  "BaseUncommon",
    "Boosts":
    [
        {
            "Boost":  "_Boost_Armor_All_Armour_Base",
            "Count":  1
        }
    ],
    "Frequency":  1,
    "Handedness":  "Any",
    "MaxLevel":  -1,
    "MinLevel":  1,
    "ModifierType":  "Armor",
    "Name":  "Boost_Armor_All_Armour_Base_Helmet_Leather",
    "SlotType":  "Sentinel",
    "WeaponType":  "Sentinel"
}
```
