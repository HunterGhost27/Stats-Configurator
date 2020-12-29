--  ====
--  SCAN
--  ====

Scan = {["level"] = 0}
local function encapsulate(e) return tostring(e) .. "(" .. type(e):sub(0, 3) .. ")" end

--- Prints detailed information about element to the console
function Scan:Element(e)
    if type(e) == 'table' then
        for key, value in pairs(e) do
            Ext.Print(string.rep("-", self.level) .. encapsulate(key) .. " " .. encapsulate(value))
            if type(value) == 'table' then
                self.level = self.level + 1
                Scan:Element(value)
            end
        end
    else Ext.Print(string.rep("-", self.level) .. encapsulate(e)) end
    self.level = 0
end
