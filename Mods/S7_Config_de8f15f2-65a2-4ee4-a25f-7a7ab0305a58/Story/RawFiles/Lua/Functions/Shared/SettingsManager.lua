--  ================
--  SETTINGS MANAGER
--  ================

---@class Settings @Mod-Settings
Settings = {}
DefaultSettings = DefaultSettings or {}

Settings = Integrate(DefaultSettings, MODINFO.ModSettings)

---Loads CENTRAL file and Updates settings
function Settings:Load()
    CENTRAL = CENTRAL:Load()
    self:Update(CENTRAL[IDENTIFIER].ModSettings)
end

---Updates settings on a case-by-case basis
---@param parent Settings
---@param settings Settings
---@param default Settings
local function updateSetting(parent, settings, default)
    for key, value in pairs(default) do
        if type(value) == 'table' then updateSetting(parent[key], settings[key], value) end
        if parent[key] == settings[key] then break end
        Stringer:Add(key .. ": " .. tostring{parent[key] .. " -> " .. tostring(settings[key])})
        parent[key] = settings[key] or value
    end
end

---Updates Settings
---@param settings Settings
function Settings:Update(settings)
    local settings = settings or {}
    Stringer:SetHeader('Updating Mod-Settings')
    updateSetting(self, settings, DefaultSettings)
    Debug:Print(Stringer:Build())
    self:Sync()
end

---Synchronizes Settings with MODINFO.ModSettings and PersistentVars.Settings
function Settings:Sync()
    MODINFO.ModSettings = self
    PersistentVars.Settings = Rematerialize(self)
end

---Saves Settings in CENTRAL file
function Settings:Save()
   self:Sync()
   CENTRAL:Sync()
   CENTRAL:Save()
end

--  ============================================================================================
if Ext.IsServer() then Ext.RegisterOsirisListener('GameStarted', 2, 'before', Settings.Sync) end
--  ============================================================================================
