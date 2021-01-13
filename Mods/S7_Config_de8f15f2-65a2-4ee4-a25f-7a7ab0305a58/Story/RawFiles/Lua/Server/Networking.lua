--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

function ValidateClientConfigs()
    Debug:Print("Validating Client Config...")
    local compare = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName)
    if not ValidString(compare) then Debug:Error("Nothing to validate. Please check if the server has " .. ConfigSettings.StatsLoader.FileName) end

    for userProfileID, _ in pairs(UserInformation.Clients) do
        local clientID = UserInformation.Clients[userProfileID]["currentCharacterName"] .. " (" .. UserInformation.Clients[userProfileID]["userName"] .. ")"
        Ext.PostMessageToClient(UserInformation.Clients[userProfileID]["currentCharacter"], "S7_Config::ConfigValidation", Ext.JsonStringify({[clientID] = compare}))
    end
end

--============================================================================
Ext.RegisterOsirisListener("UserConnected", 3, "after", ValidateClientConfigs)
--============================================================================

--  ========================
--  VALIDATE CLIENT RESPONSE
--  ========================

Ext.RegisterNetListener("S7_Config::ConfigValidationResponse", function (channel, payload)
    if string.match(payload, "Active configuration mismatch detected.") then Debug:Warn("Client Response: " .. tostring(payload))
    elseif string.match(payload, "Active configuration profile verified.") then Debug:Print("Client Response: " .. tostring(payload))
    end    
end)
