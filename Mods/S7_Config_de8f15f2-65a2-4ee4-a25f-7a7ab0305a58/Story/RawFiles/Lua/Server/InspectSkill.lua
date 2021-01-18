--  =============
--  INSPECT SKILL
--  =============

local InspectSkill = 'Target_S7_Config_Inspect'

Flags:Track({
    ['flagName'] = 'S7_LearnInspect',
    ['flagType'] = 'Global'
})

--  LEARN INSPECT SKILL
--  ===================

Ext.RegisterOsirisListener('GlobalFlagSet', 1, 'after', function (flag)
    if flag == 'S7_LearnInspect' then Osi.CharacterAddSkill(Osi.CharacterGetHostCharacter(), InspectSkill, 1) end
end)

--  UNLEARN INSPECT SKILL
--  =====================

Ext.RegisterOsirisListener("GlobalFlagCleared", 1, "after", function (flag)
    if flag == 'S7_LearnInspect' then Osi.CharacterRemoveSkill(Osi.CharacterGetHostCharacter(), InspectSkill) end
end)

--  TOGGLE CONSOLE-COMMAND
--  ======================

ConsoleCommander:Register({
    ['Name'] = 'ToggleInspector',
    ['Description'] = "Toggles the Inspect-Skill",
    ['Context'] = 'Server',
    ['Action'] = function () Flags['S7_LearnInspect']:Toggle() end
})

--  ACTION
--  ======

Ext.RegisterOsirisListener("CharacterUsedSkillOnTarget", 5, "after", function (char, tar, skill, ...)
    if char ~= Osi.CharacterGetHostCharacter() and skill ~= InspectSkill then return end

    local characterGUID = ExtractGUID(char)
    local character = Ext.GetCharacter(characterGUID)
    local targetGUID = ExtractGUID(tar)
    local target = Osi.ObjectIsCharacter(targetGUID) == 1 and Ext.GetCharacter(targetGUID) or Ext.GetItem(targetGUID)

    Stringer:SetHeader('Inspecting: ' .. tostring(tar))

    if Osi.ObjectIsCharacter(targetGUID) == 1 then
    local skills = target:GetSkills()
        Stringer:Add('Skills:')
        Stringer:LineBreak('-')
        for _, skill in pairs(skills) do Stringer:Add(skill) end
        Stringer:LineBreak('_')
    end

    local statuses = target:GetStatuses()
    if IsValid(statuses) then
        Stringer:Add('Statuses: ')
        Stringer:LineBreak('-')
        for _, status in pairs(statuses) do Stringer:Add(status) end
        Stringer:LineBreak('_')
    end

    Debug:FPrint(Stringer:Build())
end)