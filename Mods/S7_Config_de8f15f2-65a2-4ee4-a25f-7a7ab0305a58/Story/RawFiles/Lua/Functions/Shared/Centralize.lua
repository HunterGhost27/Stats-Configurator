--  ==========
--  CENTRALIZE
--  ==========

---@class CENTRAL @Holds information about my mods
CENTRAL = {}
CENTRAL[IDENTIFIER] = {
    ["Author"] = MODINFO.Author,
    ["Name"] = MODINFO.Name,
    ["UUID"] = MODINFO.UUID,
    ["Version"] = MODINFO.Version,
    ["ModVersion"] = MODINFO.ModVersion or "0.0.0.0",
    ["ModSettings"] = MODINFO.ModSettings or {},
}

---Loads `S7Central.json` and updates information
---@return CENTRAL
function CENTRAL:Load()
    local file = LoadFile('S7Central.json') or {}
    self = Integrate(self, file)
    Settings:Update(self[IDENTIFIER].ModSettings)
    return self
end

---Synchronizes CENTRAL information and MODINFO
function CENTRAL:Sync() for key, _ in pairs(self[IDENTIFIER]) do if IsValid(MODINFO[key]) then self[IDENTIFIER][key] = MODINFO[key] end end end

---Saves CENTRAL information in `S7Central.json`
function CENTRAL:Save() SaveFile('S7Central.json', Rematerialize(self)) end

---Loads, Syncs and Saves CENTRAL
function CENTRAL:ReSync() self:Load(); self:Sync(); self:Save() end