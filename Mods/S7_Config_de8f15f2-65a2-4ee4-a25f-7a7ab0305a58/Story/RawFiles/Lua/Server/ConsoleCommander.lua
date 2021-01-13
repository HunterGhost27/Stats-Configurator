--  ================
--  CONSOLE COMMANDS
--  ================

--  ADD CONFIGURATOR ITEM
--  =====================

ConsoleCommander:Register({
    ['Name'] = 'AddConfigurator',
    ['Description'] = "Adds the Configurator item to the host-character's inventory",
    ['Context'] = 'Server',
    ['Action'] = function(...)
        local hostCharacter = Osi.CharacterGetHostCharacter()
        if Osi.ItemTemplateIsInPartyInventory(hostCharacter, Inspector, 1) < 1 then
            Osi.ItemTemplateAddTo(Inspector, hostCharacter, 1)
            Debug:Print("Configurator added to Host-Character's Inventory")
        else Debug:Warn("Check your bags! The party has the Configurator already") end
    end
})

--  START MOD-MENU
--  ==============

ConsoleCommander:Register({
    ['Name'] = 'StartModMenu',
    ['Description'] = "Host-Character starts the Mod-Menu Dialog",
    ['Context'] = 'Server',
    ['Action'] = function (...)
        local hostCharacter = Osi.CharacterGetHostCharacter()
        if Osi.QRY_SpeakerIsAvailable(hostCharacter) then
            Osi.Proc_StartDialog(1, "S7_Config_ModMenu", hostCharacter)
            Debug:Print("ModMenu activated by the host-character")
        end
    end
})

--  SYNCHRONIZE STAT
--  ================

ConsoleCommander:Register({
    ['Name'] = 'SyncStat',
    ['Description'] = "Synchronize stat for all peers",
    ['Context'] = 'Server',
    ['Action'] = function (...)
        local args = {...}
        local statName = args[1] or ""
        local statPersistence = args[2] or false
        if not ValidString(statName) or not Osi.NRD_StatExists(statName) then return end
        Ext.SyncStat(statName, statPersistence)
        Debug:Print("Synchronized Stat: " .. statName)
    end
})

--  STAT SEARCH
--  ===========

ConsoleCommander:Register({
    ['Name'] = 'SearchStat',
    ['Description'] = "Search for (search-string) in category (stat-type)",
    ['Context'] = "Shared",
    ['Action'] = function (search, searchType)
        if not ValidString(search) then return end
        local allStat = ValidString(searchType) and Ext.GetStatEntries(searchType) or Ext.GetStatEntries()
        Debug:Print("Search Results: ")
        Debug:Print("=================================================")
        for i, stat in ipairs(allStat) do
            if string.match(stat, search) then
                Debug:Print(stat)
            end
        end
        Debug:Print("=================================================")
    end
})

--  =========
--  REFERENCE
--  =========

function Reference(statType, attributeType)
    if ValidString(statType) and (statType ~= "SkillData" or statType ~= "StatusData") then
        if ValidString(attributeType) then
            if statType ~= "SkillData" or statType ~= "StatusData" then
                for key, value in ipairs(References.StatObjectDefinitions[statType]) do
                    if value["@name"] == attributeType then
                        Debug:Print(Ext.JsonStringify(value))
                        if value["@type"] == "Enumeration" then
                            Debug:Print(Ext.JsonStringify(References.Enumerations[value["@enumeration_type_name"]]))
                        end
                    end
                end
            end
        else
            if statType == "SkillData" or statType == "StatusData" then
                Debug:Warn("Please sepecify the sub-type instead.")
                for key, value in pairs(SkillandStatusData) do
                    if key == statType then
                        Debug:Print(statType .. ": " .. Ext.JsonStringify(value))
                    end
                end
            else
                for key, content in pairs(References.StatObjectDefinitions) do
                    if key == statType then
                        Debug:Print(Ext.JsonStringify(content))
                    end
                end
            end
        end
    else Debug:Print("Please enter a type to refer.") end
end

ConsoleCommander:Register({
    ['Name'] = 'Reference',
    ['Description'] = "Lookup (StatType) and (AttributeType) in References",
    ['Context'] = 'Shared',
    ['Action'] = Reference
})

--  ===============
--  DETAILED SEARCH
--  ===============

function DeepDive(statName)
    if ValidString(statName) and Osi.NRD_StatExists(statName) then
        local statType = HandleStatType(statName)
        local statData = Ext.GetStat(statName)

        Debug:Print("Showing details of: " .. statName .. " (" .. statType .. ")")
        Debug:Print("===========================================================")
        for _, content in pairs(References.StatObjectDefinitions[statType]) do
            if SafeToModify(statName, content["@name"]) then
                Debug:Print(content["@name"] .. " (" .. content["@type"] .. "): " .. Ext.JsonStringify(statData[content["@name"]]))
            end
        end
        Debug:Print("===========================================================")
    else Debug:Print("Invalid stat. Make sure that the stat in question actually exists.") end
end

ConsoleCommander:Register({
    ['Name'] = 'DeepDive',
    ['Description'] = "",
    ['Context'] = 'Shared',
    ['Action'] = DeepDive
})