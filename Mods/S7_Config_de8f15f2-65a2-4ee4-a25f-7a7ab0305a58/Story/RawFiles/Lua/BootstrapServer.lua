--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  #################################################################################################################################

--  ##################
--       SETTINGS
--  ##################

--  Default Settings
--  ================

S7_DefaultSettings = {
    ["ConfigFiles"] = {"S7_Config.json"}, --  A list of all the files the configurator will pull from.
    ["SyncStatPersistence"] = true, --  Changes made with Ext.SyncStat() will be stored persistently if true.
    ["ManuallySynchronize"] = {}, --  statIDs listed here can be manually synchronized using diagnostics-option.
    ["ExportStatIDtoTSV"] = {
        ["FileName"] = "S7_Config_AllTheStats.tsv", --  FileName for ExportedStats.
        ["RestrictStatTypeTo"] = {} --  limitedStats the search to only these statTypes. e.g. Character, Potions, SkillData.
    },
    ["BypassSafetyCheck"] = false --  Bypasses S7_SafeToModify() - Prevents modifications of unsupported or problematic keys.
}

function S7_SetDefaultSettings() --  Sets ConfigSettings = DefaultSettings during SessionLoading.
    S7_ConfigSettings = S7_DefaultSettings
    Ext.Print("[S7:Config - BootstrapServer.lua] --- Using default settings.")
end

--  =========================================================
Ext.RegisterListener("SessionLoading", S7_SetDefaultSettings)
--  =========================================================

--  Import Custom Settings
--  ======================

function S7_RefreshSettings() --  Overrides ConfigSettings on <GAMELOAD> and Player's request.
    S7_ConfigSettings = S7_DefaultSettings --  Reset to base settings.
    local JSONsetting = Ext.LoadFile("S7_ConfigSettings.json") --  Load CustomSettings json file.
    if (type(JSONsetting) == "string") and (JSONsetting ~= "") and (JSONsetting ~= "{}") then --  if json file exists and is not empty.
        local settingsOverride = Ext.JsonParse(JSONsetting) --  Parse json-string.
        for setting, value in pairs(S7_DefaultSettings) do --  Iterate for every key in Default ConfigSettings.
            S7_ConfigSettings[setting] = S7_CustomOrDefaultSettings(settingsOverride, setting) --  Overrides the changes, pulls the rest from Default.
        end
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Custom settings applied.")
        S7_SetDialogVars("Settings", "Settings: Custom")
    else
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Using default settings.")
        S7_SetDialogVars("Settings", "Settings: Default")
    end
end

function S7_CustomOrDefaultSettings(settingsOverride, setting) --  Overrides ConfigSettings. CustomSettings given priority over Default.
    if settingsOverride[setting] == false then --  If settingsOverride has boolean false.
        return false -- Prevents the function from returning DefaultSettings when false is a valid return value. Only nil skips settingsOverride.
    else
        return settingsOverride[setting] or S7_DefaultSettings[setting] --  Return settingsOverride (if not nil) or DefaultSettings(if settingsOverride is nil).
    end
end

--  Export Current Settings
--  =======================

function S7_ExportCurrentSettings() --  Exports the current ConfigSettings to a json file
    local exportSettings = Ext.JsonStringify(S7_ConfigSettings)
    Ext.SaveFile("S7_ConfigSettings.json", exportSettings) --  Save json file.
    Ext.Print("[S7:Config - BootstrapServer.lua] --- Exporting Current ConfigSettings to S7_ConfigSettings.json")
end

--  ##################
--       MOD-MENU
--  ##################

toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

local function S7_Config_ModMenuRelay(Signal) --  Signal recieved from Osiris.
    if Signal == "S7_StatsConfigurator" then --  =====   STATS-CONFIGURATOR  =====
        local files = S7_ConfigSettings.ConfigFiles --  lists all config files.
        for i, fileName in ipairs(files) do --  Iterate over each file.
            Ext.Print("[S7:Config - BootstrapServer.lua] --- Loading " .. fileName)
            local JSONstring = Ext.LoadFile(fileName) --  Loads Configuration File.
            S7_StatsConfigurator(JSONstring) --  Calls StatsConfigurator.
        end
    elseif Signal == "S7_StatsSynchronize" then --  =====   STATS-SYNCHRONIZE   =====
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Synchronizing at Player's request.")
        if S7_ConfigSettings.ManuallySynchronize ~= nil then --  Checks if player wants to manually synchronize certain stats.
            for i, stats in pairs(S7_ConfigSettings.ManuallySynchronize) do --  Iterate over manually selected stats.
                table.insert(toSync, stats) --  insert stats into toSync queue.
            end
        end
        S7_StatsSynchronize() --  Call StatsSynchronize.
    elseif Signal == "S7_SetDefaultSettings" then -- ==== SET DEFAULT SETTINGS =====
        S7_SetDefaultSettings()
        S7_SetDialogVars("Settings", "Settings: Default")
    elseif Signal == "S7_RefreshSettings" then --  =====   REAPPLY-SETTINGS    ======
        S7_RefreshSettings() --  Nice and easy
    elseif Signal == "S7_ExportCurrentSettings" then --  =====   EXPORT CURRENT SETTINGS ===
        S7_ExportCurrentSettings() --  Calls Export settings function.
    elseif Signal == "S7_StatsExportTSV" then --  =====   EXPORT STATS TO TSV   =====
        Ext.Print(
            "[S7:Config - BootstrapServer.lua] --- Exporting StatIDs to " ..
                S7_ConfigSettings.ExportStatIDtoTSV.FileName
        )
        S7_StatsExportTSV() --  Logs statIDs in an external TSV file for reference
    elseif Signal == "S7_Config_CHANGELOG" then --  =====   CHANGELOG   =====
        Osi.Proc_S7_Config_ChangelogRequest()
    end
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  #############################
--      STATS CONFIG AND SYNC
--  #############################

--  STATS-CONFIGURATOR
--  ==================

function S7_StatsConfigurator(JSONstring) --  Recieves stringified JSON from Ext.LoadFile(), Osiris or a mod.
    if (type(JSONstring) == "string") and (JSONstring ~= "") and (JSONstring ~= "{}") then --  if json file exists and is not empty.
        local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON loaded. Applying Configuration Profile.\n")

        Ext.Print("=============================================================")
        for name, content in pairs(JSONborne) do --  Iterate over JSONborne.
            Ext.Print(name)
            Ext.Print("-------------------------------------------------------------")

            local stat = Ext.GetStat(name) --  Gets original stat-entry.
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
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Configuration Profile Active.")
        S7_SetDialogVars("StatsConfigurator", "Configuration Profile Activated.")
    else
        Ext.PrintError("[S7:Config - BootstrapServer.lua] --- JSON file could not be loaded.")
    end
    S7_StatsSynchronize() --  Synchronize stats for all clients.
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

    if S7_ConfigSettings.BypassSafetyCheck == true then --  Manual-Override setting is true.
        return true --  S7_SafeToModify() returns true for everything.
    else -- Default Setting
        for i, avoid in ipairs(dontFwith) do --  Iterate over keys to avoid.
            if key == avoid then --  If key matches.
                return false --  Stop it right there.
            else
                return true --  else continue.
            end
        end
    end
end

--  STATS-SYNCHRONIZE
--  =================

function S7_StatsSynchronize()
    if type(next(toSync)) ~= "nil" then --  Stats were modified. toSync is not empty.
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
        Ext.PrintWarning("[S7:Config - BootstrapServer.lua] --- Nothing to Synchronize. toSync queue is empty.")
        S7_SetDialogVars(
            "SyncStat",
            "Nothing to Synchronize. toSync queue is empty. Use S7_ConfigSettings.json to specify stats."
        )
    end
end

--  ################################
--        AUXILIARY FUNCTIONS
--  ################################

--  SET DIALOG VARS
--  ===============

function S7_SetDialogVars(dialogVar, dialogVal)
    local dialogCase = {
        ["StatsConfigurator"] = "S7_Config_StatsConfiguratorResponse_68b60e77-cbff-460d-8a78-5a264fe0bbcb",
        ["Settings"] = "S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6",
        ["ExportStats"] = "S7_Config_ExportedStats_e59ebc61-6f13-4e91-9200-36e474113c48",
        ["SyncStat"] = "S7_Config_SyncStat_7506390a-9fa8-4300-8abd-5dc476e6b917"
    }

    for dialogName, dialogVariable in pairs(dialogCase) do
        if dialogVar == dialogName then
            Osi.DialogSetVariableFixedString("S7_Config_ModMenu", dialogVariable, dialogVal)
        end
    end
end

--  EXPORT STATS TO TSV
--  ===================

function S7_StatsExportTSV() --  Fetches literally every stat and exports to TSV.
    Ext.SaveFile(S7_ConfigSettings.ExportStatIDtoTSV.FileName, "") --  Creates an empty TSV or Overwrites the existing one.
    local SaveAllStatsToFile = "S.No\tType\tStatID\n" --  Header Column.

    local allStat = {} --  Initialize temporary table.
    if type(next(S7_ConfigSettings.ExportStatIDtoTSV.RestrictStatTypeTo)) == "nil" then --  No restrictions in settings.
        allStat = Ext.GetStatEntries() --  Get All Stat Entries
    else
        for i, statType in ipairs(S7_ConfigSettings.ExportStatIDtoTSV.RestrictStatTypeTo) do --  Only selected statTypes are loaded.
            local limitedStats = Ext.GetStatEntries(statType)
            for j, stats in ipairs(limitedStats) do
                table.insert(allStat, stats) --  appends selected stat-type entries to allStat.
            end
        end
    end

    for key, value in ipairs(allStat) do
        local type = NRD_StatGetType(value) --  Didn't I just filter stats by statType? - this is what happens when you return to old code with new ideas.
        SaveAllStatsToFile = SaveAllStatsToFile .. key .. "\t" .. type .. "\t" .. value .. "\n" --  Tab Separated Values format.
    end
    Ext.SaveFile(S7_ConfigSettings.ExportStatIDtoTSV.FileName, SaveAllStatsToFile) --  Save TSV file.
    S7_SetDialogVars("ExportStats", "Stats Exported to TSV.")
end

--  INSPECT SKILL
--  =============

local function S7_InspectStats(StatID, StatType) --  Recieves StatID and StatType from Osiris.
    local compareStat = Ext.GetStatEntries(StatType) --  Retrieves all stat entries of corresponding stat-type for comparison.
    for name, content in pairs(compareStat) do --  Iterate over compareStat.
        if content == StatID then
            Ext.Print("[S7:Config - BootstrapServer.lua] --- Inspected: (" .. StatType .. "): " .. StatID)
        end
    end
end

--  =================================================================================
Ext.NewCall(S7_InspectStats, "S7_InspectStats", "(STRING)_StatID, (STRING)_StatType")
--  =================================================================================

--  ########################################################################################################################################
