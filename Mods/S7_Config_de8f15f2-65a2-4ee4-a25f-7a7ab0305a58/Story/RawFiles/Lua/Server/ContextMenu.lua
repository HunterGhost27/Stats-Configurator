--  ======================
--  CONTEXT MENU RESPONDER
--  ======================

Ext.RegisterNetListener("S7UCL::ContextMenu", function (channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload)
    if payload.actionID == 27701 then
        local character = payload.CharacterGUID or Osi.CharacterGetHostCharacter()
        LoadConfigs()
        BuildConfigs()
        BroadcastConfigs()
        ValidateClientConfigs()
    end
end)