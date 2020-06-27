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
    }
}

configCollections = {}

function S7_RebuildCollections()
    configCollections = S7_Rematerialize(defaultCollections)
end

S7_RebuildCollections()

--  ===============================================================
if Ext.IsServer() then
    Ext.NewCall(S7_RebuildCollections, "S7_RebuildCollections", "")
end
--  ===============================================================
