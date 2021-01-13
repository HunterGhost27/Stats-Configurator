--  ===================
--  LEARN INSPECT SKILL
--  ===================

Ext.RegisterOsirisListener("GlobalFlagSet", 1, "after", function (flag)
    if flag == 'S7_LearnInspect' then Osi.CharacterAddSkill(Osi.CharacterGetHostCharacter(), "Target_S7_Config_Inspect", 1) end
end)

--  =====================
--  UNLEARN INSPECT SKILL
--  =====================

Ext.RegisterOsirisListener("GlobalFlagCleared", 1, "after", function (flag)
    if flag == 'S7_LearnInspect' then Osi.CharacterRemoveSkill(Osi.CharacterGetHostCharacter(), "Target_S7_Config_Inspect") end
end)

--  =============
--  INSPECT SKILL
--  =============

Ext.RegisterOsirisListener("CharacterUsedSkillOnTarget", 5, "after", function (character, target, skill, ...)
    if character ~= Osi.CharacterGetHostCharacter() and skill ~= "Target_S7_Config_Inspect" then return end

    --  Target is character. Inspect target skills.
    --  Target is character. Inspect target statuses.
    --  Target is character. Inspect characterStatName.
    --  Target is item. Inspect ItemStatID.
end)