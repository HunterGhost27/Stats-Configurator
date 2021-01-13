----------------------------------------------------------------
--==============================================================

IDENTIFIER = 'S7_Config'

---@class MODINFO: ModInfo
---@field ModVersion string
---@field ModSettings table
---@field SubdirPrefix string
MODINFO = Ext.GetModInfo('de8f15f2-65a2-4ee4-a25f-7a7ab0305a58')
MODINFO.SubdirPrefix = "StatsConfigurator/"

DefaultSettings = {
    ["ConfigFile"] = "S7_Config.json", --  FileName of the Configuration Profile
    ["StatsLoader"] = {["Enable"] = true, ["FileName"] = "S7_ConfigData.json"}, --  Enable stat-editing during ModuleLoading. FileName for ConfigData.
    ["SyncStatPersistence"] = false, --  Changes made with Ext.SyncStat() will be stored persistently if true.
    ["BypassSafetyCheck"] = false, --  Bypasses SafeToModify() and allow modification of unsupported or problematic keys.
    ["CustomCollections"] = {} --  Allows users to create custom collections.
}

PersistentVars = {}

--  ========  AUX FUNCTIONS  =========
Ext.Require("Functions/Auxiliary.lua")
--  ==================================

--==============================================================
----------------------------------------------------------------

--  ============
--  MOD-SETTINGS
--  ============

ConfigSettings = Rematerialize(DefaultSettings)

---  Overrides ConfigSettings on ModuleLoadStarted event and Player's request.
function RefreshSettings()
    local dialogVal = "Settings: Default"
    CENTRAL = LoadFile("S7Central.json") or {}
    Debug:HFPrint("Synchronizing ModSettings")
    for setting, value in pairs(DefaultSettings) do
        if ConfigSettings[setting] ~= DefaultSettings[setting] then
            ConfigSettings[setting] = value
            Debug:FPrint(setting .. ": " .. tostring(value))
            dialogVal = "Settings: Custom"
        end
    end
    Debug:Print("Synchronized ModSettings", {['dialogVar'] = "Settings", ['dialogVal'] = dialogVal})
end

--  ======================================================
Ext.RegisterListener("ModuleLoadStarted", RefreshSettings)
--  ======================================================

--  ======
--  VARDEC
--  ======

TEMPLATE = {
    ["Inspector"] = "S7_Config_Inspector_c5959819-25e9-4dbc-ae20-0f6283502254",
}