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

local function StatsLoader() --  Loads stats-configuration json after StatsLoaded Event.
    if ConfigSettings.StatsLoader.Enable == true then --  StatsLoader enabled in settings.
        S7_ConfigLog("Loading " .. ConfigSettings.StatsLoader.FileName)
        local file = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) or "" --  Load file if it exists. Load empty string otherwise.
        if ValidJSONFile(file) then --  if configData file exists and is not empty.
            local configData = Ext.JsonParse(file) --  Parse into table.
            for modID, content in pairs(configData) do --  for each mod's configData
                table.insert(toConfigure, {[modID] = content}) --  Queue files for configuration.
            end
        end
        S7_StatsConfigurator() --  Configure Stats
        toConfigure = {} -- flush config queue
        toSync = {} --  flush Sync queue
        S7_ConfigLog("StatsLoading Completed.")
    else --  if StatsLoader disabled in settings.
        S7_ConfigLog("StatsLoader is disabled.", "[Warning]")
    end
end

--  ============================================
Ext.RegisterListener("StatsLoaded", StatsLoader)
--  ============================================

--  ===============
--  CATCH BROADCAST
--  ===============

local function CatchBroadcast(channel, payload) --  Listens for broadcasts from the Server.
    if channel == "S7_ConfigData" then --  if broadcast channel is S7_ConfigData.
        S7_ConfigLog("Client recieved Active Configuration. Saving File: " .. ConfigSettings.StatsLoader.FileName)
        Ext.SaveFile(ConfigSettings.StatsLoader.FileName, payload) --  Save stringified json.
    end

    if channel == "S7_ValidateClientConfig" then --  if broadcast channel is S7_ValidateClientConfig
        local verify = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) or "" --    Load local ActiveConfiguration if available
        if payload == verify then
            Ext.PostMessageToServer("S7_ValidateClientResponse", "All Good.")
        else
            Ext.PostMessageToServer("S7_ValidateClientResponse", "Config Mismatch Detected.")
        end
    end
end

--  ==============================================================
Ext.RegisterNetListener("S7_ConfigData", CatchBroadcast)
Ext.RegisterNetListener("S7_ValidateClientConfig", CatchBroadcast)
--  ==============================================================

--  ##################################################################################################################################
