--  ===================
--  DEFAULT COLLECTIONS
--  ===================

Collections = {

    --  CHARACTERS
    --  ----------

    ['Character'] = {},
    ['PlayerCharacters'] = {
        --  Thanks to LaughingLeader. table taken from https://gist.github.com/LaughingLeader/3d4d23540852679260b988936799c1fe
        -- ['_Hero'] = true,
        ['HumanFemaleHero'] = true,
        ['HumanMaleHero'] = true,
        ['DwarfFemaleHero'] = true,
        ['DwarfMaleHero'] = true,
        ['ElfFemaleHero'] = true,
        ['ElfMaleHero'] = true,
        ['LizardFemaleHero'] = true,
        ['LizardMaleHero'] = true,
        ['HumanUndeadFemaleHero'] = true,
        ['HumanUndeadMaleHero'] = true,
        ['DwarfUndeadFemaleHero'] = true,
        ['DwarfUndeadMaleHero'] = true,
        ['ElfUndeadFemaleHero'] = true,
        ['ElfUndeadMaleHero'] = true,
        ['LizardUndeadFemaleHero'] = true,
        ['LizardUndeadMaleHero'] = true,
        -- ['_Companions'] = true,
        -- ['StoryPlayer'] = true,
        -- ['CasualPlayer'] = true,
        -- ['NormalPlayer'] = true,
        -- ['HardcorePlayer'] = true,
        ['Player_Ifan'] = true,
        ['Player_Lohse'] = true,
        ['Player_RedPrince'] = true,
        ['Player_Sebille'] = true,
        ['Player_Beast'] = true,
        ['Player_Fane'] = true
    },
    ['NonPlayerCharacters'] = {},

    --  ARMOR
    --  -----

    ['Armor'] = {},
    ['ArmorTypeCloth'] = {},
    ['ArmorTypeLeather'] = {},
    ['ArmorTypeMail'] = {},
    ['ArmorTypePlate'] = {},
    ['ArmorTypeRobe'] = {},
    ['ArmorSlotHelmet'] = {},
    ['ArmorSlotBreast'] = {},
    ['ArmorSlotLeggings'] = {},
    ['ArmorSlotWeapon'] = {},
    ['ArmorSlotShield'] = {},
    ['ArmorSlotRing'] = {},
    ['ArmorSlotBelt'] = {},
    ['ArmorSlotBoots'] = {},
    ['ArmorSlotGloves'] = {},
    ['ArmorSlotAmulet'] = {},
    ['ArmorSlotRing2'] = {},
    ['ArmorSlotWings'] = {},
    ['ArmorSlotHorns'] = {},
    ['ArmorSlotOverhead'] = {},

    --  CRIME
    --  -----

    ['Crime'] = {},

    --  OBJECT
    --  ------

    ['Object'] = {},

    --  POTION
    --  ------

    ['Potion'] = {},
    ['IsConsumable'] = {},
    ['IsFood'] = {},
    ['IsPotion'] = {},

    --  SHIELD
    --  ------

    ['Shield'] = {},

    --  SKILLDATA
    --  ---------

    ['SkillData'] = {},

    --  STATUSDATA
    --  ----------

    ['StatusData'] = {},

    --  WEAPON
    --  ------

    ['Weapon'] = {},
    ['WeaponTypeSword'] = {},
    ['WeaponTypeClub'] = {},
    ['WeaponTypeAxe'] = {},
    ['WeaponTypeStaff'] = {},
    ['WeaponTypeBow'] = {},
    ['WeaponTypeCrossbow'] = {},
    ['WeaponTypeSpear'] = {},
    ['WeaponTypeKnife'] = {},
    ['WeaponTypeWand'] = {},
    ['WeaponTypeArrow'] = {},
    ['WeaponIsTwoHanded'] = {},
    ['WeaponIsNotTwoHanded'] = {}
}

--  ===================
--  REBUILD COLLECTIONS
--  ===================

--  CUSTOM-COLLECTIONS
--  ==================

---Rebuilds Custom-Collection Data
function Collections:CustomRebuild()
    local customCollections = LoadFile(MODINFO.SubdirPrefix .. 'ConfigCollections.json') or {}
    self = Integrate(self, customCollections)
end

--  PREDEF-COLLECTIONS
--  ==================

---Rebuilds Collection Data
function Collections:Rebuild()

    local statTypeTable = {
        'Armor',
        'Character',
        'Crime',
        'Object',
        'Potion',
        'Shield',
        'SkillData',
        'StatusData',
        'Weapon'
    }

    for _, statType in pairs(statTypeTable) do
        local allStat = Ext.GetStatEntries(statType)

        ForEach(allStat, function (idx, stat)
            local statData = Ext.GetStat(stat)

            --  ----------------------
            --  GENERAL CATEGORIZATION
            --  ----------------------

            self[statType][stat] = true

            --  --------------------------
            --  SPECIALIZED CATEGORIZATION
            --  --------------------------

            if stat:sub(1,1) == "_" then return end -- Skip _Entries

            --  CHARACTERS
            --  ----------

            if statType == 'Character' then

                --  NON PLAYER CHARACTERS

                if not self['PlayerCharacters'][stat] then self['NonPlayerCharacters'][stat] = true end

            --  ARMOR
            --  -----

            elseif statType == 'Armor' then

                --  ARMOR TYPE

                if statData['ArmorType'] ~= 'None' and ValidString(statData['ArmorType']) then
                    self['ArmorType' .. statData['ArmorType']][stat] = true
                end

                --  ARMOR SLOTS

                if ValidString(statData['Slot']) then
                    self['ArmorSlot' .. statData['Slot']][stat] = true
                end

            --  POTION
            --  ------

            elseif statType == 'Potion' then

                --  IS CONSUMABLE

                if statData['IsConsumable'] == 'Yes' then
                    self['IsConsumable'][stat] = true
                    if statData['IsFood'] == "Yes" then self['IsFood'][stat] = true
                    else self['IsPotion'][stat] = true end
                end

            --  WEAPONS
            --  -------

            elseif statType == 'Weapon' then

                --  WEAPON-TYPE

                if statData['WeaponType'] ~= 'None' and ValidString(statData['WeaponType']) then
                    self['WeaponType' .. statData['WeaponType']][stat] = true
                end

                --  IS-TWO-HANDED

                if statData['IsTwoHanded'] == "Yes" then self['WeaponIsTwoHanded'][stat] = true
                else self['WeaponIsNotTwoHanded'][stat] = true end
            end
        end)
    end

    --  CUSTOM COLLECTIONS
    --  ------------------

    self:CustomRebuild()

    Debug:FPrint('Collections Rebuilt')
end

---Unpacks Collection into a table
---@param keyName string CollectionName
---@return table collection Collection
function Collections:Unpack(keyName)
    local collection = {}
    local collectionName = string.match(keyName, '^#(.-)$')
    if not collectionName then collection[keyName] = true; return collection end
    if self[collectionName] then
        Debug:Print("Unpacking collection " .. collectionName)
        for statName, _ in pairs(self[collectionName]) do collection[statName] = true end
    else Debug:Error("No collection named " .. collectionName .. " found.") end
    return collection
end

--  CONSOLE-COMMAND
--  ===============

ConsoleCommander:Register({
    ['Name'] = 'RebuildCollections',
    ['Description'] = 'Rebuild Collection Data',
    ['Context'] = 'Shared',
    ['Action'] = function() Collections:Rebuild() end
})