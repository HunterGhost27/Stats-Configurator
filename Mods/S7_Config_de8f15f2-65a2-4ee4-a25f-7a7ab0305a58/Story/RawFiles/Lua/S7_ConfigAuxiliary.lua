--  ##################################################################################################################################################
--                                                                      AUXILIARY FUNCTIONS
--  ##################################################################################################################################################

modName = "S7_Config"
fileName = "S7_ConfigAuxiliary.lua"

--  ##################
--       SETTINGS
--  ##################

dialogVarToSet = {} --  Will holds a queue of pending dialog-variable changes. DialogVars are set and subsequently cleared by S7_SetDialogVars()

--  Default Settings
--  ================

S7_DefaultSettings = {
    ["StatsLoader"] = true, --  Clients call StatsLoader() if true.
    ["ConfigFiles"] = {"S7_Config.json"}, --  A list of all the files the configurator will pull from. NOTE: S7_Config.json is the only file read by Client during ModuleLoading.
    ["SyncStatPersistence"] = false, --  Changes made with Ext.SyncStat() will be stored persistently if true.
    ["ManuallySynchronize"] = {}, --  statIDs listed here can be manually synchronized using diagnostics-option. Pretty useless all-in-all.
    ["ExportStatIDtoTSV"] = {
        ["FileName"] = "S7_Config_AllTheStats.tsv", --  FileName for ExportedStats. Configurable for configuration sake.
        ["RestrictStatTypeTo"] = {} --  limits the search to only these statTypes. e.g. Character, Potions, SkillData.
    },
    ["BypassSafetyCheck"] = false --  Bypasses S7_SafeToModify() - Prevents modification of unsupported or problematic keys.
}

S7_ConfigSettings = S7_DefaultSettings

function S7_SetDefaultSettings() --  Resets ConfigSettings to DefaultSettings listed above.
    S7_ConfigSettings = S7_DefaultSettings
    S7_DebugLog("Using default settings.", "[Lua]", "Settings", "Settings: Default")
end

--  Import Custom Settings
--  ======================

function S7_RefreshSettings() --  Overrides ConfigSettings on SessionLoaded event and Player's request.
    S7_ConfigSettings = S7_DefaultSettings --  Reset to base settings.

    local JSONsetting = Ext.LoadFile("S7_ConfigSettings.json") --  Load CustomSettings json file.
    if (type(JSONsetting) == "string") and (JSONsetting ~= "") and (JSONsetting ~= nil) then --  if json file exists and is not empty.
        local settingsOverride = Ext.JsonParse(JSONsetting) --  Parse json-string.

        for setting, value in pairs(S7_DefaultSettings) do --  Iterate for every key in DefaultSettings.
            S7_ConfigSettings[setting] = S7_CustomOrDefaultSettings(settingsOverride, setting) --  Overrides the changes, pulls the rest from Default.
        end
        S7_DebugLog("Custom settings applied.", "[Lua]", "Settings", "Settings: Custom")
    else
        S7_DebugLog("Default settings applied.", "[Lua]", "Settings", "Settings: Default")
    end
end

function S7_CustomOrDefaultSettings(settingsOverride, setting) --  Overrides ConfigSettings. CustomSettings given priority over Default.
    if settingsOverride[setting] == false then --  If a settingsOverride setting has boolean false.
        return false -- Prevents the function from returning DefaultSettings when false is a valid return value. Only nil should skips settingsOverride.
    else
        return settingsOverride[setting] or S7_DefaultSettings[setting] --  Return settingsOverride (if not nil) or DefaultSettings(if settingsOverride is nil).
    end
end

--  ===================================================
Ext.RegisterListener("StatsLoaded", S7_RefreshSettings)
--  ===================================================

--  Export Current Settings
--  =======================

function S7_ExportCurrentSettings() --  Exports the current ConfigSettings to S7_ConfigSettings.json file.
    local exportSettings = Ext.JsonStringify(S7_ConfigSettings) --  stringifies ConfigSettings.
    Ext.SaveFile("S7_ConfigSettings.json", exportSettings) --  Save json file.
    S7_DebugLog("Exporting current ConfigSettings to S7_ConfigSettings.json", "[Lua]")
end

--  ############################################################################################################################################

--  STATE-OF-THE-ART-LOGGER
--  =======================

function S7_DebugLog(...) --  Amped up DebugLog.
    local logArgs = {...} --  Multiple Arguments stored in a table.
    local logMsg = logArgs[1] or "" --  The actual log message.
    local logType = logArgs[2] or "[Log]" --  logType tags - e.g. [Warning] or [Osiris] etc.
    local dialogVar = logArgs[3] or nil --  Associated DialogVars (if any).
    local dialogVal = logArgs[4] or logMsg or "" --  Value for the corresponding dialog-var. uses logMsg if nil.

    local S7ConfigLog =
        Ext.LoadFile("S7_ConfigLog.tsv") or "LuaState\tLogType\tLog\tAssociated DialogVariable\tDialogValue"

    local luaState = ""

    if Ext.IsServer() then
        luaState = "[Server]" --  Code running on Server.
    elseif Ext.IsClient() then
        luaState = "[Client]" --  Code running on Client.
    end

    local switchLog = {
        --  LogType Special Tags.
        ["[Initializer]"] = "Osiris:Initializer",
        ["[ModVersioning]"] = "Osiris:ModVersioning",
        ["[ModMenu]"] = "Osiris:ModMenu",
        ["[Warning]"] = Ext.PrintWarning,
        ["[Error]"] = Ext.PrintError
    }

    local log = "[" .. modName .. " - " .. logSource .. "] --- " .. logMsg

    for type, switchCase in pairs(switchLog) do
        if type == LogType then
            if type(switchCase) == "string" then
                logSource = switchCase --  Rename logSource if Tags match.
                Ext.Print(log)
            elseif type(switchCase) == "function" then
                switchLog[type](log) --  Special log function
            end
        else
            Ext.Print(log)
        end
    end

    S7ConfigLog = S7ConfigLog .. "\n" .. luaState .. "\t" .. logType .. "\t" .. log

    if dialogVar ~= nil then --  If associated dialogVar specified.
        dialogVarToSet[dialogVar] = logMsg
        S7ConfigLog = S7ConfigLog .. "\t" .. dialogVar .. "\t" .. dialogVal
    end
    S7_UpdateSettingVars() --  Update DialogVars.
    Ext.SaveFile("S7_ConfigLog.tsv", S7ConfigLog) --  SaveLog in a TSV file.
end

--  =========================================================================================================================================
if Ext.IsServer() then
    Ext.NewCall(S7_DebugLog, "S7_DebugLog", "(STRING)_Log")
    Ext.NewCall(S7_DebugLog, "S7_DebugLog", "(STRING)_Log, (STRING)_LogType")
    Ext.NewCall(S7_DebugLog, "S7_DebugLog", "(STRING)_Log, (STRING)_LogType, (STRING)_LogDialogVar")
    Ext.NewCall(
        S7_DebugLog,
        "S7_DebugLog",
        "(STRING)_Log, (STRING)_LogType, (STRING)_LogDialogVar, (STRING)_LogDialogVal"
    )
end
--  =========================================================================================================================================

--  SET DIALOG VARIABLES
--  ====================

dialogCase = {
    ["StatsLoader"] = "S7_Config_StatsLoader_11670d82-a36e-4657-9868-5fdb7c86db37",
    ["StatsConfigurator"] = "S7_Config_StatsConfiguratorResponse_68b60e77-cbff-460d-8a78-5a264fe0bbcb",
    ["Settings"] = "S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6",
    ["ExportStats"] = "S7_Config_ExportedStats_e59ebc61-6f13-4e91-9200-36e474113c48",
    ["SyncStat"] = "S7_Config_SyncStat_7506390a-9fa8-4300-8abd-5dc476e6b917",
    ["SyncStatPersistence"] = "S7_SyncStatPersistence_e48a7ea1-a9e4-430e-8ccc-99fe3fcc477a",
    ["BypassSafetyCheck"] = "S7_Config_BypassSafety_06618d4e-dff1-4bfb-a0e2-14865b5dfb64",
    ["ModAddedTo"] = "S7_Config_ModAddedTo_70f2c40a-2237-4041-aed6-d1f1623d0ab6",
    ["ModID"] = "S7_Config_ModID_76d92488-990f-45d4-828a-525bf966efaa"
}

function S7_SetDialogVars() --  Short-hand for DialogSetVariableFixedString(). Isn't called instantly so changes are applied when Osiris is available.
    if Ext.OsirisIsCallable() then
        if type(next(dialogVarToSet)) ~= "nil" then --  dialogVar cache is not empty.
            for dialogVar, dialogVal in pairs(dialogVarToSet) do --  for entries in dialogVarToSet()
                for dialogName, dialogVariable in pairs(dialogCase) do
                    if dialogVar == dialogName then --  If entries match those in dialogCase
                        Osi.DialogSetVariableFixedString("S7_Config_ModMenu", dialogVariable, dialogVal) -- Set DialogVariables.
                    else
                        dialogVarToSet[dialogVar] = nil --  Remove unmatched key. To declutter dialogVarToSet queue.
                    end
                end
                dialogVarToSet[dialogVar] = nil --  Removes processed keys.
            end
        end
    end
end

--  UPDATE SETTING DIALOG-VARS
--  ==========================

function S7_UpdateSettingVars()
    if S7_ConfigSettings.StatsLoader == true then
        dialogVarToSet["StatsLoader"] = "Activated."
    else
        dialogVarToSet["StatsLoader"] = "Deactivated."
    end

    if S7_ConfigSettings.SyncStatPersistence == true then
        dialogVarToSet["SyncStatPersistence"] = "Savegame Persistence - Enabled."
    else
        dialogVarToSet["SyncStatPersistence"] = "Savegame Persistence - Disabled."
    end

    if S7_ConfigSettings.BypassSafetyCheck == true then
        dialogVarToSet["BypassSafetyCheck"] = "SafetyCheck: Disabled."
    else
        dialogVarToSet["BypassSafetyCheck"] = "SafetyCheck: Enabled."
    end

    S7_SetDialogVars()
end

--  =============================================================
if Ext.IsServer() then
    Ext.NewCall(S7_UpdateSettingVars, "S7_UpdateSettingVars", "")
end
--  =============================================================

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
    Ext.SaveFile(S7_ConfigSettings.ExportStatIDtoTSV.FileName, SaveAllStatsToFile) --  Save TSV files.
    dialogVarToSet["ExportStats"] = "Stats exported to TSV file."
end

--  INSPECT SKILL
--  =============

local function S7_InspectStats(StatID, StatType) --  Recieves StatID and StatType from Osiris.
    local compareStat = Ext.GetStatEntries(StatType) --  Retrieves all stat entries of corresponding stat-type for comparison.
    for name, content in pairs(compareStat) do --  Iterate over compareStat.
        if content == StatID then
            S7_DebugLog("Inspected: (" .. StatType .. "): " .. StatID, "[Lua]")
        end
    end
end

--  =====================================================================================
if Ext.IsServer() then
    Ext.NewCall(S7_InspectStats, "S7_InspectStats", "(STRING)_StatID, (STRING)_StatType")
end
--  =====================================================================================

--  ###########################################################################################################################################################
