--  ###################################################################################################################################################
--                                                                 CONSOLE COMMANDER
--  ===================================================================================================================================================
logSource = "Lua:ConsoleCommander"
--  ###################################################################################################################################################

--  ================
--  CONSOLE COMMANDS
--  ================

function S7_Config_ConsoleCommander(...)
    local args = {...}
    local command = args[2] or ""

    if command == "AddSkill" then
        --  ADD SKILL
        --  =========
        local skillName = args[3] or ""
        local character = args[4] or ""
        AddSkill(skillName, character)
    elseif command == "RemoveSkill" then
        --  REMOVE SKILL
        --  ============
        local skillName = args[3] or ""
        local character = args[4] or ""
        RemoveSkill(skillName, character)
    elseif command == "StatSearch" then
        --  STAT SEARCH
        --  ===========
        local search = args[3] or ""
        local searchsearchType = args[4] or ""
        StatSearch(search, searchsearchType)
    elseif command == "StatSync" then
        --  SYNCHRONIZE STAT
        --  ================
        local statName = args[3] or ""
        local statPersistence = args[4] or false
        if Osi.NRD_StatExists(statName) then -- if stat-exists.
            Ext.SyncStat(statName, statPersistence) --  Sync
            S7_ConfigLog("Synchronized Stat: " .. statName)
        else
            S7_ConfigLog("Stat: " .. statName .. "does not exist!", "[Warning]")
        end
    elseif command == "Relay" then
        --  SEND SIGNAL TO MOD-MENU RELAY
        --  =============================
        local signal = args[3] or ""
        if signal == "" or signal == "Help" then
            S7_ConfigLog("\n" .. relayHelpMessage, "[Warning]")
        else
            S7_Config_ModMenuRelay(signal)
        end
    elseif command == "Help" or command == "" then
        --  HELP
        --  ====
        S7_ConfigLog("\n" .. helpMessage, "[Warning]")
    end

    ExportLog() -- Exports ConfigLogs if they're enabled.
end

helpMessage =
    [[
    ======================================================================================================================================================
    Command     Argument1       Argument2                --  COMMENTS                                               EXAMPLE
    ======================================================================================================================================================
    Help        -               -                        --  Prints a helpful list of commands.                     Help
    AddSkill    <SkillID>       <Character|Optional>     --  Adds skill (skillID) to character (character-key).     AddSkill Projectile_Fireball Host
    RemoveSkill <SkillID>       <Character|Optional>     --  Removes skill (skillID) to character (character-key).  RemoveSkill Shout_InspireStart
    StatSearch  <SearchString>  <StatType |Optional>     --  Search for (SearchString) in category (StatType).      StatSearch Summon_Incarnate SkillData
    StatSync    <StatID>        <Persistence|Optional>   --  Synchronize (StatID) for all clients.                  StatSync Projectile_PyroclasticRock
    Relay       <Signal>        -                        --  Relay signal to ModMenu. Relay Help for more info.     Relay S7_BroadcastConfigData
    ======================================================================================================================================================
    * Resize the console window if this doesn't fit properly.
]]

relayHelpMessage =
    [[
    =================================================================================================================
    Signals                         Purpose
    =================================================================================================================
    S7_StatsConfigurator            Loads and applies configuration-profile. (default: S7_Config.json)
    S7_BuildConfigData              Builds ConfigData file using configuration-profile (default: S7_Config.json)
    S7_BroadcastConfigData          Broadcasts serialized ConfigData to all active clients.
    S7_ValidateClientConfig         Calls for client ConfigData validation. Check response in debug-console.
    S7_ToggleStatsLoader            Toggle StatsLoader setting. Responsible for loading ConfigData on ModuleLoad.
    S7_ToggleSyncStatPersistence    Toggles Sync-Stat Persistence. Stat-edits will be saved persistently if enabled.
    S7_ToggleSafetyCheck            Toggles safe-to-modify attribute check. Will prevent modification of certain keys.
    S7_SetDefaultSettings           Reset ConfigSettings to default values. Export to save persistently.
    S7_ExportCurrentSettings        Export current ConfigSettings. Saves settings in a json file in OsirisData.
    S7_RefreshSettings              Reloads settings from OsirisData folder. if unavailable, loads defaults.
    S7_StatsExportTSV               Export a list of all stat-entries to a TSV file in OsirisData folder.
    S7_Config_CHANGELOG             Request in-game changelog and instruction manual.
    S7_PrintModRegistry             Prints a list of all mods registered to Stats-Configurator.
    S7_RebuildCollections           Rebuilds collections using presets and custom settings.
    S7_ToggleConfigLog              Toggles logging to external file.
    ==================================================================================================================
    * Resize the console window if this doesn't fit properly.
]]

--  ===============================================================
Ext.RegisterConsoleCommand("S7_Config", S7_Config_ConsoleCommander)
--  ===============================================================

--  ####################################################################################################################################################

--  ===================
--  ADD OR REMOVE SKILL
--  ===================

function AddSkill(skillName, character)
    if skillName ~= "" and skillName ~= nil then
        FetchPlayers()
        if character == "" or character == nil or character == "Clients" then
            for userProfileID, contents in pairs(userInfo.clientCharacters) do
                Osi.CharacterAddSkill(contents["currentCharacter"], skillName, 1)
                S7_ConfigLog("Skill: " .. skillName .. " added to " .. contents["currentCharacterName"])
            end
        elseif character == "Host" then
            Osi.CharacterAddSkill(userInfo.hostCharacter["currentCharacter"], skillName, 1)
            S7_ConfigLog("Skill: " .. skillName .. " added to " .. userInfo.hostCharacter["currentCharacterName"])
        else
            for userProfileID, contents in pairs(userInfo.clientCharacters) do
                if contents["currentCharacterName"] == character then
                    Osi.CharacterAddSkill(contents["currentCharacter"], skillName, 1)
                    S7_ConfigLog("Skill: " .. skillName .. " added to " .. contents["currentCharacterName"])
                end
            end
        end
    else
        S7_ConfigLog("Invalid SkillName", "[Error]")
    end
end

function RemoveSkill(skillName, character)
    if skillName ~= "" and skillName ~= nil then
        FetchPlayers()
        if character == "" or character == nil or character == "Clients" then
            for userProfileID, contents in ipairs(userInfo.clientCharacters) do
                Osi.CharacterRemoveSkill(contents["currentCharacter"], skillName)
                S7_ConfigLog("Skill: " .. skillName .. " removed from " .. contents["currentCharacterName"])
            end
        elseif character == "Host" then
            Osi.CharacterRemoveSkill(userInfo.hostCharacter["currentCharacter"], skillName)
            S7_ConfigLog("Skill: " .. skillName .. " removed from " .. userInfo.hostCharacter["currentCharacterName"])
        else
            for userProfileID, contents in pairs(userInfo.clientCharacters) do
                if contents["currentCharacterName"] == character then
                    Osi.CharacterRemoveSkill(contents["currentCharacter"], skillName)
                    S7_ConfigLog("Skill: " .. skillName .. " removed from " .. contents["currentCharacterName"])
                end
            end
        end
    else
        S7_ConfigLog("Invalid SkillName", "[Error]")
    end
end

--  ===========
--  STAT SEARCH
--  ===========

function StatSearch(search, searchType)
    if search ~= nil and search ~= "" then
        local allStat = {}
        if searchType ~= "" and searchType ~= nil then
            allStat = Ext.GetStatEntries(searchType)
        else
            allStat = Ext.GetStatEntries()
        end
        S7_ConfigLog("Search Results: ")
        S7_ConfigLog("=================================================")
        for i, stat in ipairs(allStat) do
            if string.match(stat, search) then
                S7_ConfigLog(stat)
            end
        end
        S7_ConfigLog("=================================================")
    else
        S7_ConfigLog("Search String Empty. Try something like Projectile_Fire", "[Warning]")
    end
end

--  #####################################################################################################################################################
