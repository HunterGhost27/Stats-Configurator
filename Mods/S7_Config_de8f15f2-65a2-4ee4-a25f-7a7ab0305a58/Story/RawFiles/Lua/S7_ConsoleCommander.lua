--  ###################################################################################################################################################
--                                                                 CONSOLE COMMANDER
--  ===================================================================================================================================================
logSource = "Lua:ConsoleCommander"
--  ###################################################################################################################################################

--  ================
--  CONSOLE COMMANDS
--  ================

function S7_Config_ConsoleCommander(...)
    local args = {...}
    local command = args[2] or ""

    if command == "AddSkill" then
        --  ADD SKILL
        --  =========
        local skillName = args[3] or ""
        local character = args[4] or ""
        S7_AddSkill(skillName, character)
    elseif command == "RemoveSkill" then
        --  REMOVE SKILL
        --  ============
        local skillName = args[3] or ""
        local character = args[4] or ""
        S7_RemoveSkill(skillName, character)
    elseif command == "StatSearch" then
        --  STAT SEARCH
        --  ===========
        local search = args[3] or ""
        local searchsearchType = args[4] or ""
        S7_StatSearch(search, searchsearchType)
    elseif command == "Help" or command == "" then
        --  HELP
        --  ====
        S7_ConfigLog("\n" .. helpMessage, "[Warning]")
    end
end

helpMessage =
    [[
    ======================================================================================================================================================
    Command     Argument1       Argument2                --  COMMENTS                                               EXAMPLE
    ======================================================================================================================================================
    AddSkill    <SkillID>       <Character|Optional>     --  Adds skill (skillID) to character (character-key).     AddSkill Projectile_Fireball Host
    RemoveSkill <SkillID>       <Character|Optional>     --  Removes skill (skillID) to character (character-key).  RemoveSkill Shout_InspireStart
    StatsSearch <SearchString>  <StatType |Optional>     --  Search for (SearchString) in category (StatType).      StatSearch Summon_Incarnate SkillData
    ======================================================================================================================================================
    * Resize the console window if this doesn't fit properly.
]]

--  ===============================================================
Ext.RegisterConsoleCommand("S7_Config", S7_Config_ConsoleCommander)
--  ===============================================================

--  ####################################################################################################################################################

--  ===================
--  ADD OR REMOVE SKILL
--  ===================

function S7_AddSkill(skillName, character)
    if skillName ~= "" and skillName ~= nil then
        FetchPlayers()
        if character == "" or character == nil then
            for i, player in ipairs(Osi.DB_IsPlayer:Get(nil)[1]) do
                Osi.CharacterAddSkill(player, skillName, 1)
                S7_ConfigLog("Skill: " .. skillName .. " added to " .. player)
            end
        elseif character == "Host" then
            Osi.CharacterAddSkill(Osi.CharacterGetHostCharacter(), skillName, 1)
            S7_ConfigLog("Skill: " .. skillName .. " added to " .. Osi.CharacterGetHostCharacter())
        else
            for userProfile, content in pairs(players) do
                if players[userProfile]["userName"] == character then
                    Osi.CharacterAddSkill(Osi.GetCurrentCharacter(players[userProfile]["userID"]), skillName, 1)
                    S7_ConfigLog(
                        "Skill: " ..
                            skillName .. " added to " .. Osi.GetCurrentCharacter(players[userProfile]["userID"])
                    )
                end
            end
        end
    else
        S7_ConfigLog("Invalid SkillName", "[Error]")
    end
end

function S7_RemoveSkill(skillName, character)
    if skillName ~= "" and skillName ~= nil then
        FetchPlayers()
        if character == "" or character == nil then
            for i, player in ipairs(Osi.DB_IsPlayer:Get(nil)[1]) do
                Osi.CharacterRemoveSkill(player, skillName)
                S7_ConfigLog("Skill: " .. skillName .. " added to " .. player)
            end
        elseif character == "Host" then
            Osi.CharacterRemoveSkill(Osi.CharacterGetHostCharacter(), skillName)
            S7_ConfigLog("Skill: " .. skillName .. " added to " .. Osi.CharacterGetHostCharacter())
        else
            for userProfile, content in pairs(players) do
                if players[userProfile]["userName"] == character then
                    Osi.CharacterRemoveSkill(Osi.GetCurrentCharacter(players[userProfile]["userID"]), skillName)
                    S7_ConfigLog(
                        "Skill: " ..
                            skillName .. " added to " .. Osi.GetCurrentCharacter(players[userProfile]["userID"])
                    )
                end
            end
        end
    else
        S7_ConfigLog("Invalid SkillName", "[Error]")
    end
end

--  ===========
--  STAT SEARCH
--  ===========

function S7_StatSearch(search, searchType)
    if search ~= nil and search ~= "" then
        local allStat = {}
        if searchType ~= "" and searchType ~= nil then
            allStat = Ext.GetStatEntries(searchType)
        else
            allStat = Ext.GetStatEntries()
        end
        S7_ConfigLog("Search Results: ")
        S7_ConfigLog("=================================================")
        for i, stat in ipairs(allStat) do
            if string.match(stat, search) then
                S7_ConfigLog(stat)
            end
        end
        S7_ConfigLog("=================================================")
    else
        S7_ConfigLog("Search String Empty", "[Warning]")
    end
end

--  #####################################################################################################################################################
