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


--  SYNCHRONIZE STAT
--  ================

ConsoleCommander:Register({
    ['Name'] = 'SyncStat',
    ['Description'] = "Synchronize (stat|nil) with (persistence|false) for all peers",
    ['Context'] = 'Server',
    ['Params'] = {[1] = 'StatName: string|nil', [2] = 'StatPersistence: boolean = false'},
    ['Action'] = function (...)
        local args = {...}
        local statName = args[1] or ""
        local statPersistence = args[2] or false
        if not ValidString(statName) or not Osi.NRD_StatExists(statName) then Stats:Synchronize() return end
        Ext.SyncStat(statName, statPersistence)
        Debug:Print("Synchronized Stat: " .. statName)
    end
})

--  STAT SEARCH
--  ===========

ConsoleCommander:Register({
    ['Name'] = 'SearchStat',
    ['Description'] = "Search for (search-string) in category (stat-type|nil)",
    ['Context'] = 'Shared',
    ['Params'] = {[1] = 'Search: string', [2] = 'SearchType: string|nil'},
    ['Action'] = function (search, searchType)
        if not ValidString(search) then return end
        local allStat = ValidString(searchType) and Ext.GetStatEntries(searchType) or Ext.GetStatEntries()
        Write:SetHeader("Search Results for: " .. search)
        for _, stat in ipairs(allStat) do if string.match(stat, search) then Write:NewLine(stat) end end
        Debug:Print(Write:Display())
    end
})

--  DEEP DIVE
--  =========

ConsoleCommander:Register({
    ['Name'] = 'DeepDive',
    ['Description'] = "Prints detailed information about (statName)",
    ['Context'] = 'Shared',
    ['Params'] = {[1] = 'statName: string'},
    ['Action'] = function(statName)
        local stat = Ext.GetStat(statName)
        if not stat then return Debug:Warn('Error404: No such stat found!') end
        local statType = DetermineStatType(statName)
        local attributes = table.pack(Disintegrate(AttributeMaps[statType], ","))
        attributes['n'] = nil
        Write:SetHeader('DeepDive into ' .. statName)
        ForEach(attributes, function(idx, attribute)
            if not IsValid(stat[attributes]) then return end
            Write:NewLine(attribute .. ": " .. Ext.JsonStringify(stat[attribute]))
        end)
        Debug:Print(Write:Display())
    end
})