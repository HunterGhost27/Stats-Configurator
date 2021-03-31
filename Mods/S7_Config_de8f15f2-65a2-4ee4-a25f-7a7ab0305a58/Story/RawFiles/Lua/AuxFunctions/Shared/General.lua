--  ===========
--  VALID VALUE
--  ===========

---Checks if value is meaningful. `if IsValid(value) then` is stricter than `if value then`
---@param value any
---@return boolean
function IsValid(value)
    if type(value) == 'nil' then return false
    elseif type(value) == 'boolean' then return value
    elseif type(value) == 'number' then return value ~= 0
    elseif type(value) == 'string' then return ValidString(value)
    elseif type(value) == 'table' then return ValidString(Ext.JsonStringify(Rematerialize(value)))
    elseif type(value) == 'function' or type(value) == 'thread' or type(value) == 'userdata' then return true
    else return value end
end

--  ============
--  DISINTEGRATE
--  ============

---Disintegrate element into pieces
---@param element string|number|table
---@param separator string String separator. Default: `" "`
function Disintegrate(element, separator)
    if type(element) ~= 'string' and type(element) ~= 'table' and type(element) ~= 'number' then return end

    local pieces = {}
    local separator = ValidString(separator) and separator or " "
    if type(element) == 'table' then pieces = element end
    if type(element) == 'string' then for split in string.gmatch(element, "[^" .. separator .. "]+") do pieces[#pieces + 1] = split end end
    if type(element) == 'number' then pieces = Map(table.pack(math.modf(element)), function (key, value) return key, tonumber(tostring(value):sub(0, 4)) end)
    end
    return table.unpack(pieces)
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
    if type(target) ~= "table" then source[#source + 1] = target; return source end

    for key, value in pairs(target) do
        if type(value) == "table" then
            if not source[key] then source[key] = {} end
            source[key] = Integrate(value, source[key])
        elseif type(value) == "boolean" and source[key] == false then source[key] = false
        elseif type(value) == "string" and not ValidString(value) then source[key] = source[key]
        else source[key] = source[key] or value end
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
   config = Integrate({["metatables"] = false, ['deep'] = false}, config)
   clones = clones or {}
   local clone = {}

   if type(element) == "table" then
       if clones[element] then clone = clones[element]
       else
           clone = {}
           clones[element] = clone
           for key, value in next, element do clone[Rematerialize(key, config, clones)] = Rematerialize(value, config, clones) end
           if config.metatables then setmetatable(clone, Rematerialize(getmetatable(element), config, clones)) end
       end
   else clone = element end

   if type(element) == "function" or type(element) == "userdata" or type(element) == "thread" then
       if config.deep then clone = element else clone = nil end
   end

   return clone
end

--  ===========
--  IS CALLABLE
--  ===========

---Checks if the element is callable like a function or functable
---@param e any
---@return boolean
function IsCallable(e)
    if type(e) == 'function' then return true end
    if type(e) == 'table' then
      local mt = getmetatable(e)
      return type(mt) == 'table' and IsCallable(mt.__call)
    end
    return false
end

--  ========
--  RESOLVER
--  ========

---Resolves a resolver
---@param value any|ResolverFunction
---@return any ret Resolved value
function Resolve(value, ...)
    local ret
    if type(value) == 'function' then ret = value(...)
    else ret = value end
    if not ret then ret = false end
    return ret
end