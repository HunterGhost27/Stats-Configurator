--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

function ValidateClientConfigs()
    Debug:Print("Validating Client Config...")
    local compare = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName)
    if ValidString(compare) then
        UserInformation:Fetch()
        for userProfileID, _ in pairs(UserInformation.Clients) do
            local clientID = UserInformation.Clients[userProfileID]["currentCharacterName"] .. " (" .. UserInformation.Clients[userProfileID]["userName"] .. ")"
            local payload = {[clientID] = compare}
            Ext.PostMessageToClient(UserInformation.Clients[userProfileID]["currentCharacter"], "S7_ValidateClientConfig", Ext.JsonStringify(payload))
        end
    else
        Debug:Error("Nothing to validate. Please check if the server has " .. ConfigSettings.StatsLoader.FileName)
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
        Debug:Warn("Client Response: " .. tostring(clientResponse))
    elseif string.match(clientResponse, "Active configuration profile verified.") then
        Debug:Print("Client Response: " .. tostring(clientResponse))
    end
end

--  ========================================================================
Ext.RegisterNetListener("S7_ValidateClientResponse", ValidateClientResponse)
--  ========================================================================
