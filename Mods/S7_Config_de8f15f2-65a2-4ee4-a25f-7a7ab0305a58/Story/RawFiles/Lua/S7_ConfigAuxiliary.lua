--  ###################################################################################################################################################
--                                                                 AUXILIARY FUNCTIONS
--  ===================================================================================================================================================
modInfo = Ext.GetModInfo("de8f15f2-65a2-4ee4-a25f-7a7ab0305a58") --  {"ProjectName": "S7_Config","ProjectUUID": "de8f15f2-65a2-4ee4-a25f-7a7ab0305a58"}
logSource = "Lua:S7_ConfigAuxiliary"
--  ###################################################################################################################################################

--  ######################
--      REMATERIALIZE
--  ######################

function S7_Rematerialize(Entity) --  Created for immediate translation of tables without the excessive for-loop spam.
    return Ext.JsonParse(Ext.JsonStringify(Entity)) --  Works maybe definitely.
end

--  ###################################################################################################################################################

toSetDialogVar = {} --  Will hold a queue of pending dialog-variable changes. DialogVars are set and subsequently cleared by S7_SetDialogVars()

--  ##################
--       SETTINGS
--  ##################

--  Default Settings
--  ================

S7_DefaultSettings = {
    ["ConfigFile"] = "S7_Config.json", --  FileName of the Configuration Profile
    ["StatsLoader"] = {["Enable"] = true, ["FileName"] = "S7_ConfigData.json"}, --  Enable stat-editing during ModuleLoading. FileName for ConfigData.
    ["SyncStatPersistence"] = false, --  Changes made with Ext.SyncStat() will be stored persistently if true.
    ["ManuallySynchronize"] = {}, --  statIDs listed here can be manually synchronized using diagnostics-option. Pretty useless all-in-all.
    ["ExportStatIDtoTSV"] = {["FileName"] = "S7_Config_AllTheStats.tsv", ["RestrictStatTypeTo"] = {}}, --  limits the export to only these statTypes. e.g. "Character", "Potions", "SkillData".
    ["BypassSafetyCheck"] = false, --  Bypasses S7_SafeToModify() and allow modification of unsupported or problematic keys.
    ["ConfigLog"] = {["Enable"] = true, ["FileName"] = "S7_ConfigLog.tsv"} --  The mod logs to an external file if true.
}

S7_ConfigSettings = S7_Rematerialize(S7_DefaultSettings) --  just to initialize S7_ConfigSettings.

--  Import Custom Settings
--  ======================

function S7_RefreshSettings() --  Overrides ConfigSettings on ModuleLoadStarted event and Player's request.
    local function S7_CustomOrDefaultSettings(settingsOverride, setting) --  Overrides ConfigSettings. CustomSettings given priority over Default.
        if settingsOverride[setting] == false then --  If a settingsOverride setting has boolean false.
            return false -- Prevents the function from returning DefaultSettings when false is a valid return value. Only nil should skip settingsOverride.
        else
            return S7_Rematerialize(settingsOverride[setting]) or S7_Rematerialize(S7_DefaultSettings[setting]) --  Return settingsOverride (if not nil) or DefaultSettings(if settingsOverride is nil).
        end
    end

    local JSONsetting = Ext.LoadFile("S7_ConfigSettings.json") or "" --  Load CustomSettings json file.
    if (type(JSONsetting) == "string") and (JSONsetting ~= "") and (JSONsetting ~= nil) then --  if json file exists and is not empty.
        local settingsOverride = Ext.JsonParse(JSONsetting) --  Parse json-string.

        for setting, value in pairs(S7_DefaultSettings) do --  Iterate for every key in DefaultSettings.
            S7_ConfigSettings[setting] = S7_CustomOrDefaultSettings(settingsOverride, setting) --  Overrides the changes, pulls the rest from Default if override omitted.
        end
        S7_ConfigLog("Custom settings applied.", nil, "Settings", "Settings: Custom")
    else
        S7_ConfigLog("Default settings applied.", nil, "Settings", "Settings: Default")
    end
end

--  =========================================================
Ext.RegisterListener("ModuleLoadStarted", S7_RefreshSettings)
--  =========================================================

--  ############################################################################################################################################

--  #######################
--  STATE-OF-THE-ART LOGGER
--  #######################

function S7_ConfigLog(...) --  Amped up DebugLog.
    local logArgs = {...} --  Multiple Arguments stored in a table.
    local logMsg = logArgs[1] or "" --  The actual log message.
    local logType = logArgs[2] or "[Log]" --  logType tags - e.g. [Warning] or [Osiris] etc.
    local dialogVar = logArgs[3] or "" --  Associated DialogVars (if any).
    local dialogVal = logArgs[4] or logMsg or "" --  Value for the corresponding dialog-var. uses logMsg if empty.

    local logCat = logSource --  logCategory defaults to this file.
    local printFunction = Ext.Print --  Default Print Function.

    local luaState = ""
    if Ext.IsServer() then
        luaState = "[Server]" --  Code running on Server.
    elseif Ext.IsClient() then
        luaState = "[Client]" --  Code running on Client.
    end

    local switchCase = {
        ["[Initializer]"] = "Osiris:Initializer",
        ["[ModVersioning]"] = "Osiris:ModVersioning",
        ["[ModMenu]"] = "Osiris:ModMenu",
        ["[Warning]"] = Ext.PrintWarning,
        ["[Error]"] = Ext.PrintError
    }
    for switch, case in pairs(switchCase) do --  Surrogate SwitchCase
        if logType == switch then --  logType match
            if type(case) == "string" then
                logCat = case --  update logSource if logType points to a string
                break
            elseif type(case) == "function" then
                printFunction = case --  update printFunction if logType points to a function
                break
            end
        end
    end

    local log = "[S7_Config" .. " - " .. logCat .. "] --- " .. logMsg --  The compiled log message.

    local dialogLog = ""

    if dialogVar ~= "" and dialogVar ~= nil then --  If associated dialogVar is specified.
        toSetDialogVar[dialogVar] = dialogVal --  Queue dialogVar
        dialogLog = dialogVar .. "\t" .. dialogVal
    end

    printFunction(log) --  prints log to Extender's Debug Console

    if S7_ConfigSettings.ConfigLog.Enable == true then
        local logHistory = "" --  Initialize the log-History.
        if Ext.LoadFile(S7_ConfigSettings.ConfigLog.FileName) == nil then --  if the file does not exist
            Ext.SaveFile(S7_ConfigSettings.ConfigLog.FileName, "State\tLogType\tLog\tDialogVariable\tDialogValue\n") --  Save file with header column
        end
        logHistory = Ext.LoadFile(S7_ConfigSettings.ConfigLog.FileName) --  If file exists - load all data into logHistory
        logHistory = logHistory .. "\n" .. luaState .. "\t" .. logType .. "\t" .. log .. "\t" .. dialogLog
        -- The compiled log history.
        Ext.SaveFile(S7_ConfigSettings.ConfigLog.FileName, logHistory) --  SaveLog in a file.
    end
end

--  =========================================================================================================================================
if Ext.IsServer() then
    Ext.NewCall(S7_ConfigLog, "S7_ConfigLog", "(STRING)_Log")
    Ext.NewCall(S7_ConfigLog, "S7_ConfigLog", "(STRING)_Log, (STRING)_LogType")
    Ext.NewCall(S7_ConfigLog, "S7_ConfigLog", "(STRING)_Log, (STRING)_LogType, (STRING)_LogDialogVar")
    Ext.NewCall(
        S7_ConfigLog,
        "S7_ConfigLog",
        "(STRING)_Log, (STRING)_LogType, (STRING)_LogDialogVar, (STRING)_LogDialogVal"
    )
end
--  =========================================================================================================================================

--  #########################################################################################################################################

--  SET DIALOG VARIABLES
--  ====================

function S7_SetDialogVars() --  Short-hand for DialogSetVariableFixedString(). Isn't called instantly so changes are applied when Osiris is available.
    local dialogCase = {
        ["StatsLoader"] = "S7_Config_StatsLoader_11670d82-a36e-4657-9868-5fdb7c86db37",
        ["StatsConfigurator"] = "S7_Config_StatsConfiguratorResponse_68b60e77-cbff-460d-8a78-5a264fe0bbcb",
        ["Settings"] = "S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6",
        ["ExportStats"] = "S7_Config_ExportedStats_e59ebc61-6f13-4e91-9200-36e474113c48",
        ["SyncStat"] = "S7_Config_SyncStat_7506390a-9fa8-4300-8abd-5dc476e6b917",
        ["SyncStatPersistence"] = "S7_SyncStatPersistence_e48a7ea1-a9e4-430e-8ccc-99fe3fcc477a",
        ["BypassSafetyCheck"] = "S7_Config_BypassSafety_06618d4e-dff1-4bfb-a0e2-14865b5dfb64",
        ["ModAddedTo"] = "S7_Config_ModAddedTo_70f2c40a-2237-4041-aed6-d1f1623d0ab6",
        ["ModID"] = "S7_Config_ModID_76d92488-990f-45d4-828a-525bf966efaa",
        ["ValidateClientConfig"] = "S7_ValidateConfigResponse_7b9be638-58ed-44ff-ab3e-6245efdee698",
        ["S7_ConfigLog"] = "S7_ConfigLog_f7d055c6-0d9c-44e8-9959-21046cc33cb5",
        ["ConfigData"] = "S7_ConfigData_50855cec-1d18-4305-9292-f47ae56735c8",
        ["ConfigFile"] = "S7_Config_ConfigFile_d1802751-5b8f-4cc2-91bb-0ed459bf920d"
    }

    --  UPDATE DIALOG-VARS
    --  ==================

    toSetDialogVar["ConfigFile"] = S7_ConfigSettings.ConfigFile
    toSetDialogVar["ConfigData"] = S7_ConfigSettings.StatsLoader.FileName

    if S7_ConfigSettings.StatsLoader.Enable == true then
        toSetDialogVar["StatsLoader"] = "Activated."
    else
        toSetDialogVar["StatsLoader"] = "Deactivated."
    end
    if S7_ConfigSettings.SyncStatPersistence == true then
        toSetDialogVar["SyncStatPersistence"] = "Activated."
    else
        toSetDialogVar["SyncStatPersistence"] = "Deactivated."
    end
    if S7_ConfigSettings.BypassSafetyCheck == true then
        toSetDialogVar["BypassSafetyCheck"] = "Activated."
    else
        toSetDialogVar["BypassSafetyCheck"] = "Deactivated."
    end
    if S7_ConfigSettings.ConfigLog.Enable == true then
        toSetDialogVar["S7_ConfigLog"] = "Activated."
    else
        toSetDialogVar["S7_ConfigLog"] = "Deactivated."
    end
    if Ext.JsonStringify(S7_ConfigSettings) == Ext.JsonStringify(S7_DefaultSettings) then
        toSetDialogVar["Settings"] = "Default"
    else
        toSetDialogVar["Settings"] = "Custom"
    end

    --  SET DIALOG-VARS
    --  ===============

    if type(next(toSetDialogVar)) ~= "nil" then --  dialogVar cache is not empty.
        for dialogVar, dialogVal in pairs(toSetDialogVar) do --  for entries in toSetDialogVar
            for dialogName, dialogVariable in pairs(dialogCase) do
                if dialogVar == dialogName then --  If entries match those in dialogCase
                    Osi.DialogSetVariableFixedString("S7_Config_ModMenu", dialogVariable, dialogVal) -- Set DialogVariables.
                end
            end
        end
    end
end

--  =====================================================
if Ext.IsServer() then
    Ext.NewCall(S7_SetDialogVars, "S7_SetDialogVars", "")
end
--  =====================================================

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

    for key, value in ipairs(allStat) do --  Iterate over allStat
        local type = NRD_StatGetType(value) --  Didn't I just filter stats by statType? - this is what happens when you return to old code with new ideas.
        SaveAllStatsToFile = SaveAllStatsToFile .. key .. "\t" .. type .. "\t" .. value .. "\n" --  Tab Separated Values format.
    end
    Ext.SaveFile(S7_ConfigSettings.ExportStatIDtoTSV.FileName, SaveAllStatsToFile) --  Save TSV files.
    S7_ConfigLog("Stats exported to TSV file.", nil, "ExportStats")
end

--  INSPECT SKILL
--  =============

local function S7_InspectStats(StatID, StatType) --  Recieves StatID and StatType from Osiris.
    local compareStat = Ext.GetStatEntries(StatType) --  Retrieves all stat entries of corresponding stat-type for comparison.
    for name, content in pairs(compareStat) do
        if content == StatID then --  if StatID exists
            S7_ConfigLog("Inspected: (" .. StatType .. "): " .. StatID)
        end
    end
end

--  =====================================================================================
if Ext.IsServer() then
    Ext.NewCall(S7_InspectStats, "S7_InspectStats", "(STRING)_StatID, (STRING)_StatType")
end
--  =====================================================================================

--  ###########################################################################################################################################################
