--  ###################################################################################################################################################
--                                                                 CONSOLE COMMANDER
--  ===================================================================================================================================================
logSource = "Lua:ConsoleCommander"
--  ###################################################################################################################################################

--  ===================
--  ADD OR REMOVE SKILL
--  ===================

function S7_AddSkill(...)
    args = {...}
    command = args[1] or ""
    skillName = args[2] or ""
    character = args[3] or ""
    if skillName ~= "" and skillName ~= nil then
        S7_FetchPlayers()
        if character == "" or character == nil then
            for i, player in ipairs(Osi.DB_IsPlayer:Get(nil)[1]) do
                Osi.CharacterAddSkill(player, skillName, 1)
            end
        elseif character == "Host" then
            Osi.CharacterAddSkill(Osi.CharacterGetHostCharacter(), skillName, 1)
        else
            for userProfile, content in pairs(players) do
                if players[userProfile]["userName"] == character then
                    Osi.CharacterAddSkill(Osi.GetCurrentCharacter(players[userProfile]["userID"]), skillName, 1)
                end
            end
        end
    else
        S7_ConfigLog("Error Encountered", "[Error]")
    end
end

function S7_RemoveSkill(...)
    args = {...}
    command = args[1] or ""
    skillName = args[2] or ""
    character = args[3] or ""
    if skillName ~= "" and skillName ~= nil then
        S7_FetchPlayers()
        if character == "" or character == nil then
            for i, player in ipairs(Osi.DB_IsPlayer:Get(nil)[1]) do
                Osi.CharacterRemoveSkill(player, skillName)
            end
        elseif character == "Host" then
            Osi.CharacterRemoveSkill(Osi.CharacterGetHostCharacter(), skillName)
        else
            for userProfile, content in pairs(players) do
                if players[userProfile]["userName"] == character then
                    Osi.CharacterRemoveSkill(Osi.GetCurrentCharacter(players[userProfile]["userID"]), skillName)
                end
            end
        end
    else
        S7_ConfigLog("Error Encountered", "[Error]")
    end
end

--  ========================================================
Ext.RegisterConsoleCommand("S7_AddSkill", S7_AddSkill)
Ext.RegisterConsoleCommand("S7_RemoveSkill", S7_RemoveSkill)
--  ========================================================

--  ===========
--  STAT SEARCH
--  ===========

local function S7_StatSearch(...)
    args = {...}
    command = args[1] or ""
    search = args[2] or ""
    type = args[3] or ""
    if command == "S7_StatSearch" then
        if search ~= nil and search ~= "" then
            local allStat = {}
            if type ~= "" and type ~= nil then
                allStat = Ext.GetStatEntries(type)
            else
                allStat = Ext.GetStatEntries()
            end

            for i, stat in ipairs(allStat) do
                if string.match(stat, search) then
                    S7_ConfigLog("Search Result:" .. stat)
                end
            end
        else
            S7_ConfigLog("Search String Empty")
        end
    end
end

--  ======================================================
Ext.RegisterConsoleCommand("S7_StatSearch", S7_StatSearch)
--  ======================================================

--  #####################################################################################################################################################
