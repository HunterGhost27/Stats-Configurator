--  ========
--  MEMOIZER
--  ========

---@class Memo
---@field Val any
---@field Resolver any|function
---@field Expiry string Event
Memo = {}

---@type table<string, Memo>
Memoizer = {}

function Memoizer:Init(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

function Memoizer:CreateMemo(memo)
    if type(memo) ~='table' then return end
    self = Integrate(self, memo)
end

function Memoizer:Get(var)
    if not self[var] then return end
    return self[var]['Val'] or type(self[var]['Resolver']) == 'function' and self[var]['Resolver']() or self[var]['Resolver']
end