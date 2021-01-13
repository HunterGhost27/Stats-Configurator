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

--  ===========
--  DEBUG PRINT
--  ===========

Debug = {
    ['IDENTIFIER'] = IDENTIFIER,
    ['printFunction'] = Ext.Print,
    ['ignoreDevMode'] = false,
    ['highlight'] = "",
}

--- Debug Print
---@param t table Table of elements
---@param config table Configuration table
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

function Debug:FPrint(t, config)self:Print(t, Integrate({['ignoreDevMode'] = true}, config)) end
function Debug:HFPrint(t, config) self:Print(t, Integrate({['ignoreDevMode'] = true, ['highlight'] = '='}, config)) end

function Debug:Warn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning}, config)) end
function Debug:FWarn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning, ['ignoreDevMode'] = true}, config)) end
function Debug:HFWarn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning, ['ignoreDevMode'] = true, ['highlight'] = '='}, config)) end

function Debug:Error(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError}, config)) end
function Debug:FError(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError, ['ignoreDevMode'] = true}, config)) end
function Debug:HFError(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError, ['ignoreDevMode'] = true, ['highlight'] = '*'}, config)) end
