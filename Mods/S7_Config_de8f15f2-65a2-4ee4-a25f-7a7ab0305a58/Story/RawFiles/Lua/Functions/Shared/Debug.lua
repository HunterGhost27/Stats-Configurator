--  ========
--  PINPOINT
--  ========

---Returns the index of value in target table
---@param val any Value in Question
---@param tar table Target Table
---@return any key Index of Value
function Pinpoint(val, tar, curr)
    if type(tar) ~= 'table' then return end
    local curr = curr or ""
    local point = ""
    for key, value in pairs(tar) do
        if val == value then
            point = curr .. tostring(key)
        end
    end
    for key, value in pairs(tar) do
        if type(value) == 'table' then
            curr = curr .. tostring(key) .. "."
            point = Pinpoint(val, value, curr)
        end
    end
    return point
end

--  ====
--  SCAN
--  ====

Scan = {["level"] = 0}
local function encapsulate(e) return tostring(e) .. "<" .. type(e):sub(0, 3) .. ">" end

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

--  =====
--  DEBUG
--  =====

---@class Debug @Debug Utilities
Debug = {
    ['IDENTIFIER'] = IDENTIFIER,
    ['printFunction'] = Ext.Print,
    ['ignoreDevMode'] = false,
    ['highlight'] = "",
}

--- Debug Print
---@param t table Table of elements
---@param config Debug Configuration table
function Debug:Print(t, config)
    local x = {}
    local config = Integrate(self, config)
    if type(t) ~= 'table' then x[1] = t else x = Rematerialize(t) end

    if Ext.IsDeveloperMode() or config.ignoreDevMode then
        local context = Ext.IsServer() and '(S)' or '(C)'
        local displayString = "[" .. config.IDENTIFIER .. context .. "] - "
        displayString = displayString .. tostring(table.remove(x, 1))
        local len = string.len(displayString)

        if ValidString(config.highlight) then config.printFunction(string.rep(config.highlight, len)) end
        if x then config.printFunction(displayString, table.unpack(x)) else config.printFunction(displayString) end
        if ValidString(config.highlight) then config.printFunction(string.rep(config.highlight, len)) end
    end
end

---Force Prints to Console. Ignores DevMode
---@param t table Table of elements
---@param config Debug Configuration table
function Debug:FPrint(t, config)self:Print(t, Integrate({['ignoreDevMode'] = true}, config)) end

---Force Prints and Highlights. Ignores DevMode
---@param t table Table of elements
---@param config Debug Configuration table
function Debug:HFPrint(t, config) self:Print(t, Integrate({['ignoreDevMode'] = true, ['highlight'] = '='}, config)) end

---Prints warning to Console.
---@param t table Table of elements
---@param config Debug Configuration
function Debug:Warn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning}, config)) end

---Force Prints warning to Console. Ignores DevMode
---@param t table Table of elements
---@param config Debug Configuration table
function Debug:FWarn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning, ['ignoreDevMode'] = true}, config)) end

---Force Prints warning and Highlights. Ignores DevMode
---@param t table Table of elements
---@param config Debug Configuration table
function Debug:HFWarn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning, ['ignoreDevMode'] = true, ['highlight'] = '='}, config)) end

---Prints error to Console
---@param t table Table of elements
---@param config Debug Configuration table
function Debug:Error(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError}, config)) end

---Force Prints error to Console. Ignores DevMode
---@param t table Table of elements
---@param config Debug Configuration Table
function Debug:FError(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError, ['ignoreDevMode'] = true}, config)) end

---Force Prints error and Highlights. Ignores DevMode
---@param t table Table of elements
---@param config Debug Configuration table
function Debug:HFError(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError, ['ignoreDevMode'] = true, ['highlight'] = '*'}, config)) end


