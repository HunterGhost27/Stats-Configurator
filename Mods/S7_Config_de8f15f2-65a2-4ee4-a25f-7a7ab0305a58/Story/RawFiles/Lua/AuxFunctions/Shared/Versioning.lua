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
        if string.gmatch(version, "[^.]+") then
            for v in string.gmatch(version, "[^.]+") do versionTable[#versionTable + 1] = tonumber(v) end
        else
            version = math.floor(tonumber(version))
            Version:Parse(version)
        end
    elseif type(version) == "table" then versionTable = version
    elseif type(version) == "number" then
        local major, minor, revision, build = 0, 0, 0, 0
        -- Thanks to @LaughingLeader for the following black-magic
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

---Returns Version table
---@return table
function Version:Table() return Rematerialize(self) end

---Returns formatted Version string
---@return string
function Version:String() return string.format("%s.%s.%s.%s", self[1], self[2], self[3], self[4]) end

---Checks if Version is newer than v
---@param v any
---@return boolean
function Version:IsNewerThan(v)
    local version = Version:Parse(v)
    for i, _ in Spairs(Rematerialize(self)) do if self[i] > version[i] then return true end end
    return false
end

--  ===========
--  MOD-UPDATER
--  ===========

---@class Update @Updater
---@field isRequired boolean
---@field force boolean
---@field list table List of updates
Update = {
    ['isRequired'] = false,
    ['force'] = false,
    ['list'] = {}
}

---Register Update-Event Action
---@param event string Listener Event or `'Now'`
---@param action function Update Action
function Update:Register(event, action) table.insert(self.list, {[event] = action}) end

---Checks for Update
---@param oldVer string OldVersion
---@param newVer string NewVersion
---@param forceUpdate boolean Force Update To Occur
function Update:Check(oldVer, newVer, forceUpdate)
    self.isRequired = false
    self.force = forceUpdate or false
    local oldVersion = Version:Parse(oldVer)
    local newVersion = Version:Parse(newVer)
    if newVersion:IsNewerThan(oldVer) then self.isRequired = true end
    if self.isRequired or self.force then self:Update(oldVersion, newVersion) end
end

---Update
---@param oldVersion Version
---@param newVersion Version
function Update:Update(oldVersion, newVersion)
    Debug:HFPrint("Updating " .. IDENTIFIER .. ": " .. oldVersion:String() .. " --> " .. newVersion:String())

    ForEach(self.list, function(idx, update)
        if update.event == "Now" then update.action()
        else Ext.RegisterListener(update.event, update.action) end
        self.list[idx] = nil
    end)

    self.isRequired = false
    self.force = false
end

--  =============
--  INITIAL CHECK
--  =============

local centralFile = LoadFile(CENTRALFILE) or {}
CENTRAL = Integrate(CENTRAL, centralFile)
local prevVersion = Version:Parse(CENTRAL[IDENTIFIER]["ModVersion"])
local currVersion = Version:Parse(MODINFO.Version)
Update:Check(prevVersion, currVersion)
MODINFO.ModVersion = currVersion:String()
MODINFO.ModSettings = Integrate(MODINFO.DefaultSettings, CENTRAL[IDENTIFIER].ModSettings)
CENTRALIZE()
SaveFile(CENTRALFILE, Rematerialize(CENTRAL))