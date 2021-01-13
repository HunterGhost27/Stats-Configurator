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

ConfigSettings = MODINFO.ModSettings

---  Overrides ConfigSettings on ModuleLoadStarted event and Player's request.
function RefreshSettings()
    local dialogVal = "Settings: Default"
    CENTRAL = CENTRAL:Load()
    Debug:HFPrint("Synchronizing ModSettings")
    for setting, value in pairs(DefaultSettings) do
        if ConfigSettings[setting] ~= DefaultSettings[setting] then
            ConfigSettings[setting] = Rematerialize(value)
            Debug:FPrint(setting .. ": " .. Ext.JsonStringify(value))
            dialogVal = "Settings: Custom"
        end
    end
    CENTRAL:Sync()
    CENTRAL:Save()
    Debug:Print("Synchronized ModSettings", {['dialogVar'] = "Settings", ['dialogVal'] = dialogVal}) -- Handle DialogVars in Debug:Print as Config:Print
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