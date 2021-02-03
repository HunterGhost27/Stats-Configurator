--  ============
--  EXTRACT KEYS
--  ============

---Extracts a list of keys from a table
---@param t table Target table
---@return table keys Array of keys
function ExtractKeys(t)
    local keys = {}
    if type(t) ~= 'table' then return end
    for key, _ in pairs(t) do table.insert(keys, key) end
    return keys
end

--  ===================
--  DESTRINGIFY NUMBERS
--  ===================

--- Destringifies keys that should be numbers
---@param t table
function Destringify(t)
    if type(t) ~= 'table' then return end
	for key, value in pairs(t) do
        if type(value) == "table" then Destringify(value) end
		if type(key) ~= "number" then
			local n = tonumber(key)
			if n then t[n] = value; t[key] = nil end
		end
	end
end

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

    for k, _ in pairs(t) do if type(k) == 'number' then keys[#keys + 1] = k end end
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

--  ====================
--  VALIDATE INPUT TABLE
--  ====================

---Checks if target is a table and has required fields
---@param target any Input-parameter to validate
---@param toValidate string[] Array of keys
---@return boolean
function ValidInputTable(target, toValidate)
    if type(target) ~= 'tbl' then else Debug:Error('Input-parameter needs to be a table') return end
    if toValidate then
        for _, val in pairs(toValidate) do
            if not IsValid(target[val]) then
                Debug:Error('Please provide valid: ' .. tostring(val))
                return false
            end
        end
    end
    return true
end

--  ========
--  EQUALITY
--  ========

---Checks equality of tables
---@param target table
---@param source table
---@return boolean res
function IsEqual(target, source)
    local tar = target or {}
    local src = source or {}
    return Ext.JsonStringify(Rematerialize(tar)) == Ext.JsonStringify(Rematerialize(src))
end

--  =============
--  DESTRUCTURING
--  =============

---Destructure a table
---@param tar table Target table
---@param t table Keys[] to destructure
function Destructure(tar, t)
    if type(t) ~= 'table' then return end
    local temp = {}
    for idx, key in Spairs(t) do
        if type(tar[key]) == 'table' then temp[idx] = Destructure(tar[key], t) end
        if tar[key] then temp[idx] = tar[key] end
    end
    return table.unpack(temp)
end

--  ======
--  FILTER
--  ======

---Higher-Order Filter Method
---@param t table
---@param callback function Takes `Key` and `Value` as arguments
---@return table filtered Filtered table
function Filter(t, callback)
    local filtered = {}
    if type(t) ~= 'table' then return end
    for key, value in pairs(t) do
        if callback(key, value, t) then filtered[key] = value end
    end
    return filtered
end

--  ===
--  MAP
--  ===

---Higher-Order Map Method
---@param t table
---@param callback function Takes `Key` and `Value` as arguments
---@param recursive boolean Recursion `true` or `false`
---@return table mapped Mapped table
function Map(t, callback, recursive)
    if type(t) ~= 'table' then return end
    local mapped = {}
    local recursive = recursive or false

    for key, value in pairs(Rematerialize(t)) do
        local newKey, newValue = key, value
        if type(value) == 'table' then newValue = recursive and Map(value, callback, recursive) or value
        else newKey, newValue = callback(key, value, recursive) end
        mapped[newKey] = newValue
    end
    return mapped
end

--  ========
--  FOR EACH
--  ========

---Execute callback ForEach entry
---@param t table
---@param callback function
function ForEach(t, callback)
    if type(t) ~= 'table' then return end
    for key, value in pairs(t) do
        callback(key, value, t)
    end
end

--  ======
--  REDUCE
--  ======

---Higher Order Reduce Method
---@param t table
---@param prop any Property
---@param callback function
---@param initialProp any Default Value of prop
---@return any prop
function Reduce(t, prop, callback, initialProp)
    local prop = prop or initialProp
    for key, value in pairs(t) do
        prop = callback(prop, key, value, t)
    end
    return prop
end

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

--  =====
--  TRACE
--  =====

---Returns the value at address
---@param t table
---@param address string
---@return any
function Trace(t, address)
    local adr = table.pack(Disintegrate(address, '.'))
    local seek = table.remove(adr, 1)
    local ret
    if type(t[seek]) == 'table' then
        if adr[1] then
            ret = Trace(t[seek], table.concat(adr, '.'))
        else ret = t[seek] end
    else ret = t[seek] end
    return ret
end

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
