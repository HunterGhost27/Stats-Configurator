--  ================
--  SETTINGS MANAGER
--  ================

Settings = Integrate(DefaultSettings, MODINFO.ModSettings)

function Settings:Sync()
    MODINFO.ModSettings = self
    PersistentVars.Settings = Rematerialize(self)
end

function Settings:Load()
    CENTRAL = LoadFile('S7Central.json') or {}
    self:Update(CENTRAL[IDENTIFIER].ModSettings)
end

function Settings:Update(settings)
    local settings = settings or {}
    self = Integrate(self, settings)
    self:Sync()
end

--  ================================================
Ext.RegisterListener('SessionLoaded', Settings.Sync)
--  ================================================
