--  ==================
--  PLAYER INFORMATION
--  ==================

PlayerInfo = {
    ["clientCharacters"] = {},
    ["hostCharacter"] = {}
}

function PlayerInfo:Fetch()

    --  HOST CHARACTER
    --  --------------

    local hostCharacterGUID = Osi.CharacterGetHostCharacter()
    local hostUserID = Osi.CharacterGetReservedUserID(hostCharacterGUID)
    local currentHostCharacter = Osi.GetCurrentCharacter(hostUserID)
    local _, hostCharacterName = Osi.CharacterGetDisplayName(currentHostCharacter)
    --   Build Host Character's table.
    PlayerInfo.hostCharacter = {
        ["hostUserID"] = hostUserID,
        ["hostCharacterGUID"] = hostCharacterGUID,
        ["hostUserName"] = Osi.GetUserName(hostUserID),
        ["hostProfileID"] = Osi.GetUserProfileID(hostUserID),
        ["currentCharacter"] = currentHostCharacter,
        ["currentCharacterName"] = hostCharacterName
    }

    --  CLIENT CHARACTERS
    --  -----------------

    local tempUsers = {}
    for _, player in pairs(Osi.DB_IsPlayer:Get(nil)[1] or {}) do
        tempUsers[#tempUsers+1] = Osi.CharacterGetReservedUserID(player)
    end

    for _, user in pairs(tempUsers) do
        local userProfileID = Osi.GetUserProfileID(user)
        local currentCharacter = Osi.GetCurrentCharacter(user)
        local _, characterName = Osi.CharacterGetDisplayName(currentCharacter)
        -- Build ClientCharacter table.
        PlayerInfo.clientCharacters[userProfileID] = {
            ["userID"] = user,
            ["userName"] = Osi.GetUserName(user),
            ["userProfileID"] = Osi.GetUserProfileID(user),
            ["hostUserProfileID"] = Osi.GetUserProfileID(Osi.CharacterGetReservedUserID(hostCharacterGUID)),
            ["currentCharacter"] = Osi.GetCurrentCharacter(user),
            ["currentCharacterName"] = characterName
        }
    end
end
