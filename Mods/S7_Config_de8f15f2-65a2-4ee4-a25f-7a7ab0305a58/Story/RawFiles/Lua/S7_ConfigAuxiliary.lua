--  ################################
--        AUXILIARY FUNCTIONS
--  ################################

--  ================================
Ext.Require("S7_ConfigSettings.lua")
--  ================================

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
        ["BypassSafetyCheck"] = "S7_Config_BypassSafety_06618d4e-dff1-4bfb-a0e2-14865b5dfb64"
    }

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
    Ext.Print("[S7:Config - S7_ConfigAuxiliary.lua] -- Updating Settings/Dialog Variables.")
end

--  ==========================================================
Ext.NewCall(S7_UpdateSettingVars, "S7_UpdateSettingVars", "")
--  ==========================================================

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
            Ext.Print("[S7:Config - S7_ConfigAuxiliary.lua] --- Inspected: (" .. StatType .. "): " .. StatID)
        end
    end
end

--  =================================================================================
Ext.NewCall(S7_InspectStats, "S7_InspectStats", "(STRING)_StatID, (STRING)_StatType")
--  =================================================================================

--  ###########################################################################################################################################################
