--  ###################################################################################################################################################
--                                                                      COLLECTIONS
--  ===================================================================================================================================================
logSource = "Lua:ConfigCollections"
--  ###################################################################################################################################################

defaultCollections = {
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
    ["Armor"] = {},
    ["Character"] = {},
    ["Crime"] = {},
    ["Object"] = {},
    ["Potion"] = {},
    ["Shield"] = {},
    ["SkillData"] = {},
    ["StatusData"] = {},
    ["Weapon"] = {}
}

configCollections = {}

function RebuildCollections()
    --  RE-INITIALIZE CONFIG-COLLECTIONS
    --  ================================
    configCollections = Rematerialize(defaultCollections)

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
        local allStat = Ext.GetStatEntries(statType)
        for _, stat in ipairs(allStat) do
            if statType == "Character" then
                if configCollections["PlayerCharacters"][stat] == nil then
                    if configCollections["NonPlayerCharacters"][stat] == nil then
                        configCollections["NonPlayerCharacters"][stat] = true
                    end
                end
            end
            if configCollections[statType][stat] == nil then
                configCollections[statType][stat] = true
            end
        end
    end
    --  CUSTOM-COLLECTIONS
    --  ==================
    if ConfigSettings.CustomCollections ~= nil then
        for key, value in pairs(ConfigSettings.CustomCollections) do
            configCollections[key] = Rematerialize(value)
        end
    end
end

--  #########################################################################################################################################
