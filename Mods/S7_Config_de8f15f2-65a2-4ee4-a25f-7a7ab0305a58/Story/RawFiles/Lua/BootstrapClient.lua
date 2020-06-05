--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  #################################################################################################################################

--  ===================================
logSource = "Lua:BootstrapClient"
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
--  ===================================

local function S7_StatsLoader() --  Loads stats-configuration json during StatsLoaded Event.
    local fileName = S7_ConfigSettings.StatsLoader.FileName --  lists all config files.
    S7_DebugLog("Loading " .. fileName)
    table.insert(toConfigure, {[fileName] = Ext.LoadFile(fileName)}) --  Queue files for configuration.
    S7_StatsConfigurator() --  Pass stringified JSON to StatsConfigurator()
    toConfigure = {} -- flush list
    S7_DebugLog("StatsLoading Completed.")
end

--  ===============================================
Ext.RegisterListener("StatsLoaded", S7_StatsLoader)
--  ===============================================

--  ##################################################################################################################################
