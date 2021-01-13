--  ================
--  SETTINGS MANAGER
--  ================

---@class Settings @Mod-Settings
Settings = Integrate(DefaultSettings, MODINFO.ModSettings)

---Synchronizes Settings with MODINFO.ModSettings and PersistentVars.Settings
function Settings:Sync()
    MODINFO.ModSettings = self
    PersistentVars.Settings = Rematerialize(self)
end

---Loads CENTRAL file and Updates settings
function Settings:Load()
    CENTRAL = LoadFile('S7Central.json') or {}
    self:Update(CENTRAL[IDENTIFIER].ModSettings)
end

---Updates Settings
---@param settings Settings
function Settings:Update(settings)
    local settings = settings or {}
    self = Integrate(self, settings)
    self:Sync()
end

--  ============================================================================================
if Ext.IsServer() then Ext.RegisterOsirisListener('GameStarted', 2, 'before', Settings.Sync) end
--  ============================================================================================
