--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  #################################################################################################################################

--  ##################
--       SETTINGS
--  ##################

--  Default Settings
--  ================

S7_DefaultSettings = {
    ["ConfigFiles"] = {"S7_Config.json"}, --  A list of all the files the configurator will pull from
    ["SyncStatPersistence"] = true, --  Changes made with Ext.SyncStat() will be stored persistently if true
    ["ManuallySynchronize"] = {}, --  list statsIDs to manually synchronize using diagnostics-option.
    ["ExportStatIDtoTSV"] = {
        ["FileName"] = "S7_Config_AllTheStats.tsv", --  FileName for ExportedStats
        ["RestrictStatTypeTo"] = {} --  Limit the search to only these statTypes. e.g. Character, Potions, SkillData
    },
    ["BypassSafetyCheck"] = false --  Bypasses S7_SafeToModify()
}

S7_ConfigSettings = S7_DefaultSettings

--  Import Custom Settings
--  ======================

function S7_RefreshSettings()
    local JSONsetting = Ext.LoadFile("S7_ConfigSettings.json")
    local settingsOverride = Ext.JsonParse(JSONsetting)
    if settingsOverride ~= nil then
        for setting, value in pairs(S7_DefaultSettings) do
            S7_ConfigSettings[setting] = S7_CustomOrDefaultSettings(settingsOverride, setting)
        end
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Custom settings applied.")
    else
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Using default settings.")
    end
end

--  ======================================================
Ext.RegisterListener("SessionLoading", S7_RefreshSettings)
--  ======================================================

--  ##################
--       MOD-MENU
--  ##################

toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

local function S7_Config_ModMenuRelay(Signal) --  Signal recieved from Osiris
    --  =====   STATS-CONFIGURATOR  =====
    if Signal == "S7_StatsConfigurator" then --  Player requests stats-configuration
        local files = S7_ConfigSettings.ConfigFiles --  list of all config files
        for i, fileName in ipairs(files) do --  Iterate over each file
            Ext.Print("[S7:Config - BootstrapServer.lua] --- Loading " .. fileName)
            local JSONstring = Ext.LoadFile(fileName) --  Loads Configuration File
            S7_StatsConfigurator(JSONstring) --  Calls StatsConfigurator
        end
    end
    --  =====   STATS-SYNCHRONIZE   =====    Should do something now atleast. Still pretty useless.
    if Signal == "S7_StatsSynchronize" then --  Synchronize stats between all clients
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Synchronizing at Player's request.")
        if S7_ConfigSettings.ManuallySynchronize ~= nil then --  Check if player wants to manually synchronize certain stats
            for i, stats in pairs(S7_ConfigSettings.ManuallySynchronize) do --  Iterate over manually selected stats
                table.insert(toSync, stats) --  insert stats into toSync queue
            end
        end
        S7_StatsSynchronize() --  Call StatsSynchronize
    end
    --  =====   REAPPLY-SETTINGS    ======
    if Signal == "S7_RefreshSettings" then
        S7_RefreshSettings() --  Nice and easy
    end
    --  =====   EXPORT STATS TO TSV   =====
    if Signal == "S7_StatsExportTSV" then --  Export stat-types and stat-names to a tsv
        Ext.Print(
            "[S7:Config - BootstrapServer.lua] --- Exporting StatIDs to " ..
                S7_ConfigSettings.ExportStatIDtoTSV.FileName
        )
        S7_StatsExportTSV() --  Logs statIDs in an external TSV file for reference
    end
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  #####################
--  STATS CONFIG AND SYNC
--  #####################

function S7_StatsConfigurator(JSONstring) --  Recieves stringified JSON from Ext.LoadFile(), Osiris or a mod.
    local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.

    if JSONborne ~= nil then --  JSONborne is not empty.
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON loaded. Applying Configuration Profile.")

        Ext.Print("=============================================================")
        for name, content in pairs(JSONborne) do --  Iterate over JSONborne
            Ext.Print(name)
            Ext.Print("-------------------------------------------------------------")

            local stat = Ext.GetStat(name) --  Gets original stat-entry
            for key, value in pairs(content) do
                if S7_SafeToModify(key) then --  Checks if key is safe to modify
                    Ext.Print(key .. ": " .. value .. " (" .. stat[key] .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                    stat[key] = value --  Sets new value for Name[Attribute]
                end
            end

            Ext.Print("_____________________________________________________________")
            Ext.Print("\n")
            table.insert(toSync, name) --  Records stat-ids of the modified stats. To call Ext.SyncStat() on them later.
        end
        Ext.Print("=============================================================")
    else
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON file could not be loaded.")
    end
    Ext.Print("[S7:Config - BootstrapServer.lua] --- Configuration Profile Active.")
    S7_StatsSynchronize() --  Synchronize stats for all clients.
end

function S7_StatsSynchronize()
    if type(next(toSync)) ~= "nil" then --  Stats were modified.
        Ext.Print(
            "[S7:Config - BootstrapServer.lua] --- Synchronizing Stats [Savegame-Persistence: " ..
                tostring(S7_ConfigSettings.SyncStatPersistence) .. "]"
        )
        Ext.Print("=============================================================")

        for i, name in ipairs(toSync) do
            Ext.SyncStat(name, S7_ConfigSettings.SyncStatPersistence) --  Sync
            Ext.Print("Synchronized Stat: " .. name)
            toSync[i] = nil --  Clears out toSync entry.
        end
        Ext.Print("=============================================================")
    elseif type(next(toSync)) == "nil" then
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Nothing to Synchronize. toSync queue is empty.")
    end
end

--  ################################
--      EXPORT STAT-NAMES TO TSV
--  ################################

function S7_StatsExportTSV() --  Fetches literally every stat and exports to TSV
    Ext.SaveFile(S7_ConfigSettings.ExportStatIDtoTSV.FileName, "") --  Creates an empty TSV or Overwrites the existing one.
    local SaveAllStatsToFile = "S.No\tType\tStatID\n" --  Header Column

    local allStat = {} --  Initialize temporary table
    if type(next(S7_ConfigSettings.ExportStatIDtoTSV.RestrictStatTypeTo)) == "nil" then --  No restrictions in settings
        allStat = Ext.GetStatEntries() --  Get All Stat Entries
    else
        for i, statType in ipairs(S7_ConfigSettings.ExportStatIDtoTSV.RestrictStatTypeTo) do --  Only selected statTypes are loaded
            limit = Ext.GetStatEntries(statType)
            for l, val in ipairs(limit) do
                table.insert(allStat, val) --  appends selected stat-type entries to allStat
            end
        end
    end

    for key, value in ipairs(allStat) do
        local type = NRD_StatGetType(value) --  Didn't I just filter stats by statType? - this is what happens when you return to old code with new ideas
        SaveAllStatsToFile = SaveAllStatsToFile .. key .. "\t" .. type .. "\t" .. value .. "\n" --  Tab Separated Values
    end
    Ext.SaveFile(S7_ConfigSettings.ExportStatIDtoTSV.FileName, SaveAllStatsToFile) --  Save TSV file.
end

--  ###########################
--      INSPECT STATS SKILL
--  ###########################

local function S7_InspectStats(StatID, StatType) --  Recieves StatID and StatType from Osiris
    local compareStat = Ext.GetStatEntries(StatType) --  Retrieves all stat entries of corresponding stat-type for comparison.
    for name, content in pairs(compareStat) do --  Iterate over compareStat
        if content == StatID then
            Ext.Print("[S7:Config - BootstrapServer.lua] --- (" .. StatType .. "): " .. StatID)
        end
    end
end

--  =================================================================================
Ext.NewCall(S7_InspectStats, "S7_InspectStats", "(STRING)_StatID, (STRING)_StatType")
--  =================================================================================

--  ###################################
--      SUPPORT FUNCTION DEFINITIONS
--  ###################################

function S7_CustomOrDefaultSettings(settingsOverride, setting)
    if settingsOverride[setting] == false then
        return false
    else
        return settingsOverride[setting] or S7_DefaultSettings[setting]
    end
end

function S7_SafeToModify(key) --  Checks if key is safe to modify.
    local dontFwith = {
        --  Don't mess with these keys.
        "MemorizationRequirements",
        "Requirements",
        "AoEConditions",
        "TargetConditions",
        "ForkingConditions",
        "CycleConditions",
        "SkillProperties",
        "WinBoost",
        "LoseBoost"
    }

    if S7_ConfigSettings.BypassSafetyCheck == true then --  Manual-Override setting is true
        return true --  S7_SafeToModify() returns true for everything
    else -- Default Setting
        for i, avoid in ipairs(dontFwith) do --  Iterate over keys to avoid
            if key == avoid then --  If key matches
                return false --  Stop it right there
            else
                return true --  else continue
            end
        end
    end
end

--  ####################
--      ISSUE-TRACKER
--  ####################

--  Memorization-Requirements bugged in tooltips. Shows up multiple times. Possible Cause: SyncStat()

--  ########################################################################################################################################
