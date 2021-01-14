--  ==============
--  DIALOG MANAGER
--  ==============

---@class DialogVar
---@field dialogVar string DialogVariable
---@field dialogVal string|function DialogVariable's value
---@field dialogType string DialogVariable's type

---@class Dialog
---@field Name string DialogName
---@field Vars table<string, DialogVar> DialogVariables
Dialog = {}

---Instantiate new Dialog object. Must specify `DialogName`.
---@param object table
---@return Dialog
function Dialog:New(object)
    if type(object) ~= 'table' or not ValidString(object.Name) then return end
    object = Integrate(self, object)
    return object
end

---Update DialogVariables
---@param vars table<string, DialogVar>
function Dialog:Update(vars) self['Vars'] = Integrate(self['Vars'], vars) end

---Set DialogVars using Osiris
---@param vars table<string, DialogVar>|nil
function Dialog:Set(vars)
    if not Ext.OsirisIsCallable() or not self['Vars'] then return end
    if vars then self:Update(vars) end

    local setterFunction = {
        ['String'] = Osi.DialogSetVariableString,
        ['FixedString'] = Osi.DialogSetVariableFixedString,
        ['Integer'] = Osi.DialogSetVariableInt,
        ['Float'] = Osi.DialogSetVariableFloat,
    }

    for alias, Var in pairs(self['Vars']) do
        if type(Var) ~= 'table' then return end
        local dialogVal = type(Var.dialogVal) == 'function' and Var.dialogVal() or Var.dialogVal
        if ValidString(Var.dialogType) then setterFunction[Var.dialogType](self.Name, Var.dialogVar, dialogVal)
        else Osi.DialogSetVariableFixedString(self.Name, Var.dialogVar, tostring(dialogVal)) end
     end
end

---Starts Dialog with character
---@param character string|nil CharacterGUID
function Dialog:Start(character)
    local character = character or Osi.CharacterGetHostCharacter()
    if not Ext.OsirisIsCallable() then return end
    if not Osi.QRY_SpeakerIsAvailable(character) then return end
    Osi.Proc_StartDialog(1, self.Name, character)
end