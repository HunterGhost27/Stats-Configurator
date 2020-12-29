--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

function ValidateClientConfigs()
    S7Debug:Print("Validating Client Config...")
    local compare = Ext.LoadFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName)
    if ValidString(compare) then
        PlayerInfo:Fetch()
        for userProfileID, _ in pairs(PlayerInfo.clientCharacters) do
            local clientID = PlayerInfo.clientCharacters[userProfileID]["currentCharacterName"] .. " (" .. PlayerInfo.clientCharacters[userProfileID]["userName"] .. ")"
            local payload = {[clientID] = compare}
            Ext.PostMessageToClient(PlayerInfo.clientCharacters[userProfileID]["currentCharacter"], "S7_ValidateClientConfig", Ext.JsonStringify(payload))
        end
    else
        S7Debug:Error("Nothing to validate. Please check if the server has " .. ConfigSettings.StatsLoader.FileName)
    end
end

--============================================================================
Ext.RegisterOsirisListener("UserConnected", 3, "after", ValidateClientConfigs)
--============================================================================

--  ========================
--  VALIDATE CLIENT RESPONSE
--  ========================

function ValidateClientResponse(channel, payload)
    local clientResponse = payload
    if string.match(clientResponse, "Active configuration mismatch detected.") then
        S7Debug:Warn("Client Response: " .. tostring(clientResponse))
    elseif string.match(clientResponse, "Active configuration profile verified.") then
        S7Debug:Print("Client Response: " .. tostring(clientResponse))
    end
end

--  ========================================================================
Ext.RegisterNetListener("S7_ValidateClientResponse", ValidateClientResponse)
--  ========================================================================
