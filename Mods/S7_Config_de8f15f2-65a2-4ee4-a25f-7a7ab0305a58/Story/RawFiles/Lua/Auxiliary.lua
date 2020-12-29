--  ------------------------------------------------------------
ModInfo = Ext.GetModInfo("de8f15f2-65a2-4ee4-a25f-7a7ab0305a58")
SubdirectoryPrefix = "StatsConfigurator/"
IDENTIFIER = "S7_Config"
--  ------------------------------------------------------------

--  ==========  GENERAL ============
Ext.Require("Auxiliary/General.lua")
--  ================================

--  ===============
--  MOD INFORMATION
--  ===============

local defaultModInfo = {
    ["Author"] = ModInfo.Author,
    ["Name"] = ModInfo.Name,
    ["UUID"] = ModInfo.UUID,
    ["Version"] = ModInfo.Version,
    ["PublishedVersion"] = ModInfo.PublishVersion,
    ["ModVersion"] = "0.0.0.0",
    ["ModSettings"] = {
        ["ConfigFile"] = "S7_Config.json", --  FileName of the Configuration Profile
        ["StatsLoader"] = {["Enable"] = true, ["FileName"] = "S7_ConfigData.json"}, --  Enable stat-editing during ModuleLoading. FileName for ConfigData.
        ["SyncStatPersistence"] = false, --  Changes made with Ext.SyncStat() will be stored persistently if true.
        ["BypassSafetyCheck"] = false, --  Bypasses SafeToModify() and allow modification of unsupported or problematic keys.
        ["CustomCollections"] = {} --  Allows users to create custom collections.
    }
}

CENTRAL = {}    --  Holds Global Settings and Information
CENTRAL = LoadFile("S7Central.json") or {}
if CENTRAL[IDENTIFIER] == nil then CENTRAL[IDENTIFIER] = Rematerialize(defaultModInfo) end

--  ==========  MOD VERSIONING  ==========
Ext.Require("Auxiliary/ModVersioning.lua")
--  ======================================

--- Initialize CENTRAL
---@param ref table Reference table
---@param tar table Target table
local function initCENTRAL(ref, tar)
    for field, value in pairs(ref) do
        if ModInfo[field] then tar[field] = Rematerialize(ModInfo[field])
        else if not tar[field] then tar[field] = Rematerialize(value) end end
        if type(value) == 'table' then initCENTRAL(value, tar[field]) end
    end
end

initCENTRAL(defaultModInfo, CENTRAL[IDENTIFIER])
CENTRAL[IDENTIFIER]["ModVersion"] = ParseVersion(ModInfo.Version, "string")
SaveFile("S7Central.json", CENTRAL)

--  ============
--  MOD-SETTINGS
--  ============

DefaultSettings = defaultModInfo.ModSettings
ConfigSettings = Rematerialize(DefaultSettings)

---  Overrides ConfigSettings on ModuleLoadStarted event and Player's request.
function RefreshSettings()
    local dialogVal = "Settings: Default"
    CENTRAL = LoadFile("S7Central.json") or {}
    S7Debug:HFPrint("Synchronizing ModSettings")
    for setting, value in pairs(DefaultSettings) do
        if ConfigSettings[setting] ~= DefaultSettings[setting] then
            ConfigSettings[setting] = value
            S7Debug:FPrint(setting .. ": " .. tostring(value))
            dialogVal = "Settings: Custom"
        end
    end
    S7Debug:Print("Synchronized ModSettings", {['dialogVar'] = "Settings", ['dialogVal'] = dialogVal})
end

--  ======================================================
Ext.RegisterListener("ModuleLoadStarted", RefreshSettings)
--  ======================================================

--  ======
--  VARDEC
--  ======

TEMPLATE = {
    ["CHANGELOG"] = "S7_Config_CHANGELOG_7b4a334e-7613-4ab9-bc21-a724519d6e6e",
    ["Inspector"] = "S7_Config_Inspector_c5959819-25e9-4dbc-ae20-0f6283502254",
}