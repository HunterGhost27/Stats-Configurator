--  =========================
--  VALIDATE NON-EMPTY STRING
--  =========================

--- Check validity of string.
---@param str any
function ValidString(str)
    if type(str) == "string" and str ~= "" and str ~= "{}" and str ~= "[]" then return true
    else return false end
end

--  =========
--  INTEGRATE
--  =========

--- Merge source and target. Existing source elements have priority.
---@param target table
---@param source table
---@return table source
function Integrate(target, source)
    local source = source or {}
    if type(target) ~= "table" then return source end

    for key, value in pairs(target) do
        if type(value) == "table" then
            if not source[key] then source[key] = {} end
            source[key] = Integrate(value, source[key])
        end
        source[key] = source[key] or value
    end

    return source
end

--  =============
--  REMATERIALIZE
--  =============

--- Clone an element
---@param element any Element to copy
---@param config table Configuration table
---@return any element Rematerialized element
function Rematerialize(element, config, clones)
    config = Integrate({["metatables"] = false, ['nonstringifiable'] = false}, config)
    clones = clones or {}
    local clone = {}

    if type(element) == "table" then
        if clones[element] then clone = clones[element]
        else
            clone = {}
            clones[element] = clone
            for key, value in next, element do clone[Rematerialize(key, clones)] = Rematerialize(value, clones) end
            if config.metatables then setmetatable(clone, Rematerialize(getmetatable(element), clones)) end   --  Copy metatables
        end
    else clone = element end    --  if element is anything other than a table, return as is

    if type(element) == "function" or type(element) == "userdata" or type(element) == "thread" then
        if config.nonstringifiable then clone = element else clone = nil end
    end

    return clone
end

--  ===================
--  DESTRINGIFY NUMBERS
--  ===================

--- Destringifies keys that should be numbers
---@param t table
function Destringify(t)
	for key, value in pairs(t) do
        if type(value) == "table" then Destringify(value) end
		if type(key) ~= "number" then
			local n = tonumber(key)
			if n then t[n] = value; t[key] = nil end
		end
	end
end

--  ===========
--  DEBUG PRINT
--  ===========

S7Debug = {
    ['IDENTIFIER'] = IDENTIFIER,
    ['printFunction'] = Ext.Print,
    ['ignoreDevMode'] = false,
    ['highlight'] = "",
}

function S7Debug:Update(t) self = Integrate(self, t) end

--- Debug Print
---@param t table Table of elements
---@param config table Configuration table
function S7Debug:Print(t, config)
    local x = {}
    local config = Integrate(self, config)
    if type(t) ~= 'table' then x[1] = t else x = Rematerialize(t) end

    if Ext.IsServer() and ValidString(config.dialogVar) then DialogVars[config.dialogVar] = config.dialogVal or tostring(x[1]) end

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
function S7Debug:FPrint(t, config) self:Print(t, Integrate({['ignoreDevMode'] = true}, config)) end
function S7Debug:HFPrint(t, config) self:Print(t, Integrate({['ignoreDevMode'] = true, ['highlight'] = '='}, config)) end

function S7Debug:Warn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning}, config)) end
function S7Debug:FWarn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning, ['ignoreDevMode'] = true}, config)) end
function S7Debug:HFWarn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning, ['ignoreDevMode'] = true, ['highlight'] = '='}, config)) end

function S7Debug:Error(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError}, config)) end
function S7Debug:FError(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError, ['ignoreDevMode'] = true}, config)) end
function S7Debug:HFError(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintError, ['ignoreDevMode'] = true, ['highlight'] = '*'}, config)) end

--  ==============
--  SORT-&-ITERATE
--  ==============

--- Sort keys then iterate following a order
---@param t table Table to iterate over
---@param order string|function "ascending", "descending" or a custom function for table.sort
function Spairs(t, order)
    if type(t) ~= "table" then return end

    local keys = {}
    if type(order) == 'string' then order = string.lower(order) end

    for k, _ in pairs(t) do keys[#keys + 1] = k end
    if order == "ascending" then table.sort(keys, function(a, b) return tonumber(a) < tonumber(b) end)
    elseif order == "descending" then table.sort(keys, function(a, b) return tonumber(a) > tonumber(b) end)
    elseif type(order) == 'function' then table.sort(keys, function(a, b) return order(t, a, b) end)
    else table.sort(keys) end

    local i = 0
    return function ()
        i = i + 1
        if keys[i] then return keys[i], t[keys[i]] end
    end
end

--  =========
--  LOAD FILE
--  =========

--- Load file contents
---@param fileName string FilePath
---@param context string PathContext. 'data' for modData. 'user' or nil for osirisData
---@return table file Parsed file contents
---@return string fileContents Stringified file contents
function LoadFile(fileName, context)
    local file
    local _, fileContents = pcall(Ext.LoadFile, fileName, context)
    if ValidString(fileContents) then file = Ext.JsonParse(fileContents) end
    return file, fileContents
end

--  =========
--  SAVE FILE
--  =========

--- Save file
---@param fileName string FilePath
---@param contents any File Contents to save
function SaveFile(fileName, contents)
    if ValidString(fileName) then
        local fileContents = type(contents) == 'table' and Ext.JsonStringify(Rematerialize(contents)) or tostring(contents) or ""
        Ext.SaveFile(fileName, fileContents)
    end
end