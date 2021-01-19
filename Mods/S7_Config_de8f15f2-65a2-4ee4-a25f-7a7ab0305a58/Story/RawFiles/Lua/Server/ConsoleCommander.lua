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
