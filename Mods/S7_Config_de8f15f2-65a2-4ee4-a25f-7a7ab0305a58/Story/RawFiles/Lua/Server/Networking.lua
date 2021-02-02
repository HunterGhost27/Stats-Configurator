--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

function ValidateClientConfigs()
    UserInformation:ReSync()
    Debug:FPrint("Validating Client Config...", {['dialogVar'] = 'ValidateClientConfigs'})
    local source = Ext.LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName)
    if not ValidString(source) then Debug:FWarn("Nothing to validate. Please check if the server has " .. Settings.StatsLoader.FileName, {['dialogVar'] = 'ValidateClientConfigs'}) end

    ForEach(UserInformation.Clients, function (userProfileID, information)
        if not IsValid(userProfileID) then return end
        local clientID = information['DisplayName'] .. " (" .. information['UserName'] .. ")"
        Ext.PostMessageToClient(information['CurrentCharacter'], 'S7_Config::ConfigValidation', Ext.JsonStringify({[clientID] = source}))
    end)
end

Ext.RegisterNetListener('S7_Config::ConfigValidationResponse', function (channel, payload)
    local configValidity = true
    local displayMessage = "Verification Complete"
    if payload:match('Config mismatch detected') then
        Debug:FWarn("Client Response: " .. payload)
        configValidity = false
        Osi.ShowNotification(Osi.CharacterGetHostCharacter(), Color:Fire(payload))
        displayMessage = "Client Configs mismatch detected"
    elseif payload:match('Config verified') then
        Debug:FPrint("Client Response: " .. payload)
    end
    Osi.ShowNotification(Osi.CharacterGetHostCharacter(), configValidity and 'All Configs Verified' or 'Config Mismatch Detected')
    Debug:Print(displayMessage, {['dialogVar'] = 'ValidateClientConfigs'})
end)
