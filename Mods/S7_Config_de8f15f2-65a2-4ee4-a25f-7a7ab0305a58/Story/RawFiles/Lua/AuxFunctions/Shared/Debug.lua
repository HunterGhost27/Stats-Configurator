--  ========
--  PINPOINT
--  ========

---Returns the address of value in target table
---@param tar any Value in question
---@param tbl table Target table
---@return string point Address of deepest value
---@return table addresses Table of all addresses
function Pinpoint(tar, tbl, curr, addresses)
    if type(tbl) ~= 'table' then return end
    local point = ""
    local curr = curr or ""
    local addresses = addresses or {}
    for key, value in pairs(tbl) do
        if type(value) == 'table' then
            curr = curr .. tostring(key) .. "."
            point = Pinpoint(tar, value, curr, addresses)
        elseif tar == value then
            point = curr .. tostring(key)
            table.insert(addresses, point)
        end
    end
    return point, addresses
end

--  ====
--  SCAN
--  ====

Scan = {['level'] = 0, ['char'] = "  "}
local function encapsulate(e) return tostring(e) .. "<" .. type(e):sub(0, 3) .. ">" end

--- Prints detailed information about element to the console
function Scan:Element(e)
    if type(e) == 'table' then
        for key, value in pairs(e) do
            Ext.Print(string.rep(self.char, self.level) .. encapsulate(key) .. ": " .. encapsulate(value))
            if type(value) == 'table' then
                self.level = self.level + 1
                Scan:Element(value)
            end
        end
    else Ext.Print(string.rep(self.char, self.level) .. encapsulate(e)) end
    self.level = 0
end

--  =====
--  DEBUG
--  =====

---@class Debug @Debug Utilities
---@field IDENTIFIER string ModID
---@field printFunction function
---@field ignoreDevMode boolean
---@field highlight string
---@field dialog Dialog
Debug = {
    ['IDENTIFIER'] = IDENTIFIER,
    ['printFunction'] = Ext.Print,
    ['ignoreDevMode'] = false,
}

--- Debug Print
---@param t table Table of elements
---@param config Debug Configuration table
function Debug:Print(t, config)
    local x = {}
    local config = Integrate(self, config)
    if type(t) ~= 'table' then x[1] = t else x = Rematerialize(t) end

    if IsValid(self['dialog']) and ValidString(config.dialogVar) then
        self['dialog']:Update({[config.dialogVar] = {['dialogVal'] = config.dialogVal or tostring(x[1])}})
    end

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


