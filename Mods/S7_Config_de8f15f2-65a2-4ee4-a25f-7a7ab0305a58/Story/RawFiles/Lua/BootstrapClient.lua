--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  =================================================================================================================================
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
logSource = "Lua:BootstrapClient"
--  #################################################################################################################################

local function S7_CatchBroadcast(channel, payload) --  Listens for broadcasts from the Server.
    if channel == "S7_ActiveConfig" then --  if broadcast channel is S7_ActiveConfig.
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
Ext.RegisterNetListener("S7_ActiveConfig", S7_CatchBroadcast)
Ext.RegisterNetListener("S7_ValidateClientConfig", S7_CatchBroadcast)
--  =================================================================

local function S7_StatsLoader() --  Loads stats-configuration json during StatsLoaded Event.
    if S7_ConfigSettings.StatsLoader.Enable == true then --  Enabled in settings
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

--  ##################################################################################################################################
