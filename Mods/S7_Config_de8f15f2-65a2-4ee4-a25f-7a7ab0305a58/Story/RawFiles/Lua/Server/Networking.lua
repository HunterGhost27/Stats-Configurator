--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

function ValidateClientConfigs()
    Debug:FPrint("Validating Client Config...")
    local source = Ext.LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName)
    if not ValidString(source) then Debug:FWarn("Nothing to validate. Please check if the server has " .. Settings.StatsLoader.FileName) end

    for userProfileID, information in pairs(UserInformation.Clients) do
        local clientID = information[userProfileID]['DisplayName'] .. " (" .. information[userProfileID]['UserName'] .. ")"
        Ext.PostMessageToClient(information[userProfileID]['CurrentCharacter'], 'S7_Config::ConfigValidation', Ext.JsonStringify({[clientID] = source}))
    end
end

Ext.RegisterNetListener("S7_Config::ConfigValidationResponse", function (channel, payload)
    if payload == "Config mismatch detected" then
        Debug:FWarn("Client Response: " .. payload)
        Osi.ShowNotification(Osi.CharacterGetHostCharacter(), Color:Fire(payload))
    elseif payload == "Config verified" then
        Debug:FPrint("Client Response: " .. payload)
    end
end)
