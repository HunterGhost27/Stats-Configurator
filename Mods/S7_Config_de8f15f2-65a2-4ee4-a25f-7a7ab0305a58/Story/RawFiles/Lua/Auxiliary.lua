---------------------------------------------------------------------------
--=========================================================================

IDENTIFIER = 'S7_Config'

---@class MODINFO: ModInfo
---@field ModVersion string
---@field ModSettings table
---@field DefaultSettings table
---@field SubdirPrefix string
MODINFO = Ext.GetModInfo('de8f15f2-65a2-4ee4-a25f-7a7ab0305a58')
MODINFO.SubdirPrefix = 'StatsConfigurator/'
MODINFO.DefaultSettings = {
    ['ConfigFiles'] = {'Config.json'},
    ['StatsLoader'] = {['Enable'] = true, ['FileName'] = 'ConfigData.json'},
    ['SyncStatPersistence'] = false
}

--  ========  AUX FUNCTIONS  ========
Ext.Require("AuxFunctions/Index.lua")
--  =================================

--==========================================================================
----------------------------------------------------------------------------

--  ============
--  MOD-SETTINGS
--  ============

---@class ConfigSettings
---@field ConfigFiles string[]
---@field StatsLoader table
---@field SyncStatPersistence boolean
---@field CustomCollections table
Settings = MODINFO.ModSettings

---  Overrides ConfigSettings on ModuleLoadStarted event and Player's request.
function RefreshSettings()
    Debug:FPrint("Synchronizing ModSettings")
    local centralFile = LoadFile(CENTRALFILE) or {}
    CENTRAL = Integrate(CENTRAL, centralFile)
    Settings = Integrate(Settings, CENTRAL[IDENTIFIER].ModSettings)
    SaveFile(CENTRALFILE, Rematerialize(CENTRAL))
end

--  ======================================================
Ext.RegisterListener('ModuleLoadStarted', RefreshSettings)
--  ======================================================

--  ======
--  VARDEC
--  ======

Inspector = 'S7_Config_Inspector_c5959819-25e9-4dbc-ae20-0f6283502254'