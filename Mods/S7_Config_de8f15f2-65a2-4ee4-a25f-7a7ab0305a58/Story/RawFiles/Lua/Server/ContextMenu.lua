--  ======================
--  CONTEXT MENU RESPONDER
--  ======================

Ext.RegisterNetListener("S7UCL::ContextMenu", function (channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload) -- Converts stringified numeric keys back into numbers

    if payload.actionID == 27701 then
        Stats:LoadConfigs()
        Stats:BuildConfigs()
        Stats:BroadcastConfigData()
        Stats:ValidateConfigs()
        Osi.ShowNotification(Osi.CharacterGetHostCharacter(), 'Configuration Applied')
    end
end)