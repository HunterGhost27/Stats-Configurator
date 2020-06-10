--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  =================================================================================================================================
logSource = "Lua:BootstrapClient"
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
--  #################################################################################################################################

local function S7_CatchBroadcast(channel, payload) --  Listens for broadcasts from the Server.
    if channel == "S7_ActiveConfig" then --  if broadcast channel is S7_ActiveConfig.
        S7_DebugLog("Client recieved Active Configuration. Saving File: " .. S7_ConfigSettings.StatsLoader.FileName)
        Ext.SaveFile(S7_ConfigSettings.StatsLoader.FileName, payload) --  Save stringified json.
    end

    if channel == "S7_ValidateClientConfig" then --  if broadcast channel is S7_ValidateClientConfig
        local verify = Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName) or "" --    Load local ActiveConfiguration if available
        if payload == verify then
            Ext.PostMessageToServer("S7_ValidateClientResponse", "All Good.")
        else
            Ext.PostMessageToServer("S7_ValidateClientResponse", "Config Mismatch Detected.")
        end
    end
end

--  =================================================================
Ext.RegisterNetListener("S7_ActiveConfig", S7_CatchBroadcast)
Ext.RegisterNetListener("S7_ValidateClientConfig", S7_CatchBroadcast)
--  =================================================================

local function S7_StatsLoader() --  Loads stats-configuration json during StatsLoaded Event.
    if S7_ConfigSettings.StatsLoader.Enable == true then
        S7_DebugLog("Loading " .. S7_ConfigSettings.StatsLoader.FileName)
        local file = Ext.JsonParse(Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName))
        if file ~= nil and file ~= "" then
            for modID, content in pairs(file) do
                table.insert(toConfigure, {[modID] = content}) --  Queue files for configuration.
            end
        end
        S7_StatsConfigurator() --  Pass stringified JSON to StatsConfigurator()
        toConfigure = {} -- flush list
        S7_DebugLog("StatsLoading Completed.")
    end
end

--  ===============================================
Ext.RegisterListener("StatsLoaded", S7_StatsLoader)
--  ===============================================

--  ##################################################################################################################################
