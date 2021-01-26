--  ==========
--  CENTRALIZE
--  ==========

CENTRALFILE = 'S7Central.json'

---@class CENTRAL @Holds information about mods
CENTRAL = {}
CENTRAL[IDENTIFIER] = {
    ["Name"] = MODINFO.Name,
    ["UUID"] = MODINFO.UUID,
    ["Version"] = MODINFO.Version,
    ["ModVersion"] = MODINFO.ModVersion or "0.0.0.0",
    ["ModSettings"] = MODINFO.ModSettings or {},
}

---Synchronizes CENTRAL information and MODINFO
function CENTRALIZE()
    for key, _ in pairs(CENTRAL[IDENTIFIER]) do
        if IsValid(MODINFO[key]) then
            CENTRAL[IDENTIFIER][key] = Rematerialize(MODINFO[key])
        end
    end
end

--  ============
--  MOD SETTINGS
--  ============

MODINFO.ModSettings = {}
MODINFO.ModSettings = Integrate(MODINFO.DefaultSettings, MODINFO.ModSettings)
