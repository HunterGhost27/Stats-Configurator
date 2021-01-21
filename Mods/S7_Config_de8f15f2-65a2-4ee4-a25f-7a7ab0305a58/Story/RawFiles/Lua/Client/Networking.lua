--  =================
--  CLIENT NETWORKING
--  =================

--  BROADCASTED CONFIG-DATA
--  =======================

Ext.RegisterNetListener('S7_Config::ConfigData', function (channel, payload)
    Debug:FPrint("Client recieved configuration. Saving file: " .. Settings.StatsLoader.FileName)
    SaveFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName, payload)
end)

--  CLIENT CONFIG VALIDATION
--  ========================

Ext.RegisterNetListener('S7_Config::ConfigValidation', function (channel, payload)
    local verify = Ext.LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or ""

    for clientID, compare in pairs(Ext.JsonParse(payload)) do
        local message = clientID .. " : "
        if ValidString(verify) and compare == verify then Ext.PostMessageToServer('S7_Config::ConfigValidationResponse', message .. "Config verified")
        else Ext.PostMessageToServer('S7_Config::ConfigValidationResponse', message .. "Config mismatch detected") end
    end
end)
