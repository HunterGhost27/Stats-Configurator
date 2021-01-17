--  ==============
--  DYNAMIC DIALOG
--  ==============

---@class DialogNode
---@field Text string Dialog text
---@field Action function Dialog action
---@field Node DialogNode[]|nil Successive node

---@class DynamicDialog: Dialog
---@field Nodes DialogNode[]
---@field State table
---@field Stage table
DynamicDialog = {}
DynamicDialog.State = {}
DynamicDialog.Stage = {}
DynamicDialog = Integrate(DynamicDialog, Dialog:New({['Name'] = 'S7_DynamicDialog'}))

---Reset DynamicDialog State
function DynamicDialog:ResetState()
    self['State'] = {
        ['page'] = 1,
        ['maxPage'] = 1,
        ['selected'] = 0,
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
    ['S7_DynamicDialog_ExitCleanup'] = function () DynamicDialog:ResetState() end,
    ['S7_DynamicDialog_SetOpt1'] = function() DynamicDialog.State.selected = 1; if DynamicDialog.Stage[1]['Action'] then DynamicDialog.Stage[1]['Action']() end end,
    ['S7_DynamicDialog_SetOpt2'] = function() DynamicDialog.State.selected = 2; if DynamicDialog.Stage[2]['Action'] then DynamicDialog.Stage[2]['Action']() end end,
    ['S7_DynamicDialog_SetOpt3'] = function() DynamicDialog.State.selected = 3; if DynamicDialog.Stage[3]['Action'] then DynamicDialog.Stage[3]['Action']() end end,
    ['S7_DynamicDialog_SetOpt4'] = function() DynamicDialog.State.selected = 4; if DynamicDialog.Stage[4]['Action'] then DynamicDialog.Stage[4]['Action']() end end,
    ['S7_DynamicDialog_SetOpt5'] = function() DynamicDialog.State.selected = 5; if DynamicDialog.Stage[5]['Action'] then DynamicDialog.Stage[5]['Action']() end end,
    ['S7_DynamicDialog_NextNode'] = function ()
        if not IsValid(DynamicDialog.State.selected) then return end
        if not DynamicDialog.Stage[DynamicDialog.State.selected]['Nodes'] then return end
        local prevStage = DynamicDialog.Stage
        DynamicDialog.Stage = Rematerialize(DynamicDialog.Stage[DynamicDialog.State.selected]['Nodes'])
        DynamicDialog.Stage.prev = prevStage
        DynamicDialog.State.page = 1
    end,
    ['S7_DynamicDialog_GoBack'] = function ()
        if not DynamicDialog.Stage.prev then return end
        DynamicDialog.Stage = Rematerialize(DynamicDialog.Stage.prev)
        DynamicDialog.State.page = 1
    end,
})

DynamicDialog:RegisterListeners()

local function clearAvailableOptions()
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt1')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt2')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt3')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt4')
    Osi.GlobalClearFlag('S7_DynamicDialog_AvailOpt5')
end

function DynamicDialog:Set()
    if not Ext.OsirisIsCallable() then return end
    clearAvailableOptions()

    local entries = ExtractKeys(self.Stage)
    self.State.maxPage = math.floor((#entries - 1) / 5) + 1

    for key, value in pairs(self.Stage) do
        local pos = tonumber(key)
        if not pos then break end
        if (pos < (1 + 5 * DynamicDialog.State.page)) and (pos > (5 * (DynamicDialog.State.page - 1))) then
            local relPos = pos % 5; if relPos == 0 then relPos = 5 end
            Osi.GlobalSetFlag('S7_DynamicDialog_AvailOpt' .. tostring(relPos))
            self:Update({['S7_DynamicDialog_Opt' .. tostring(relPos)] = {['dialogVal'] = value.Text}})
        end
    end

    if DynamicDialog.State.page == 1 and DynamicDialog.State.page ~= DynamicDialog.State.maxPage then
        Osi.GlobalClearFlag("S7_DynamicDialog_PrevPageAvailable"); Osi.GlobalSetFlag("S7_DynamicDialog_NextPageAvailable")
    elseif DynamicDialog.State.page ~= 1 and DynamicDialog.State.page == DynamicDialog.State.maxPage then
        Osi.GlobalClearFlag("S7_DynamicDialog_NextPageAvailable"); Osi.GlobalSetFlag("S7_DynamicDialog_PrevPageAvailable")
    elseif DynamicDialog.State.page == 1 and DynamicDialog.State.page == DynamicDialog.State.maxPage then
        Osi.GlobalClearFlag("S7_DynamicDialog_NextPageAvailable"); Osi.GlobalClearFlag("S7_DynamicDialog_PrevPageAvailable")
    else Osi.GlobalSetFlag("S7_DynamicDialog_NextPageAvailable"); Osi.GlobalSetFlag("S7_DynamicDialog_PrevPageAvailable")
    end

    local setterFunction = {
        ['String'] = Osi.DialogSetVariableString,
        ['FixedString'] = Osi.DialogSetVariableFixedString,
        ['Integer'] = Osi.DialogSetVariableInt,
        ['Float'] = Osi.DialogSetVariableFloat,
    }

    for alias, Var in pairs(DynamicDialog['Vars']) do
        if type(Var) ~= 'table' then return end
        local dialogVal = type(Var.dialogVal) == 'function' and Var.dialogVal() or Var.dialogVal or ""
        if ValidString(Var.dialogType) then setterFunction[Var.dialogType](DynamicDialog.Name, Var.dialogVar, dialogVal)
        else Osi.DialogSetVariableFixedString(DynamicDialog.Name, Var.dialogVar, tostring(dialogVal)) end
     end

end

function DynamicDialog:Start(character)
    if self.Active then return end
    local character = character or Osi.CharacterGetHostCharacter()
    if not Ext.OsirisIsCallable() then return end
    if not Osi.QRY_SpeakerIsAvailable(character) then return end
    self.Stage = Rematerialize(self.Nodes)
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
        ['Nodes'] = {
            [1] = {['Text'] = "One"},
            [2] = {['Text'] = "Two"},
        }
    },
    [2] = {
        ['Text'] = 'World',
        ['Action'] = function() Ext.Print('World') end,
        ['Nodes'] = {
            [1] = {['Text'] = "Three", ['Nodes'] = {
                [1] = {['Text'] = "Three991"},
                [2] = {['Text'] = "Four2222"},
                [3] = {['Text'] = "Four2223"},
                [4] = {['Text'] = "ZurZZZZ4"},
                [5] = {['Text'] = "ZurZZZZ5"},
                [6] = {['Text'] = "ZurZZZZ6"},
                [7] = {['Text'] = "ZurZZZZ7"},
                [8] = {['Text'] = "ZurZZZZ8"},
                [9] = {['Text'] = "ZurZZZZ9"},
                [10] = {['Text'] = "ZurZZZZ10"},
                [11] = {['Text'] = "ZurZZZZ11"},
                [12] = {['Text'] = "ZurZZZZ12"},
            }},
            [2] = {['Text'] = "Four"},
        }
    },
    [3] = {
        ['Text'] = 'Good',
        ['Action'] = function() Ext.Print('Good') end,
        ['Nodes'] = {
            [1] = {['Text'] = "Five"},
            [2] = {['Text'] = "Six"},
        }
    },
    [4] = {
        ['Text'] = 'Bye',
        ['Action'] = function() Ext.Print('Bye') end,
        ['Nodes'] = {
            [1] = {['Text'] = "Seven"},
            [2] = {['Text'] = "Eight"},
        }
    },
    [5] = {
        ['Text'] = 'Tcao',
        ['Action'] = function() Ext.Print('Tcao') end,
    },
    [6] = {
        ['Text'] = 'Tcao6',
        ['Action'] = function() Ext.Print('Tcao') end,
    },
    [7] = {
        ['Text'] = 'Tca7',
        ['Action'] = function() Ext.Print('Tcao') end,
    },
    [8] = {
        ['Text'] = 'Tcao8',
        ['Action'] = function() Ext.Print('Tcao') end,
    },
}

Ext.RegisterOsirisListener("CharacterUsedSkill", 4, "after", function (character, skill, a, b)
    if not skill == 'Target_S7_Config_Inspect' then return end
    DynamicDialog:Start()
end)