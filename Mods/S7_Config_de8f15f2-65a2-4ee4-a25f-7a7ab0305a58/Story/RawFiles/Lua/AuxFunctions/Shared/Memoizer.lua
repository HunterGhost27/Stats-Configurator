--  ========
--  MEMOIZER
--  ========

---@class Memo
---@field Val any
---@field Resolver function
Memo = {}

---@class Memoizer
Memoizer = {}

---Initialize Memoizer
---@param object any
---@return table
function Memoizer:Init(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---Create new Memo
---@param alias string
---@param resolver function
function Memoizer:CreateMemo(alias, resolver) self[alias] = {['Resolver'] = resolver} end

---Use Memo
---@param alias string
---@param fallback function
---@return any
function Memoizer:UseMemo(alias, fallback, ...)
    if not self[alias] then self:CreateMemo(alias, fallback) end
    local ret
    if IsValid(self[alias]['Val']) then ret = self[alias]['Val']
    else
        self[alias]['Val'] = type(self[alias]['Resolver']) == 'function' and self[alias]['Resolver'](...) or self[alias]['Resolver']
        ret = self[alias]['Val']
    end
    if not IsValid(ret) then ret = type(fallback) == 'function' and fallback(...) or fallback end
    return ret
end

---Forgets target Memo
---@param alias string
---@param thorough boolean
function Memoizer:ScrapMemo(alias, thorough)
    if not self[alias] then return end
    if thorough then self[alias] = nil
    else self[alias]['Val'] = nil end
end

---Forgets all Memos
---@param thorough boolean
function Memoizer:ScrapAll(thorough)
    for key, _ in pairs(self) do
        if thorough then self[key] = nil
        else self[key]['Val'] = nil end
    end
end