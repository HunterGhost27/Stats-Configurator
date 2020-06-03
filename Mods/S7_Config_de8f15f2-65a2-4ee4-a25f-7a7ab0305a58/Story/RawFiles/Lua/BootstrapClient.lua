--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  #################################################################################################################################

logSource = "Lua:BootstrapClient"

--  ===================================
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
--  ===================================

local function S7_StatsLoader() --  Loads stats-configuration json during StatsLoaded Event.
    local JSONstring = Ext.LoadFile("S7_Config.json") --  Only loads S7_Config.json.
    S7_StatsConfigurator(JSONstring) --  Pass stringified JSON to StatsConfigurator()
end

--  ===============================================
Ext.RegisterListener("StatsLoaded", S7_StatsLoader)
--  ===============================================

--  ##################################################################################################################################
