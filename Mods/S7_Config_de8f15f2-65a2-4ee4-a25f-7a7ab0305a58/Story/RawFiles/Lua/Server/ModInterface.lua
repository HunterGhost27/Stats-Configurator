--  ============
--  MOD REGISTRY
--  ============

ModRegistry = {}

function ModRegistry:Register(object)
    if not ValidString(object.modUUID) then return end
    if  not ValidString(object.modFlag) then Debug:FWarn('ModRegistry: Invalid FlagName') return end
    ModRegistry[object.modUUID] = {
        ['modName'] = ValidString(object.modName) and object.modName or Ext.GetModInfo(object.UUID).Name,
        ['modUUID'] = object.modUUID,
        ['modFlag'] = object.modName
    }
end

--  =============
--  MOD INTERFACE
--  =============

ModInterface = {}

function ModInterface:Register(modName, stats)
    if not self[modName] then self[modName] = {} end
    table.insert(self[modName], stats)
end

ModRegistry:Register({
    ['modName'] = 'S7_Journal',
    ['modUUID'] = "6b1aee95-bd4c-4190-a919-4aa7096eaa2b",
    ['modFlag'] = 'S7_Notebook'
})

ModInterface:Register('S7_Journal', {
    ['Projectile_Fireball'] = {
        "ActionPoints",
        "Cooldown",
        "MemoryCost"
    },
    ['Shout_ShedSkin'] = {
        "Magic Cost",
        "ActionPoints"
    }
})