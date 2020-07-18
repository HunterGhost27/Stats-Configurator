--  ###################################################################################################################################################
--                                                                      COLLECTIONS
--  ===================================================================================================================================================
logSource = "Lua:ConfigCollections"
--  ###################################################################################################################################################

--  ===================
--  DEFAULT COLLECTIONS
--  ===================

defaultCollections = {
    --  ==========
    --  CHARACTERS
    --  ==========
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
    --  =====
    --  ARMOR
    --  =====
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
    --  =====
    --  CRIME
    --  =====
    ["Crime"] = {},
    --  ======
    --  OBJECT
    --  ======
    ["Object"] = {},
    --  ======
    --  POTION
    --  ======
    ["Potion"] = {},
    ["IsConsumable"] = {},
    ["IsFood"] = {},
    ["IsPotion"] = {},
    --  ======
    --  SHIELD
    --  ======
    ["Shield"] = {},
    --  =========
    --  SKILLDATA
    --  =========
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
    --  ==========
    --  STATUSDATA
    --  ==========
    ["StatusData"] = {},
    -- ["VitalityHealStatus"] = {},
    -- ["PhysicalArmorHealStatus"] = {},
    -- ["MagicArmorHealStatus"] = {},
    -- ["AllArmorHealStatus"] = {},
    -- ["AllHealStatus"] = {},
    -- ["SourceHealStatus"] = {},
    --  ======
    --  WEAPON
    --  ======
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
    ["IsTwoHandedWeapon"] = {},
    ["IsNotTwoHandedWeapon"] = {}
}

configCollections = {} --  Initialize configCollections

--  #########################################################################################################################################

--  ===================
--  REBUILD COLLECTIONS
--  ===================

function RebuildCollections()
    configCollections = Rematerialize(defaultCollections) --  Reinitialize defaultCollections

    --  ===================
    --  DYNAMIC-COLLECTIONS
    --  ===================

    --  StatTypes for Iterations
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

    for _, statType in ipairs(statTypeTable) do --  Iterate over all statTypes
        local allStat = Ext.GetStatEntries(statType) --  Fetch all stats of the corresponding statType

        for _, stat in ipairs(allStat) do --  Fetch statNames
            local statData = Ext.GetStat(stat) --  Get statData

            --  ======================
            --  GENERAL CATEGORIZATION
            --  ======================
            Add2Collection(statType, stat)

            --  ==========================
            --  SPECIALIZED CATEGORIZATION
            --  ==========================

            if statType == "Character" then
                --  ==========
                --  CHARACTERS
                --  ==========

                --  NON PLAYER CHARACTERS
                --  =====================

                if configCollections["PlayerCharacters"][stat] == nil then --  Stat is not a PlayerCharacter
                    Add2Collection("NonPlayerCharacters", stat) --  Add to NonPlayerCharacters collection
                end
            elseif statType == "Armor" then
                --  =====
                --  ARMOR
                --  =====

                --  ARMOR TYPE
                --  ==========

                if statData["ArmorType"] ~= "None" and ValidString(statData["ArmorType"]) then -- Filter based on ArmorType
                    Add2Collection("ArmorType" .. statData["ArmorType"], stat) --  Add to ArmorType collections
                end

                --  ARMOR SLOTS
                --  ===========

                if ValidString(statData["Slot"]) then --  Filter based on ArmorSlot
                    Add2Collection("ArmorSlot" .. statData["Slot"], stat) --  Add to ArmorSlot collections
                end
            elseif statType == "Potion" then
                --  ======
                --  POTION
                --  ======

                --  IS CONSUMABLE
                --  =============

                if statData["IsConsumable"] == "Yes" then --  If potionStat is consumable
                    Add2Collection("IsConsumable", stat) --  Add to IsConsumable collection.

                    if statData["IsFood"] == "Yes" then --  If consumable is food
                        Add2Collection("IsFood", stat) --  Add to IsFood collection
                    else
                        Add2Collection("IsPotion", stat) -- Add to IsPotion otherwise
                    end
                end
            elseif statType == "Weapon" then
                --  =======
                --  WEAPONS
                --  =======

                --  WEAPON-TYPE
                --  ===========

                if statData["WeaponType"] ~= "None" and ValidString(statData["WeaponType"]) then --  Filter based on WeaponType
                    Add2Collection("WeaponType" .. statData["WeaponType"], stat) -- Add to corresponding collection
                end

                --  IS-TWO-HANDED
                --  =============

                if statData["IsTwoHanded"] == "Yes" then --  If Weapon is TwoHanded
                    Add2Collection("IsTwoHandedWeapon", stat) --  Add to TwoHanded Collection.
                else
                    Add2Collection("IsNotTwoHandedWeapon", stat) -- Otherwise add to IsNotTwoHanded collection
                end
            elseif statType == "SkillData" then
                --  ==========
                --  SKILL DATA
                --  ==========
                --  ABILITY
                --  =======
                -- if ValidString(statData["Ability"]) then --  Filter based on Ability
                --     Add2Collection("SkillAbility" .. statData["Ability"], stat) --  Add to corresponding collection
                -- end
                --  DAMAGE TYPE
                --  ===========
                -- if ValidString(statData["DamageType"]) then --  Filter based on DamageType
                --     Add2Collection("DamageType" .. statData["DamageType"], stat) --  Add to corresponding collection
                -- end
                --  IS SOURCE SKILL
                --  ===============
                -- if statData["Magic Cost"] ~= nil and statData["Magic Cost"] > 0 then --  Is a Source-Skill
                --     Add2Collection("IsSourceSkill", stat) --  Add to IsSourceSkill collection
                -- end
            elseif statType == "StatusData" then
            --  ===========
            --  STATUS DATA
            --  ===========

            --  HEALING STATUS DATA
            --  ===================

            -- if statData["HealStat"] ~= nil then --  If HealStat specified
            --     Add2Collection("HealStatus" .. statData["HealStat"], stat) --  Add to HealStatus collections
            -- end
            end
        end
    end

    --  ==================
    --  CUSTOM-COLLECTIONS
    --  ==================

    if ConfigSettings.CustomCollections ~= nil then --  Read CustomCollections if not nil
        for key, value in pairs(ConfigSettings.CustomCollections) do -- Iterate over table
            configCollections[key] = Rematerialize(value) -- Add to collections
        end
    end
end

--  ================
--  ADD-2-COLLECTION
--  ================

function Add2Collection(statType, stat)
    if configCollections[statType][stat] == nil then --  If statType and Stat don't already exist
        configCollections[statType][stat] = true --  Add them to collection
    end
end

--  #########################################################################################################################################
