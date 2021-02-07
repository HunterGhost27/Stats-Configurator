--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

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
