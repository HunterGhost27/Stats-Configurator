--  =============
--  FLAGS MANAGER
--  =============

--  FLAG OBJECT
--  ===========

---@class FlagObject
---@field flagName string
---@field flagType string 'Global'
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
    if not ValidInputTable(object, {'flagName'}) then return end
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
function Flags:Track(flag) self[flag.flagName] = FlagObject:New(flag) end

---Prints information about all tracked flags
function Flags:StatusReport()
    Write:SetHeader("Status Report - Flags:")
    local flags = Map(Rematerialize(self), function (flagName, flag)
       return flag.flagType .. " " .. flagName, tostring(flag.boolState)
    end)
    Write:NewLine(Yamlify(flags))
    Debug:Print(Write:Display())
end

if Ext.IsDeveloperMode() then
    ConsoleCommander:Register({
        ['Name'] = 'FlagsStatusReport',
        ['Context'] = 'Server',
        ['Description'] = "Shows status of all tracked flags",
        ['Action'] = function() Flags:StatusReport() end
    })
end
