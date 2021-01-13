--  =======
--  VERSION
--  =======

MODINFO.ModVersion = "0.0.0.0"

---@class Version
Version = {
    [1] = 0,---@type number Major
    [2] = 0,---@type number Minor
    [3] = 0,---@type number Revision
    [4] = 0---@type number Build
}

--- Parse modVersion
---@param version string|table|number
---@return Version Version
function Version:Parse(version)
    local versionTable = {}

    if type(version) == "string" then
        if string.gmatch(version, "[^.]+") ~= nil then
            for v in string.gmatch(version, "[^.]+") do versionTable[#versionTable + 1] = tonumber(v) end
        else
            version = math.floor(tonumber(version))
            Version:Parse(version)
        end
    elseif type(version) == "table" then versionTable = version
    elseif type(version) == "number" then
        local major, minor, revision, build = 0, 0, 0, 0
        version = math.tointeger(version)
        major = math.floor(version >> 28)
        minor = math.floor(version >> 24) & 0x0F
        revision = math.floor(version >> 16) & 0xFF
        build = math.floor(version & 0xFFFF)
        versionTable = table.pack(major, minor, revision, build)
	end

    versionTable = Integrate(self, versionTable)
    return versionTable
end

---Returns Version Table
---@return table
function Version:Table() return Rematerialize(self) end

---Returns Formatted Version String
---@return string
function Version:String() return string.format("%s.%s.%s.%s", self[1], self[2], self[3], self[4]) end

---Checks if Version is newer than v
---@param v any
---@return boolean
function Version:IsNewerThan(v)
    local version = Version:Parse(v)
    for i, _ in Spairs(Rematerialize(self)) do
        if self[i] > version[i] then return true end
    end
    return false
end