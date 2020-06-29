--  #################################################################################################################################
--  #########                                       STATS CONFIGURATOR - BOOTSTRAPCLIENT                                    #########
--  =================================================================================================================================
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_ConfigCollections.lua")
Ext.Require("S7_StatsConfigurator.lua")
Ext.Require("S7_ConsoleCommander.lua")
logSource = "Lua:BootstrapClient"
--  #################################################################################################################################

--  ============
--  STATS LOADER
--  ============

local function S7_StatsLoader() --  Loads stats-configuration json after StatsLoaded Event.
    if S7_ConfigSettings.StatsLoader.Enable == true then --  StatsLoader enabled in settings.
        S7_ConfigLog("Loading " .. S7_ConfigSettings.StatsLoader.FileName)
        local file = Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName) or "" --  Load file if it exists. Load empty string otherwise.
        if file ~= nil and file ~= "" then --  if configData file exists and is not empty.
            local configData = Ext.JsonParse(file) --  Parse into table.
            for modID, content in pairs(configData) do --  for each mod's configData
                table.insert(toConfigure, {[modID] = content}) --  Queue files for configuration.
            end
        end
        S7_StatsConfigurator() --  Configure Stats
        toConfigure = {} -- flush config queue
        toSync = {} --  flush Sync queue
        S7_ConfigLog("StatsLoading Completed.")
    end
end

--  ===============================================
Ext.RegisterListener("StatsLoaded", S7_StatsLoader)
--  ===============================================

--  ===============
--  CATCH BROADCAST
--  ===============

local function S7_CatchBroadcast(channel, payload) --  Listens for broadcasts from the Server.
    if channel == "S7_ConfigData" then --  if broadcast channel is S7_ConfigData.
        S7_ConfigLog("Client recieved Active Configuration. Saving File: " .. S7_ConfigSettings.StatsLoader.FileName)
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
Ext.RegisterNetListener("S7_ConfigData", S7_CatchBroadcast)
Ext.RegisterNetListener("S7_ValidateClientConfig", S7_CatchBroadcast)
--  =================================================================

--  ##################################################################################################################################
