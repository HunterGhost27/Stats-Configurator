--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

function ValidateClientConfigs()
    Debug:Print("Validating Client Config...")
    local compare = Ext.LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName)
    if not ValidString(compare) then Debug:Error("Nothing to validate. Please check if the server has " .. Settings.StatsLoader.FileName) end

    for userProfileID, _ in pairs(UserInformation.Clients) do
        local clientID = UserInformation.Clients[userProfileID]["DisplayName"] .. " (" .. UserInformation.Clients[userProfileID]["UserName"] .. ")"
        Ext.PostMessageToClient(UserInformation.Clients[userProfileID]["CurrentCharacter"], "S7_Config::ConfigValidation", Ext.JsonStringify({[clientID] = compare}))
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
