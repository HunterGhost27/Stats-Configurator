--  =========
--  YAMLIFIER
--  =========

---Creates a YAML string
---@param t any
---@param lvl number
---@return string YAML
function Yamlify(t, lvl)
    local lvl = lvl or 0
    local str = ""
    if not type(t) == 'table' then return tostring(t) end
    for key, value in pairs(t) do
        if type(value) == 'table' then str = str .. string.rep("  ", lvl) .. tostring(key) .. ":\n" .. Yamlify(value, lvl + 1)
        else str = str .. string.rep("  ", lvl) .. tostring(key) .. ": " .. tostring(value) .. "\n" end
    end
    if lvl >= 0 then lvl = lvl - 1 end
    return str
end

