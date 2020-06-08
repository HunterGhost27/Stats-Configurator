--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  =================================================================================================================================
logSource = "Lua:BootstrapClient"
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
--  #################################################################################################################################

local function S7_CatchBroadcast(channel, payload) --  Listens for broadcasts from the Server.
    if channel == "S7_ActiveConfig" then --  if broadcast channel is S7_ActiveConfig.
        local unpack = Ext.JsonParse(payload)
        for fileName, content in pairs(unpack) do
            S7_DebugLog("Client recieved Active Configuration. Saving File: " .. fileName)
            Ext.SaveFile(fileName, content) --  Save stringified json.
        end
    end

    if channel == "S7_ValidateClientConfig" then --  if broadcast channel is S7_ValidateClientConfig
        local verify = Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName) or "" --    Load local ActiveConfiguration if available
        if payload == verify then
            Ext.PostMessageToServer("S7_ValidateClientResponse", "All Good.")
        else
            Ext.PostMessageToServer("S7_ValidateClientResponse", "Not Good.")
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
        table.insert(
            toConfigure,
            {[S7_ConfigSettings.StatsLoader.FileName] = Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName)}
        ) --  Queue files for configuration.
        S7_StatsConfigurator() --  Pass stringified JSON to StatsConfigurator()
        toConfigure = {} -- flush list
        S7_DebugLog("StatsLoading Completed. ")
    end
end

--  ===============================================
Ext.RegisterListener("StatsLoaded", S7_StatsLoader)
--  ===============================================

--  ##################################################################################################################################
