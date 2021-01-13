
--  =================
--  CLIENT NETWORKING
--  =================

--  BROADCASTED CONFIG-DATA
--  =======================

Ext.RegisterNetListener('S7_ConfigData', function (channel, payload)
    Debug:Print("Client recieved configuration. Saving file: " .. ConfigSettings.StatsLoader.FileName)
    SaveFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName, payload)
end)

--  CLIENT CONFIG VALIDATION
--  ========================

Ext.RegisterNetListener('S7_ValidateClientConfig', function (channel, payload)
    local verify = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName) or ""

    for clientID, compare in pairs(Ext.JsonParse(payload)) do
        local message = clientID .. " : "

        if ValidString(verify) and compare == verify then
            message = message .. "Active configuration profile verified."
            Ext.PostMessageToServer("S7_Config::ConfigValidationResponse", message)
        else
            message = message .. "Active configuration mismatch detected."
            Ext.PostMessageToServer("S7_Config::ConfigValidationResponse", message)
        end
    end
end)
