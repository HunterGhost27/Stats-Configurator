# Stat Templates

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
      "Object": "<ObjectName>",
      "Transform": "Transform"
    },
    {
      "IngredientType": "Object",
      "ItemRarity": "Sentinel",
      "Object": "<ObjectName>",
      "Transform": "None"
    }
  ],
  "Name": "<RecipeName>",
  "RecipeCategory": "<RecipeCategory>",
  "Results": [
    {
      "Name": "<RecipeName>_1",
      "PreviewIcon": "",
      "PreviewStatsId": "<RecipePreviewID>",
      "PreviewTooltip": "",
      "ReqLevel": 0,
      "Requirement": "Sentinel",
      "Results": [
        {
          "Boost": "",
          "Result": "<RecipeResult>",
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
      "ObjectId": "<ObjectID>",
      "Result": "<ObjectID>"
    },
    {
      "IngredientType": "Object",
      "ObjectId": "<ObjectID>",
      "Result": "<ObjectID>"
    },
    {
      "IngredientType": "Object",
      "ObjectId": "<ObjectID>",
      "Result": "<ObjectID>"
    }
  ],
  "Name": "<PropertyName>",
  "PreviewIcon": "<PreviewIcon>",
  "PreviewTooltip": "<PreviewTooltip>"
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
            "Boost":  "<DeltaBoost>",
            "Count":  1
        }
    ],
    "Frequency":  1,
    "Handedness":  "Any",
    "MaxLevel":  -1,
    "MinLevel":  1,
    "ModifierType":  "Armor",
    "Name":  "<DeltaModName>",
    "SlotType":  "Sentinel",
    "WeaponType":  "Sentinel"
}
```
