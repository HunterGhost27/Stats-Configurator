--  =============
--  FLAGS MANAGER
--  =============

--  FLAG OBJECT
--  ===========

---@class FlagObject
---@field flagName string
---@field flagType string 'Global', 'Item', 'Character'
---@field state number 0 or 1
---@field boolState boolean false or true
FlagObject = {
    ['flagName'] = '',
    ['flagType'] = 'Global',
    ['state'] = 0,
    ['boolState'] = false
}

---Instantiate new FlagObject
---@param object table
---@return FlagObject
function FlagObject:New(object)
    local object = object or {}
    object = Integrate(self, object)
    return object
end

---Updates and returns the FlagObject
---@return FlagObject self
function FlagObject:Get()
    self.state = Osi.GlobalGetFlag(self.flagName)
    self.boolState = self.state == 1 and true or false
    return self
end

---Sets the Flags Value
function FlagObject:Set() Osi.GlobalSetFlag(self.flagName) end

---Clears the corresponding Flag
function FlagObject:Clear() Osi.GlobalClearFlag(self.flagName) end

---Toggles the Flags Value
function FlagObject:Toggle() self:Get(); if self.boolState then self:Clear() else self:Set() end
end

--  FLAGS MANAGER
--  =============

---@class FlagsManager
Flags = {}

---Track new flag
---@param flag FlagObject|table
function Flags:Track(flag)
    if not ValidInputTable(flag, {'flagName'}) then return end
    self[flag.flagName] = FlagObject:New(flag)
end

---Prints information about all tracked flags
function Flags:StatusReport()
    Stringer:SetHeader("Flags:")
    for flagName, flag in pairs(self) do
        if type(flag) == 'table' then Stringer:Add(flagName .. "(" .. flag.flagType .. "): " .. tostring(flag.boolState)) end
    end
    Debug:Print(Stringer:Build())
end

if Ext.IsDeveloperMode() then
    ConsoleCommander:Register({
        ['Name'] = 'FlagsStatusReport',
        ['Context'] = 'Server',
        ['Description'] = "Shows status of tracked flags",
        ['Action'] = function() Flags:StatusReport() end
    })
end
