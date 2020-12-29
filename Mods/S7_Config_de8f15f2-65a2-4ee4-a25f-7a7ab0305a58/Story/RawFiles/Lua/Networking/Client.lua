
--  =================
--  CLIENT NETWORKING
--  =================

--- Listens for broadcasts from the Server
---@param channel string
---@param payload string
local function ClientNetworker(channel, payload)

    --  BROADCASTED CONFIG-DATA
    --  =======================

    if channel == "S7_ConfigData" then
        S7Debug:Print("Client recieved configuration. Saving file: " .. ConfigSettings.StatsLoader.FileName)
        SaveFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName, payload)
    end

    --  CLIENT CONFIG VALIDATION
    --  ========================

    if channel == "S7_ValidateClientConfig" then
        local verify = Ext.LoadFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName) or ""

        for clientID, compare in pairs(Ext.JsonParse(payload)) do
            local message = clientID .. " : "

            if ValidString(verify) and compare == verify then
                message = message .. "Active configuration profile verified."
                Ext.PostMessageToServer("S7_ValidateClientResponse", message)
            else
                message = message .. "Active configuration mismatch detected."
                Ext.PostMessageToServer("S7_ValidateClientResponse", message)
            end
        end
    end
end

--  ===============================================================
Ext.RegisterNetListener("S7_ConfigData", ClientNetworker)
Ext.RegisterNetListener("S7_ValidateClientConfig", ClientNetworker)
--  ===============================================================