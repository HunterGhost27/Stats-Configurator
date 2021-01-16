--  ================
--  SETTINGS MANAGER
--  ================

---@class Settings @Mod-Settings
Settings = {}
Settings = Integrate(MODINFO.DefaultSettings, MODINFO.ModSettings)

---Updates Settings
---@param settings Settings
function Settings:Update(settings, default)
    local settings = settings or {}
    for key, value in pairs(default) do
        if type(value) == 'table' then Settings:Update(self[key], settings[key], value) end
        if self[key] == settings[key] then break end
        if settings[key] == false then self[key] = false end
        self[key] = settings[key] or value
    end
end
