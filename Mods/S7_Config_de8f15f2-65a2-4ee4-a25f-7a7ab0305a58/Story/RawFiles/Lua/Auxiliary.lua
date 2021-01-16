----------------------------------------------------------------
--==============================================================

IDENTIFIER = 'S7_Config'

---@class MODINFO: ModInfo
---@field ModVersion string
---@field ModSettings table
---@field DefaultSettings table
---@field SubdirPrefix string
MODINFO = Ext.GetModInfo('de8f15f2-65a2-4ee4-a25f-7a7ab0305a58')
MODINFO.SubdirPrefix = "StatsConfigurator/"
MODINFO.DefaultSettings = {
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

--  ====================
--  OVERRIDE DEBUG PRINT
--  ====================

---Overrides the base Aux-Function
---@param t table Table of elements
---@param config table Configuration table
function Debug:Print(t, config)
    local x = {}
    local config = Integrate(self, config)
    if type(t) ~= 'table' then x[1] = t else x = Rematerialize(t) end

    if ValidString(config.dialogVar) then ModMenuDialog:Update({[config.dialogVar] = {['dialogVal'] = config.dialogVal or tostring(x[1])}}) end

    if Ext.IsDeveloperMode() or config.ignoreDevMode then
        local context = Ext.IsServer() and '(S)' or '(C)'
        local displayString = "[" .. config.IDENTIFIER .. context .. "] - "
        displayString = displayString .. tostring(table.remove(x, 1))
        local len = string.len(displayString)

        if ValidString(config.highlight) then config.printFunction(string.rep(config.highlight, len)) end
        if x then config.printFunction(displayString, table.unpack(x)) else config.printFunction(displayString) end
        if ValidString(config.highlight) then config.printFunction(string.rep(config.highlight, len)) end
    end
end

--  ============
--  MOD-SETTINGS
--  ============

---@class ConfigSettings: Settings
---@field ConfigFile string
---@field StatsLoader table
---@field SyncStatPersistence boolean
---@field BypassSafetyCheck boolean
---@field CustomCollections table
ConfigSettings = MODINFO.ModSettings

---  Overrides ConfigSettings on ModuleLoadStarted event and Player's request.
function RefreshSettings()
    Debug:FPrint("Synchronizing ModSettings")
    CENTRAL = LoadFile(CENTRALFILE) or {}
    ConfigSettings = Integrate(ConfigSettings, CENTRAL[IDENTIFIER].ModSettings)
    SaveFile(CENTRALFILE, Rematerialize(CENTRAL))
end

--  ======================================================
Ext.RegisterListener("ModuleLoadStarted", RefreshSettings)
--  ======================================================

--  ======
--  VARDEC
--  ======

Inspector = "S7_Config_Inspector_c5959819-25e9-4dbc-ae20-0f6283502254"