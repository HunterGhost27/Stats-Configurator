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

--  =============
--  DESTRUCTURING
--  =============

---Destructure a table
---@param tar table Target Table
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