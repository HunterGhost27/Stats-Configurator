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

Ext.RegisterOsirisListener('GlobalFlagCleared', 1, 'after', function (flag)
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

Ext.RegisterOsirisListener('CharacterUsedSkillOnTarget', 5, 'after', function (char, tar, skill, ...)
    if char ~= Osi.CharacterGetHostCharacter() and skill ~= InspectSkill then return end

    local targetGUID = ExtractGUID(tar)
    local target = Osi.ObjectIsCharacter(targetGUID) == 1 and Ext.GetCharacter(targetGUID) or Ext.GetItem(targetGUID)

    Stringer:SetHeader('Inspecting: ' .. tostring(tar))

    if Osi.ObjectIsCharacter(targetGUID) == 1 then
        local skills = target:GetSkills()
        Stringer:Add('Skills:')
        Stringer:LineBreak('-')
        for _, skill in pairs(skills) do Stringer:Add("  " .. skill) end
        Stringer:LineBreak('_')
    end

    local statuses = target:GetStatuses()
    if IsValid(statuses) then
        Stringer:Add('Statuses: ')
        Stringer:LineBreak('-')
        for _, status in pairs(statuses) do Stringer:Add("  " .. status) end
        Stringer:LineBreak('_')
    end

    Debug:FPrint(Stringer:Build())
end)

Ext.RegisterOsirisListener('CharacterUsedSkillAtPosition', 7, 'after', function(char, x, y, z, skill, ...)
    if char ~= Osi.CharacterGetHostCharacter() and skill ~= InspectSkill then return end

    Stringer:SetHeader('Inspecting Vicinity: ' .. "x: " .. x .. " y: " .. y .. " z: " .. z)
    local characters = Ext.GetCharactersAroundPosition(x, y, z, 15)
    local items = Ext.GetItemsAroundPosition(x, y, z, 15)

    Stringer:Add('Characters: ')
    Stringer:LineBreak('-')
    for _, character in pairs(characters) do
        local c = Ext.GetCharacter(character)
        Stringer:Add("  " .. c.DisplayName .. "\t" .. c.RootTemplate.Stats)
    end
    Stringer:LineBreak('_')
    Stringer:Add('Items: ')
    Stringer:LineBreak('-')
    for _, item in pairs(items) do
        local i = Ext.GetItem(item)
        Stringer:Add("  " .. i.DisplayName .. "\t" .. i.StatsId)
    end
    Stringer:LineBreak('_')

    Debug:FPrint(Stringer:Build())
end)