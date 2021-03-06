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

    local target, statsId
    if Osi.ObjectIsCharacter(targetGUID) == 1 then
        target = Ext.GetCharacter(targetGUID)
        statsId = target.RootTemplate.Stats
    else
        target = Ext.GetItem(targetGUID)
        statsId = target.RootTemplate.Stats
    end

    Write:SetHeader('Inspecting: ' .. tostring(statsId))

    if Osi.ObjectIsCharacter(targetGUID) == 1 then
        local skills = target:GetSkills()
        Write:NewLine('Skills:')
        Write:LineBreak('-')
        for _, skill in pairs(skills) do Write:NewLine("  " .. skill) end
        Write:LineBreak('_')
    end

    local statuses = target:GetStatuses()
    if IsValid(statuses) then
        Write:NewLine('Statuses: ')
        Write:LineBreak('-')
        for _, status in pairs(statuses) do Write:NewLine("  " .. status) end
        Write:LineBreak('_')
    end

    Osi.ShowNotification(char, 'Check the Debug-Console for results')
    Debug:FPrint(Write:Display())
end)

Ext.RegisterOsirisListener('CharacterUsedSkillAtPosition', 7, 'after', function(char, x, y, z, skill, ...)
    if char ~= Osi.CharacterGetHostCharacter() and skill ~= InspectSkill then return end

    Write:SetHeader('Inspecting Vicinity: ' .. "x: " .. x .. " y: " .. y .. " z: " .. z)
    local characters = Ext.GetCharactersAroundPosition(x, y, z, 15)
    local items = Ext.GetItemsAroundPosition(x, y, z, 15)

    Write:NewLine('Characters: ')
    Write:LineBreak('-')
    for _, character in pairs(characters) do
        local c = Ext.GetCharacter(character)
        Write:NewLine("  " .. c.DisplayName .. "\t" .. c.RootTemplate.Stats)
    end
    Write:LineBreak('_')
    Write:NewLine('Items: ')
    Write:LineBreak('-')
    for _, item in pairs(items) do
        local i = Ext.GetItem(item)
        Write:NewLine("  " .. i.DisplayName .. "\t" .. i.StatsId)
    end
    Write:LineBreak('_')

    Osi.ShowNotification(char, 'Check the Debug-Console for results')
    Debug:FPrint(Write:Display())
end)