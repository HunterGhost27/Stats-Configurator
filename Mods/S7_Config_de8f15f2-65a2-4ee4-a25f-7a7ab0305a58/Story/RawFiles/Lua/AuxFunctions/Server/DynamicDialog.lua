--  ==============
--  DYNAMIC DIALOG
--  ==============

---@class DialogNode
---@field Text string
---@field Action function

---@class DynamicDialog: Dialog
---@field Nodes DialogNode[]
---@field State table
---@field Stage table
DynamicDialog = {}
DynamicDialog.State = {}
DynamicDialog.Stage = {}
DynamicDialog = Integrate(DynamicDialog, Dialog:New({['Name'] = 'S7_DynamicDialog'}))

function DynamicDialog:ResetState()
    self['State'] = {
        ['level'] = 1,
        ['page'] = 1,
        ['maxPage'] = 1,
        ['selectedAction'] = "",
    }
end

DynamicDialog:ResetState()

DynamicDialog:Update({
    ['S7_DynamicDialogResponse'] = {['dialogVar'] = "S7_DynamicDialogResponse_179ad34b-afc2-4d52-9c0d-3a925e8ee4f2"},
    ['S7_DynamicDialog_Opt1'] = {['dialogVar'] = "S7_DynamicDialog_Opt1_8523d721-fae5-4f64-81ee-749130f1c4eb"},
    ['S7_DynamicDialog_Opt2'] = {['dialogVar'] = "S7_DynamicDialog_Opt2_aa949336-d705-4a20-b8ff-564b381583f6"},
    ['S7_DynamicDialog_Opt3'] = {['dialogVar'] = "S7_DynamicDialog_Opt3_1c4f9b5f-907c-4b2f-b5bc-dd4f443dbf08"},
    ['S7_DynamicDialog_Opt4'] = {['dialogVar'] = "S7_DynamicDialog_Opt4_d07ece22-c225-4d76-b6e3-e94498ade0ba"},
    ['S7_DynamicDialog_Opt5'] = {['dialogVar'] = "S7_DynamicDialog_Opt5_19d98a3a-b117-4df4-b95d-9f937568ee35"},
})

DynamicDialog:AddListeners({
    ['S7_DynamicDialog_NextPage'] = function () if DynamicDialog.State.page < DynamicDialog.State.maxPage then DynamicDialog.State.page = DynamicDialog.State.page + 1 end end,
    ['S7_DynamicDialog_PrevPage'] = function () if DynamicDialog.State.page > 1 then DynamicDialog.State.page = DynamicDialog.State.page - 1 end end,
    ['S7_DynamicDialog_ExitCleanup'] = function () DynamicDialog.ResetState() end,
    ['S7_DynamicDialog_SetOpt1'] = function() DynamicDialog['Stage'][1]['Action']() end,
    ['S7_DynamicDialog_SetOpt2'] = function() DynamicDialog['Stage'][2]['Action']() end,
    ['S7_DynamicDialog_SetOpt3'] = function() DynamicDialog['Stage'][3]['Action']() end,
    ['S7_DynamicDialog_SetOpt4'] = function() DynamicDialog['Stage'][4]['Action']() end,
    ['S7_DynamicDialog_SetOpt5'] = function() DynamicDialog['Stage'][5]['Action']() end,
    ['S7_DynamicDialog_NextNode'] = function ()
        if DynamicDialog.State.level < 3 then
            DynamicDialog.State.level = DynamicDialog.State.level + 1
            DynamicDialog.State.page = 1
        end
    end,
    ['S7_DynamicDialog_GoBack'] = function ()
        if DynamicDialog.State.level > 1 then
            DynamicDialog.State.level = DynamicDialog.State.level - 1
            DynamicDialog.State.page = 1
            DynamicDialog.State.selectedAction = nil
        end
    end,
    ['S7_DynamicDialog_NextPageAvailable'] = function () end,
    ['S7_DynamicDialog_PrevPageAvailable'] = function () end,
    ['S7_DynamicDialog_AvailOpt1'] = function() end,
    ['S7_DynamicDialog_AvailOpt2'] = function() end,
    ['S7_DynamicDialog_AvailOpt3'] = function() end,
    ['S7_DynamicDialog_AvailOpt4'] = function() end,
    ['S7_DynamicDialog_AvailOpt5'] = function() end,
})

function DynamicDialog:Set(vars)
    if not Ext.OsirisIsCallable() then return end
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt1')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt2')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt3')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt4')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt5')
    for key, value in pairs(self.Stage) do
        Ext.Print(key, value.Text)
        Osi.GlobalSetFlag('S7_DynamicDialog_AvailOpt' .. tostring(key))
        self:Update({['S7_DynamicDialog_Opt' .. tostring(key)] = {['dialogVal'] = value.Text}})
    end

    if DynamicDialog.State.page == 1 and DynamicDialog.State.page ~= DynamicDialog.State.maxPage then
        Osi.GlobalClearFlag("S7_Config_PrevPageAvailable")
        Osi.GlobalSetFlag("S7_Config_NextPageAvailable")
    elseif DynamicDialog.State.page ~= 1 and DynamicDialog.State.page == DynamicDialog.State.maxPage then
        Osi.GlobalClearFlag("S7_Config_NextPageAvailable")
        Osi.GlobalSetFlag("S7_Config_PrevPageAvailable")
    elseif DynamicDialog.State.page == 1 and DynamicDialog.State.page == DynamicDialog.State.maxPage then
        Osi.GlobalClearFlag("S7_Config_NextPageAvailable")
        Osi.GlobalClearFlag("S7_Config_PrevPageAvailable")
    else
        Osi.GlobalSetFlag("S7_Config_NextPageAvailable")
        Osi.GlobalSetFlag("S7_Config_PrevPageAvailable")
    end

    local setterFunction = {
        ['String'] = Osi.DialogSetVariableString,
        ['FixedString'] = Osi.DialogSetVariableFixedString,
        ['Integer'] = Osi.DialogSetVariableInt,
        ['Float'] = Osi.DialogSetVariableFloat,
    }

    Ext.Print(Ext.JsonStringify(Rematerialize(self['Vars'])))

    for alias, Var in pairs(self['Vars']) do
        if type(Var) ~= 'table' then return end
        local dialogVal = type(Var.dialogVal) == 'function' and Var.dialogVal() or Var.dialogVal or ""
        Ext.Print(dialogVal)
        if ValidString(Var.dialogType) then setterFunction[Var.dialogType](self.Name, Var.dialogVar, dialogVal)
        else
            Ext.Print(self.Name, Var.dialogVar, dialogVal)
            Osi.DialogSetVariableFixedString(self.Name, Var.dialogVar, tostring(dialogVal))
        end
     end

end

function DynamicDialog:Start(character)
    if self.Active then return end
    local character = character or Osi.CharacterGetHostCharacter()
    if not Ext.OsirisIsCallable() then return end
    if not Osi.QRY_SpeakerIsAvailable(character) then return end
    self:Set()
    Osi.Proc_StartDialog(1, self.Name, character)
end

--  ===================
--  TEST DYNAMIC DIALOG
--  ===================

DynamicDialog.Nodes = {
    [1] = {
        ['Text'] = 'Hello',
        ['Action'] = function() Ext.Print('Hello') end,
    },
    [2] = {
        ['Text'] = 'World',
        ['Action'] = function() Ext.Print('World') end,
    },
    [3] = {
        ['Text'] = 'Good',
        ['Action'] = function() Ext.Print('Good') end,
    },
    [4] = {
        ['Text'] = 'Bye',
        ['Action'] = function() Ext.Print('Bye') end,
    },
    [5] = {
        ['Text'] = 'Tcao',
        ['Action'] = function() Ext.Print('Tcao') end,
    }
}

DynamicDialog.Stage = DynamicDialog.Nodes

Ext.RegisterOsirisListener("CharacterUsedSkill", 4, "after", function (character, skill, a, b)
    Ext.Print(skill)
    if not skill == 'Target_S7_Config_Inspect' then return end
    DynamicDialog:Start()
end)