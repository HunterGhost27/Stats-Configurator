--  ==========
--  CENTRALIZE
--  ==========

CENTRAL = {}
CENTRAL[IDENTIFIER] = {
    ["Author"] = MODINFO.Author,
    ["Name"] = MODINFO.Name,
    ["UUID"] = MODINFO.UUID,
    ["Version"] = MODINFO.Version,
    ["ModVersion"] = MODINFO.ModVersion or "0.0.0.0",
    ["ModSettings"] = MODINFO.ModSettings or {},
}

function CENTRAL:Load()
    local file = LoadFile('S7Central.json') or {}
    self = Integrate(self, file)
    Settings:Update(self[IDENTIFIER].ModSettings)
    return self
end

function CENTRAL:Sync()
    for key, _ in pairs(self[IDENTIFIER]) do
        if IsValid(MODINFO[key]) then
            self[IDENTIFIER][key] = MODINFO[key]
        end
    end
end

function CENTRAL:Save() SaveFile('S7Central.json', Rematerialize(self)) end
function CENTRAL:ReSync() self:Load(); self:Sync(); self:Save() end