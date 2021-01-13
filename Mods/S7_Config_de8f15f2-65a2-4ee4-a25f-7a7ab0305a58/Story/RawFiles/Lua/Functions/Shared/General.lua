--  ===========
--  VALID VALUE
--  ===========

---Checks if value is meaningful. `if IsValid(value) then` is stricter than `if value then`
---@param value any
---@return boolean
function IsValid(value)
    if type(value) == 'nil' then return false
    elseif type(value) == 'boolean' then return value
    elseif type(value) == 'number' then if value == 0 then return false else return true end
    elseif type(value) == 'string' then return ValidString(value)
    elseif type(value) == 'function' or type(value) == 'thread' or type(value) == 'userdata' then return true
    elseif type(value) == 'table' then if value == {} then return false else return true end
    else return value end
end

--  ============
--  DISINTEGRATE
--  ============

---Disintegrate element into pieces
---@param element string|table
---@param separator string String separator. Default: `" "`
function Disintegrate(element, separator)
    if type(element) ~= 'string' and type(element) ~= 'table' then return end

    local pieces = {}
    local separator = separator or " "
    if type(element) == 'table' then pieces = element end
    if type(element) == 'string' then for split in string.gmatch(element, "[^" .. separator .. "]+") do pieces[#pieces + 1] = split end end
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
    config = Integrate({["metatables"] = false, ['nonstringifiable'] = false}, config)
    clones = clones or {}
    local clone = {}

    if type(element) == "table" then
        if clones[element] then clone = clones[element]
        else
            clone = {}
            clones[element] = clone
            for key, value in next, element do clone[Rematerialize(key, clones)] = Rematerialize(value, clones) end
            if config.metatables then setmetatable(clone, Rematerialize(getmetatable(element), clones)) end
        end
    else clone = element end

    if type(element) == "function" or type(element) == "userdata" or type(element) == "thread" then
        if config.nonstringifiable then clone = element else clone = nil end
    end

    return clone
end
