--  ========
--  MEMOIZER
--  ========

---@class Memoizer
---@field CacheFile string CacheFile Name
---@field Cache table<string, any>
---@field Resolvers table<string, function|any>
Memoizer = {
    CacheFile = "",
    Cache = {},
    Resolvers = {}
}

---Initialize Memoizer
---@param object table|nil
---@return table
function Memoizer:Init(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---Adds a resolver function for alias
---@param alias string
---@param resolver function
function Memoizer:AddResolver(alias, resolver) self['Resolvers'] = {[alias] = resolver} end

---Use Memo
---@param alias string
---@param fallback function
---@return any
function Memoizer:UseMemo(alias, fallback, ...)
    local ret
    if not self['Resolvers'][alias] then self:AddResolver(alias, fallback) end
    if self['Cache'][alias] then ret = self['Cache'][alias]
    else
        self['Cache'][alias] = type(self['Resolvers'][alias]) == 'function' and self['Resolvers'][alias](...) or self['Resolvers'][alias]
        ret = self['Cache'][alias]
    end
    if not IsValid(ret) then ret = type(fallback) == 'function' and fallback(...) or fallback end
    return ret
end

---Forgets target Memo
---@param alias string
---@param thorough boolean
function Memoizer:ScrapMemo(alias, thorough)
    if not self['Cache'][alias] then return end
    if thorough then self['Cache'][alias] = nil; self['Resolvers'][alias] = nil;
    else self['Cache'][alias] = nil end
end

---Forgets all Memos
---@param thorough boolean
function Memoizer:ScrapAll(thorough)
    for key, _ in pairs(self.Cache) do
        if thorough then self['Cache'][key] = nil; self['Resolvers'][key] = nil
        else self['Cache'][key] = nil end
    end
end

---Sets the CacheFile's Name
---@param fileName string
function Memoizer:SetCacheFile(fileName)
    if type(fileName) ~= 'string' then return end
    self.CacheFile = fileName or ""
end

---Saves to  CacheFile
---@param fileName string
function Memoizer:SaveCache(fileName)
    local fileName = fileName or self.CacheFile
    local file = LoadFile(fileName)
    file.Cache = Integrate(file.Cache, self.Cache)
    SaveFile(fileName, file)
end

---Loads from CacheFile
---@param fileName string
---@param ctx string|nil
function Memoizer:LoadCache(fileName, ctx)
    local fileName = fileName or self.CacheFile
    local file = LoadFile(fileName)
    self.Cache = Integrate(self.Cache, file.Cache)
end