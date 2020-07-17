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

--  =============================
--  INITIALIZE CUSTOM COLLECTIONS
--  =============================

configCollections = {}

--  #########################################################################################################################################

--  ===================
--  REBUILD COLLECTIONS
--  ===================

function RebuildCollections()
    --  ================================
    --  RE-INITIALIZE CONFIG-COLLECTIONS
    --  ================================

    configCollections = Rematerialize(defaultCollections)

    --  ===================
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

    for _, statType in ipairs(statTypeTable) do
        local allStat = Ext.GetStatEntries(statType) --  Fetch all stats
        for _, stat in ipairs(allStat) do
            local statData = Ext.GetStat(stat)
            if statType == "Character" then
                --  ==========
                --  CHARACTERS
                --  ==========
                if configCollections["PlayerCharacters"][stat] == nil then
                    --  =====================
                    --  NON PLAYER CHARACTERS
                    --  =====================
                    Add2Collection("NonPlayerCharacters", stat)
                end
            elseif statType == "Armor" then
                --  =====
                --  ARMOR
                --  =====
                if statData["ArmorType"] ~= "None" and ValidString(statData["ArmorType"]) then
                    --  ==========
                    --  ARMOR TYPE
                    --  ==========
                    Add2Collection("ArmorType" .. statData["ArmorType"], stat)
                end
                if ValidString(statData["Slot"]) then
                    --  ===========
                    --  ARMOR SLOTS
                    --  ===========
                    Add2Collection("ArmorSlot" .. statData["Slot"], stat)
                end
            elseif statType == "Potion" then
                --  ======
                --  POTION
                --  ======
                if statData["IsConsumable"] == "Yes" then
                    --  =============
                    --  IS CONSUMABLE
                    --  =============
                    Add2Collection("IsConsumable", stat)
                    if statData["IsFood"] == "Yes" then
                        --  =======
                        --  IS FOOD
                        --  =======
                        Add2Collection("IsFood", stat)
                    else
                        --  =========
                        --  IS POTION
                        --  =========
                        Add2Collection("IsFood", stat)
                    end
                end
            elseif statType == "Weapon" then
                --  =======
                --  WEAPONS
                --  =======
                if statData["WeaponType"] ~= "None" and ValidString(statData["WeaponType"]) then
                    --  ===========
                    --  WEAPON-TYPE
                    --  ===========
                    Add2Collection("WeaponType" .. statData["WeaponType"], stat)
                end
                if statData["IsTwoHanded"] == "Yes" then
                    --  =============
                    --  IS-TWO-HANDED
                    --  =============
                    Add2Collection("IsTwoHandedWeapon", stat)
                else
                    Add2Collection("IsNotTwoHandedWeapon", stat)
                end
            elseif statType == "SkillData" then
                -- --  ==========
                -- --  SKILL DATA
                -- --  ==========
                -- if ValidString(statData["SkillAbility"]) then
                --     --  =======
                --     --  ABILITY
                --     --  =======
                --     Add2Collection("SkillAbility" .. statData["SkillAbility"], stat)
                -- end
                -- -- if ValidString(statData["Damage Type"]) then
                -- --     --  ===========
                -- --     --  DAMAGE TYPE
                -- --     --  ===========
                -- --     Add2Collection("DamageType" .. statData["DamageType"], stat)
                -- -- end
                -- if statData["MagicCost"] ~= nil and statData["MagicCost"] > 0 then
                --     --  ===============
                --     --  IS SOURCE SKILL
                --     --  ===============
                --     Add2Collection("IsSourceSkill", stat)
                -- end
            elseif statType == "StatusData" then
            -- --  ===========
            -- --  STATUS DATA
            -- --  ===========
            -- if statData["HealStat"] ~= nil then
            --     --  ===================
            --     --  HEALING STATUS DATA
            --     --  ===================
            --     Add2Collection("HealStatus" .. statData["HealStat"], stat)
            -- end
            end
            --  ======================
            --  GENERAL CATEGORIZATION
            --  ======================
            Add2Collection(statType, stat)
        end
    end
    --  ==================
    --  CUSTOM-COLLECTIONS
    --  ==================
    if ConfigSettings.CustomCollections ~= nil then
        for key, value in pairs(ConfigSettings.CustomCollections) do
            configCollections[key] = Rematerialize(value)
        end
    end
end

--  ================
--  ADD-2-COLLECTION
--  ================

function Add2Collection(statType, stat)
    if configCollections[statType][stat] == nil then
        configCollections[statType][stat] = true
    end
end

--  #########################################################################################################################################
