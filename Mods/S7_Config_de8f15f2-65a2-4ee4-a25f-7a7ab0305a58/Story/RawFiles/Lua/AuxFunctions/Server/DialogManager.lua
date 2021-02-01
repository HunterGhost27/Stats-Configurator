--  ==============
--  DIALOG MANAGER
--  ==============

---@class DialogVar
---@field dialogVar string DialogVariable
---@field dialogVal string|function DialogVariable's value or Resolver function
---@field dialogType string DialogVariable's type

---@class Dialog
---@field Name string DialogName
---@field isAutomated integer Automated or Non-Automated Dialog
---@field isActive boolean Dialog in session
---@field instanceID number instanceID
---@field Vars table<string, DialogVar> DialogVariables
---@field Relay table<string, function> DialogActions
Dialog = {['isAutomated'] = 0}

---Instantiate new Dialog object
---@param object table
---@return Dialog
function Dialog:New(object)
    if not ValidInputTable(object, {'Name'}) then return end
    object = Integrate(self, object)
    return object
end

---Update DialogVars
---@param vars table<string, DialogVar>
function Dialog:Update(vars) self.Vars = Integrate(self.Vars, vars) end

---Set DialogVars using Osiris
---@param vars table<string, DialogVar>|nil
function Dialog:Set(vars)
    if not Ext.OsirisIsCallable() or not self.Vars then return end
    if vars then self:Update(vars) end

    local setterFunction = {
        ['String'] = Osi.DialogSetVariableString,
        ['FixedString'] = Osi.DialogSetVariableFixedString,
        ['Integer'] = Osi.DialogSetVariableInt,
        ['Float'] = Osi.DialogSetVariableFloat,
    }

    ForEach(self.Vars, function (alias, Var)
        if type(Var) ~= 'table' then return end
        local dialogVal = type(Var.dialogVal) == 'function' and Var.dialogVal() or Var.dialogVal
        if ValidString(Var.dialogType) then setterFunction[Var.dialogType](self.Name, Var.dialogVar, dialogVal)
        else Osi.DialogSetVariableFixedString(self.Name, Var.dialogVar, tostring(dialogVal)) end
    end)
end

---Register Flag actions
---@param actions table<string, function>
function Dialog:AddListeners(actions) self.Relay = Integrate(self.Relay, actions) end

---Register DialogFlag Listeners
function Dialog:RegisterListeners()
    Ext.RegisterOsirisListener('DialogStarted', 2, 'after', function (dialogName, instanceID) self.isActive = true; self.instanceID = instanceID end)
    Ext.RegisterOsirisListener('DialogEnded', 2, 'after', function (dialogName, instanceID) self.isActive = false; self.instanceID = nil end)
    Ext.RegisterOsirisListener('GlobalFlagSet', 1, 'after', function (signal)
        if not self.Relay[signal] then return end
        UserInformation:ReSync()
        self.Relay[signal]()
        self:Set()
        Osi.GlobalClearFlag(signal)
    end)
end

---Starts Dialog with character
---@param character string|nil CharacterGUID
function Dialog:Start(character)
    if not Ext.OsirisIsCallable() then return end
    local character = character or Osi.CharacterGetHostCharacter()
    if not Osi.QRY_SpeakerIsAvailable(character) then return end
    self:Set()
    Osi.Proc_StartDialog(self.isAutomated, self.Name, character)
end
