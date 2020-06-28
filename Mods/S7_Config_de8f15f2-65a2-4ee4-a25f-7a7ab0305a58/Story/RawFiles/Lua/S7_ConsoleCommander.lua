logSource = "Lua:ConsoleCommander"

players = {}

local function S7_FetchPlayers()
    local users = {}
    local count = 1
    for i, player in ipairs(Osi.DB_IsPlayer:Get(nil)[1]) do
        users[count] = Osi.CharacterGetReservedUserID(player)
        count = count + 1
    end
    for j, user in ipairs(users) do
        userName = Osi.GetUserName(user) or "Editor"
        userProfileID = Osi.GetUserProfileID(user) or "EditorID"
        players[userProfileID] = {["userName"] = userName, ["userID"] = user}
    end
end

--  ################################################################################################################################################

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

--  #####################################################################################################################################################
