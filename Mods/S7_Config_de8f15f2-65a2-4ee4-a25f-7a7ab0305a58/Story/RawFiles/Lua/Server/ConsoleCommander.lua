--  ================
--  CONSOLE COMMANDS
--  ================

--  ADD CONFIGURATOR ITEM
--  =====================

ConsoleCommander:Register({
    ['Name'] = 'AddConfigurator',
    ['Description'] = "Adds the Configurator item to the host-character's inventory",
    ['Context'] = 'Server',
    ['Action'] = function()
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
    ['Action'] = function()
        ModMenuDialog:Start()
        Debug:Print("ModMenu activated by the host-character")
    end
})

--  SYNCHRONIZE STAT
--  ================

ConsoleCommander:Register({
    ['Name'] = 'SyncStat',
    ['Description'] = "Synchronize stat for all peers",
    ['Context'] = 'Server',
    ['Params'] = {[1] = 'StatName', [2] = 'StatPersistence'},
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
    ['Params'] = {[1] = 'Search', [2] = 'SearchType'},
    ['Action'] = function (search, searchType)
        if not ValidString(search) then return end
        local allStat = ValidString(searchType) and Ext.GetStatEntries(searchType) or Ext.GetStatEntries()
        Stringer:SetHeader("Search Results for: " .. search)
        for _, stat in ipairs(allStat) do if string.match(stat, search) then Stringer:Add(stat) end end
        Debug:Print(Stringer:Build())
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
    ['Params'] = {[1] = 'StatType', [2] = 'AttributeType'},
    ['Action'] = Reference
})

--  ===============
--  DETAILED SEARCH
--  ===============

function DeepDive(statName)
    if ValidString(statName) and Osi.NRD_StatExists(statName) then
        local statType = HandleStatType(statName)
        local statData = Ext.GetStat(statName)

        Stringer:SetHeader("Showing details of: " .. statName .. " (" .. statType .. ")")
        for _, content in pairs(References.StatObjectDefinitions[statType]) do
            if SafeToModify(statName, content["@name"]) then
                Stringer:Add(content["@name"] .. " (" .. content["@type"] .. "): " .. Ext.JsonStringify(statData[content["@name"]]))
            end
        end
        Debug:Print(Stringer:Build())
    else Debug:Print("Invalid stat. Make sure that the stat in question actually exists!") end
end

ConsoleCommander:Register({
    ['Name'] = 'DeepDive',
    ['Description'] = "Print detailed information about (statName)",
    ['Context'] = 'Shared',
    ['Params'] = {[1] = 'StatName'},
    ['Action'] = DeepDive
})