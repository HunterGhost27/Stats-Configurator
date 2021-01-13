--  ===========
--  MOD-UPDATER
--  ===========

Update = {
    ['isRequired'] = false,
    ['force'] = false,
    ['list'] = {}
}

---Register Update Event Action
---@param event string Listener Event or `"Now"`
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

    for idx, update in pairs(self.list) do
        if update.event == "Now" then update.action()
        else Ext.RegisterListener(update.event, update.action) end
        self.list[idx] = nil
    end

    self.isRequired = false
    self.force = false
end

--  =============
--  INITIAL CHECK
--  =============

CENTRAL = CENTRAL:Load()
local prevVersion = Version:Parse(CENTRAL[IDENTIFIER]["ModVersion"])
local currVersion = Version:Parse(MODINFO.Version)
Update:Check(prevVersion, currVersion)
MODINFO.ModVersion = currVersion:String()
CENTRAL:Sync()
CENTRAL:Save()