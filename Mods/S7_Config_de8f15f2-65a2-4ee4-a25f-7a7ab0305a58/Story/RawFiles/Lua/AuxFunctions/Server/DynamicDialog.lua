--  ====================================
--  DYNAMIC DIALOG (HIGHLY EXPERIMENTAL)
--  ====================================

---@class DialogNode
---@field Text string Dialog text
---@field Action function Dialog action

---@class DynamicDialog: Dialog
---@field Nodes DialogNode[]
---@field State table
---@field Stage table
DynamicDialog = {}
DynamicDialog.State = {}
DynamicDialog.Stage = {}
DynamicDialog.Nodes = {}
DynamicDialog = Integrate(DynamicDialog, Dialog:New({['Name'] = 'S7_DynamicDialog'}))

---Reset DynamicDialog State
function DynamicDialog:ResetState()
    self['State'] = {
        ['level'] = 1,
        ['maxLevel'] = 1,
        ['page'] = 1,
        ['maxPage'] = 1,
        ['selected'] = "",
        ['history'] = {},
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
    ['S7_DynamicDialog_SetOpt1'] = function() DynamicDialog.State.selected = DynamicDialog.Stage[1]['Text']; if DynamicDialog.Stage[1]['Action'] then DynamicDialog.Stage[1]['Action']() end end,
    ['S7_DynamicDialog_SetOpt2'] = function() DynamicDialog.State.selected = DynamicDialog.Stage[2]['Text']; if DynamicDialog.Stage[2]['Action'] then DynamicDialog.Stage[2]['Action']() end end,
    ['S7_DynamicDialog_SetOpt3'] = function() DynamicDialog.State.selected = DynamicDialog.Stage[3]['Text']; if DynamicDialog.Stage[3]['Action'] then DynamicDialog.Stage[3]['Action']() end end,
    ['S7_DynamicDialog_SetOpt4'] = function() DynamicDialog.State.selected = DynamicDialog.Stage[4]['Text']; if DynamicDialog.Stage[4]['Action'] then DynamicDialog.Stage[4]['Action']() end end,
    ['S7_DynamicDialog_SetOpt5'] = function() DynamicDialog.State.selected = DynamicDialog.Stage[5]['Text']; if DynamicDialog.Stage[5]['Action'] then DynamicDialog.Stage[5]['Action']() end end,
    ['S7_DynamicDialog_ExitCleanup'] = function () DynamicDialog:ResetState() end,
    ['S7_DynamicDialog_NextNode'] = function ()
        if not IsValid(DynamicDialog.State.selected) then return end
        if not DynamicDialog.Nodes[DynamicDialog.State.level + 1] then return end
        DynamicDialog.State.history[DynamicDialog.State.level] = DynamicDialog.State.selected
        DynamicDialog.State.level = DynamicDialog.State.level + 1
        DynamicDialog.Stage = DynamicDialog.Nodes[DynamicDialog.State.level][DynamicDialog.State.selected]
        DynamicDialog.State.page = 1
    end,
    ['S7_DynamicDialog_GoBack'] = function ()
        if DynamicDialog.State.level <= 1 then return end
        DynamicDialog.State.level = DynamicDialog.State.level - 1
        if DynamicDialog.State.level == 1 then DynamicDialog.State.selected = 'DIALOGSTART'
        else DynamicDialog.State.selected = DynamicDialog.State.history[#DynamicDialog.State.history] end
        DynamicDialog.State.history[#DynamicDialog.State.history] = nil
        DynamicDialog.Stage = DynamicDialog.Nodes[DynamicDialog.State.level][DynamicDialog.State.selected]
        DynamicDialog.State.page = 1
    end,
})
DynamicDialog:RegisterListeners()

---Override base Dialog:Set
function DynamicDialog:Set()
    if not Ext.OsirisIsCallable() then return end
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt1')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt2')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt3')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt4')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt5')

    self.State.maxLevel = #self.Nodes

    self:Update({['S7_DynamicDialogResponse'] = {['dialogVal'] = self.Nodes[self.State.level]['DialogResponse']}})

    local entries = #ExtractKeys(self.Stage) or 1
    self.State.maxPage = math.floor((entries - 1) / 5) + 1

    ForEach(self.Stage, function (key, value)
        local pos = tonumber(key)
        if not pos then return end
        if (pos < (1 + 5 * self.State.page)) and (pos > (5 * (self.State.page - 1))) then
            local relPos = pos % 5; if relPos == 0 then relPos = 5 end
            Osi.GlobalSetFlag('S7_DynamicDialog_AvailOpt' .. tostring(relPos))
            self:Update({['S7_DynamicDialog_Opt' .. tostring(relPos)] = {['dialogVal'] = value.Text}})
        end
    end)

    if self.State.page == 1 and self.State.page ~= self.State.maxPage then
        Osi.GlobalClearFlag("S7_DynamicDialog_PrevPageAvailable"); Osi.GlobalSetFlag("S7_DynamicDialog_NextPageAvailable")
    elseif self.State.page ~= 1 and self.State.page == self.State.maxPage then
        Osi.GlobalClearFlag("S7_DynamicDialog_NextPageAvailable"); Osi.GlobalSetFlag("S7_DynamicDialog_PrevPageAvailable")
    elseif self.State.page == 1 and self.State.page == self.State.maxPage then
        Osi.GlobalClearFlag("S7_DynamicDialog_NextPageAvailable"); Osi.GlobalClearFlag("S7_DynamicDialog_PrevPageAvailable")
    else Osi.GlobalSetFlag("S7_DynamicDialog_NextPageAvailable"); Osi.GlobalSetFlag("S7_DynamicDialog_PrevPageAvailable")
    end

    local setterFunction = {
        ['String'] = Osi.DialogSetVariableString,
        ['FixedString'] = Osi.DialogSetVariableFixedString,
        ['Integer'] = Osi.DialogSetVariableInt,
        ['Float'] = Osi.DialogSetVariableFloat,
    }

    ForEach(self.Vars, function (alias, Var)
        if type(Var) ~= 'table' then return end
        local dialogVal = type(Var.dialogVal) == 'function' and Var.dialogVal() or Var.dialogVal or ""
        if ValidString(Var.dialogType) then setterFunction[Var.dialogType](self.Name, Var.dialogVar, dialogVal)
        else Osi.DialogSetVariableFixedString(self.Name, Var.dialogVar, tostring(dialogVal)) end
    end)
end

---Overrides base Dialog:Start
---@param character string|nil CharacterGUID
function DynamicDialog:Start(character)
    if self.isActive then return end
    local character = character or Osi.CharacterGetHostCharacter()
    if not Ext.OsirisIsCallable() then return end
    if not Osi.QRY_SpeakerIsAvailable(character) then return end
    self.Stage = self.Nodes[self.State.level]['DIALOGSTART']
    self:Set()
    Osi.Proc_StartDialog(self.isAutomated, self.Name, character)
end

---Update Nodes
---@param nodes DialogNode[]
function DynamicDialog:UpdateNodes(nodes) self.Nodes = nodes end