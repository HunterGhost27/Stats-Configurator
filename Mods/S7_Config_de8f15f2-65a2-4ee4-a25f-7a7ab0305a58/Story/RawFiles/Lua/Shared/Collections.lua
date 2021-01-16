--  ===================
--  DEFAULT COLLECTIONS
--  ===================

Collections = {

    --  CHARACTERS
    --  ----------

    ["Character"] = {},
    ["PlayerCharacters"] = {
        --  Thanks to LaughingLeader. table taken from https://gist.github.com/LaughingLeader/3d4d23540852679260b988936799c1fe
        ["_Hero"] = true,
        ["HumanFemaleHero"] = true,
        ["HumanMaleHero"] = true,
        ["DwarfFemaleHero"] = true,
        ["DwarfMaleHero"] = true,
        ["ElfFemaleHero"] = true,
        ["ElfMaleHero"] = true,
        ["LizardFemaleHero"] = true,
        ["LizardMaleHero"] = true,
        ["HumanUndeadFemaleHero"] = true,
        ["HumanUndeadMaleHero"] = true,
        ["DwarfUndeadFemaleHero"] = true,
        ["DwarfUndeadMaleHero"] = true,
        ["ElfUndeadFemaleHero"] = true,
        ["ElfUndeadMaleHero"] = true,
        ["LizardUndeadFemaleHero"] = true,
        ["LizardUndeadMaleHero"] = true,
        ["_Companions"] = true,
        ["StoryPlayer"] = true,
        ["CasualPlayer"] = true,
        ["NormalPlayer"] = true,
        ["HardcorePlayer"] = true,
        ["Player_Ifan"] = true,
        ["Player_Lohse"] = true,
        ["Player_RedPrince"] = true,
        ["Player_Sebille"] = true,
        ["Player_Beast"] = true,
        ["Player_Fane"] = true
    },
    ["NonPlayerCharacters"] = {},

    --  ARMOR
    --  -----

    ["Armor"] = {},
    ["ArmorTypeCloth"] = {},
    ["ArmorTypeLeather"] = {},
    ["ArmorTypeMail"] = {},
    ["ArmorTypePlate"] = {},
    ["ArmorTypeRobe"] = {},
    ["ArmorSlotHelmet"] = {},
    ["ArmorSlotBreast"] = {},
    ["ArmorSlotLeggings"] = {},
    ["ArmorSlotWeapon"] = {},
    ["ArmorSlotShield"] = {},
    ["ArmorSlotRing"] = {},
    ["ArmorSlotBelt"] = {},
    ["ArmorSlotBoots"] = {},
    ["ArmorSlotGloves"] = {},
    ["ArmorSlotAmulet"] = {},
    ["ArmorSlotRing2"] = {},
    ["ArmorSlotWings"] = {},
    ["ArmorSlotHorns"] = {},
    ["ArmorSlotOverhead"] = {},

    --  CRIME
    --  -----

    ["Crime"] = {},

    --  OBJECT
    --  ------

    ["Object"] = {},

    --  POTION
    --  ------

    ["Potion"] = {},
    ["IsConsumable"] = {},
    ["IsFood"] = {},
    ["IsPotion"] = {},

    --  SHIELD
    --  ------

    ["Shield"] = {},

    --  SKILLDATA
    --  ---------

    ["SkillData"] = {},
    -- ["SkillAbilityWarrior"] = {},
    -- ["SkillAbilityRanger"] = {},
    -- ["SkillAbilityRogue"] = {},
    -- ["SkillAbilitySource"] = {},
    -- ["SkillAbilityFire"] = {},
    -- ["SkillAbilityWater"] = {},
    -- ["SkillAbilityAir"] = {},
    -- ["SkillAbilityEarth"] = {},
    -- ["SkillAbilityDeath"] = {},
    -- ["SkillAbilitySummoning"] = {},
    -- ["SkillAbilityPolymorph"] = {},
    -- ["DamageTypePhysical"] = {},
    -- ["DamageTypePiercing"] = {},
    -- ["DamageTypeCorrosive"] = {},
    -- ["DamageTypeMagic"] = {},
    -- ["DamageTypeChaos"] = {},
    -- ["DamageTypeFire"] = {},
    -- ["DamageTypeAir"] = {},
    -- ["DamageTypeWater"] = {},
    -- ["DamageTypeEarth"] = {},
    -- ["DamageTypePoison"] = {},
    -- ["DamageTypeShadow"] = {},
    -- ["IsSourceSkill"] = {},

    --  STATUSDATA
    --  ----------

    ["StatusData"] = {},
    -- ["VitalityHealStatus"] = {},
    -- ["PhysicalArmorHealStatus"] = {},
    -- ["MagicArmorHealStatus"] = {},
    -- ["AllArmorHealStatus"] = {},
    -- ["AllHealStatus"] = {},
    -- ["SourceHealStatus"] = {},

    --  WEAPON
    --  ------

    ["Weapon"] = {},
    ["WeaponTypeSword"] = {},
    ["WeaponTypeClub"] = {},
    ["WeaponTypeAxe"] = {},
    ["WeaponTypeStaff"] = {},
    ["WeaponTypeBow"] = {},
    ["WeaponTypeCrossbow"] = {},
    ["WeaponTypeSpear"] = {},
    ["WeaponTypeKnife"] = {},
    ["WeaponTypeWand"] = {},
    ["WeaponTypeArrow"] = {},
    ["WeaponIsTwoHanded"] = {},
    ["WeaponIsNotTwoHanded"] = {}
}

--  ===================
--  REBUILD COLLECTIONS
--  ===================

function Collections:Rebuild()

    --  DYNAMIC-COLLECTIONS
    --  ===================

    local statTypeTable = {
        "Armor",
        "Character",
        "Crime",
        "Object",
        "Potion",
        "Shield",
        "SkillData",
        "StatusData",
        "Weapon"
    }

    for _, statType in pairs(statTypeTable) do
        local allStat = Ext.GetStatEntries(statType)

        for _, stat in pairs(allStat) do
            local statData = Ext.GetStat(stat)

            --  ----------------------
            --  GENERAL CATEGORIZATION
            --  ----------------------

            Collections[statType][stat] = true

            --  --------------------------
            --  SPECIALIZED CATEGORIZATION
            --  --------------------------

            --  CHARACTERS
            --  ----------

            if statType == "Character" then

                --  NON PLAYER CHARACTERS

                if not Collections["PlayerCharacters"][stat] then Collections["NonPlayerCharacters"][stat] = true end

            --  ARMOR
            --  -----

            elseif statType == "Armor" then

                --  ARMOR TYPE

                if statData["ArmorType"] ~= "None" and ValidString(statData["ArmorType"]) then -- Filter based on ArmorType
                    Collections["ArmorType" .. statData["ArmorType"]][stat] = true --  Add to ArmorType collections
                end

                --  ARMOR SLOTS

                if ValidString(statData["Slot"]) then --  Filter based on ArmorSlot
                    Collections["ArmorSlot" .. statData["Slot"]][stat] = true --  Add to ArmorSlot collections
                end

            --  POTION
            --  ------

            elseif statType == "Potion" then

                --  IS CONSUMABLE

                if statData["IsConsumable"] == "Yes" then
                    Collections["IsConsumable"][stat] = true
                    if statData["IsFood"] == "Yes" then Collections["IsFood"][stat] = true
                    else Collections["IsPotion"][stat] = true end
                end

            --  WEAPONS
            --  -------

            elseif statType == "Weapon" then

                --  WEAPON-TYPE

                if statData["WeaponType"] ~= "None" and ValidString(statData["WeaponType"]) then --  Filter based on WeaponType
                    Collections["WeaponType" .. statData["WeaponType"]][stat] = true -- Add to corresponding collection
                end

                --  IS-TWO-HANDED

                if statData["IsTwoHanded"] == "Yes" then Collections["WeaponIsTwoHanded"][stat] = true
                else Collections["WeaponIsNotTwoHanded"][stat] = true end

            --  SKILL DATA
            --  ----------

            elseif statType == "SkillData" then

                --  ABILITY
                -- if ValidString(statData["Ability"]) then --  Filter based on Ability
                --     Collections["SkillAbility" .. statData["Ability"]][stat] = true --  Add to corresponding collection
                -- end

                --  DAMAGE TYPE
                -- if ValidString(statData["DamageType"]) then --  Filter based on DamageType
                --     Collections["DamageType" .. statData["DamageType"]][stat] = true --  Add to corresponding collection
                -- end

                --  IS SOURCE SKILL
                -- if statData["Magic Cost"] ~= nil and statData["Magic Cost"] > 0 then --  Is a Source-Skill
                --     Collections["IsSourceSkill"][stat] = true --  Add to IsSourceSkill collection
                -- end

            --  STATUS DATA
            --  -----------

            elseif statType == "StatusData" then

            --  HEALING STATUS DATA

            -- if statData["HealStat"] ~= nil then --  If HealStat specified
            --     Collections["HealStatus" .. statData["HealStat"]][stat] = true --  Add to HealStatus collections
            -- end
            end
        end
    end

    --  CUSTOM-COLLECTIONS
    --  ==================

    local customCollections = LoadFile(MODINFO.SubdirPrefix .. "ConfigCollections.json") or {}
    Collections = Integrate(Collections, customCollections)
end
