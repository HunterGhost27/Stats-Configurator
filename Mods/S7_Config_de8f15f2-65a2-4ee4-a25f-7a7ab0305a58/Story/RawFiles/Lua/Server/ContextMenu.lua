--  ======================
--  CONTEXT MENU RESPONDER
--  ======================

Ext.RegisterNetListener("S7UCL::ContextMenu", function (channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload)
    if payload.actionID == 27701 then
        Stats:LoadConfigs()
        Stats:BuildConfigs()
        Stats:BroadcastConfigData()
        ValidateClientConfigs()
        Osi.ShowNotification(Osi.CharacterGetHostCharacter(), 'Configuration Applied')
    end
end)