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

function S7_SetDefaultSettings() --  Resets ConfigSettings to DefaultSettings listed above.
    S7_ConfigSettings = S7_DefaultSettings
    Ext.Print("[S7:Config - S7_ConfigSettings.lua] --- Using default settings.")
    dialogVarToSet["Settings"] = "Settings: Default"
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
        Ext.Print("[S7:Config - S7_ConfigSettings.lua] --- Custom settings applied.")
        dialogVarToSet["Settings"] = "Settings: Custom"
    else
        Ext.Print("[S7:Config - S7_ConfigSettings.lua] --- Using default settings.")
        dialogVarToSet["Settings"] = "Settings: Default"
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
    Ext.Print("[S7:Config - S7_ConfigSettings.lua] --- Exporting current ConfigSettings to S7_ConfigSettings.json")
end

--  ############################################################################################################################################
