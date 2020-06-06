--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  =================================================================================================================================
logSource = "Lua:BootstrapClient"
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
--  #################################################################################################################################

local function S7_CatchBroadcast(channel, payload)
    S7_DebugLog("Client recieved Active Configuration. Saving File.")
    Ext.SaveFile("S7_ActiveConfig.json", payload)
end

--  =========================================================
Ext.RegisterNetListener("S7_ActiveConfig", S7_CatchBroadcast)
--  =========================================================

local function S7_StatsLoader() --  Loads stats-configuration json during StatsLoaded Event.
    if S7_ConfigSettings.StatsLoader.Enable == true then
        local fileName = S7_ConfigSettings.StatsLoader.FileName --  lists all config files.
        S7_DebugLog("Loading " .. fileName)
        table.insert(toConfigure, {[fileName] = Ext.LoadFile(fileName)}) --  Queue files for configuration.
        S7_StatsConfigurator() --  Pass stringified JSON to StatsConfigurator()
        toConfigure = {} -- flush list
        S7_DebugLog("StatsLoading Completed.")
    end
end

--  ===============================================
Ext.RegisterListener("StatsLoaded", S7_StatsLoader)
--  ===============================================

--  ##################################################################################################################################
