--  ==========
--  CENTRALIZE
--  ==========

CENTRALFILE = 'S7Central.json'

---@class CENTRAL @Holds information about mods
CENTRAL = {}
CENTRAL[IDENTIFIER] = {
    ["Author"] = Rematerialize(MODINFO.Author),
    ["Name"] = Rematerialize(MODINFO.Name),
    ["UUID"] = Rematerialize(MODINFO.UUID),
    ["Version"] = Rematerialize(MODINFO.Version),
    ["ModVersion"] = Rematerialize(MODINFO.ModVersion) or "0.0.0.0",
    ["ModSettings"] = Rematerialize(MODINFO.ModSettings) or {},
}

---Synchronizes CENTRAL information and MODINFO
function CENTRAL:Sync()
    for key, _ in pairs(self[IDENTIFIER]) do
        if IsValid(MODINFO[key]) then
            self[IDENTIFIER][key] = Rematerialize(MODINFO[key])
        end
    end
end
