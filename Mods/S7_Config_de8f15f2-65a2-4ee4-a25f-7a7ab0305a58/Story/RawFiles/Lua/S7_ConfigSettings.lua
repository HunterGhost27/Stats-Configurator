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
    ["BypassSafetyCheck"] = false --  Bypasses S7_SafeToModify() - Prevents modification of unsupported or problematic keys.
}

function S7_SetDefaultSettings() --  Sets ConfigSettings = DefaultSettings during SessionLoading.
    S7_ConfigSettings = S7_DefaultSettings
    Ext.Print("[S7:Config - S7_ConfigSettings.lua] --- Using default settings.")
end

--  =========================================================
Ext.RegisterListener("SessionLoading", S7_SetDefaultSettings)
--  =========================================================

--  Import Custom Settings
--  ======================

function S7_RefreshSettings() --  Overrides ConfigSettings on SessionLoaded event and Player's request.
    S7_ConfigSettings = S7_DefaultSettings --  Reset to base settings.
    local JSONsetting = Ext.LoadFile("S7_ConfigSettings.json") --  Load CustomSettings json file.
    if (type(JSONsetting) == "string") and (JSONsetting ~= "") and (JSONsetting ~= "{}") then --  if json file exists and is not empty.
        local settingsOverride = Ext.JsonParse(JSONsetting) --  Parse json-string.
        for setting, value in pairs(S7_DefaultSettings) do --  Iterate for every key in Default ConfigSettings.
            S7_ConfigSettings[setting] = S7_CustomOrDefaultSettings(settingsOverride, setting) --  Overrides the changes, pulls the rest from Default.
        end
        Ext.Print("[S7:Config - S7_ConfigSettings.lua] --- Custom settings applied.")
        Osi.DialogSetVariableFixedString(
            "S7_Config_ModMenu",
            "S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6",
            "Settings: CUSTOM"
        )
    else
        Ext.Print("[S7:Config - S7_ConfigSettings.lua] --- Using default settings.")
        Osi.DialogSetVariableFixedString(
            "S7_Config_ModMenu",
            "S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6",
            "Settings: CUSTOM"
        )
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
    Ext.Print("[S7:Config - S7_ConfigSettings.lua] --- Exporting Current ConfigSettings to S7_ConfigSettings.json")
end
