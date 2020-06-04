--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  #################################################################################################################################

--  ===================================
logSource = "Lua:BootstrapClient"
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
--  ===================================

local function S7_StatsLoader() --  Loads stats-configuration json during StatsLoaded Event.
    local files = S7_ConfigSettings.ConfigFiles --  lists all config files.
    for i, fileName in ipairs(files) do --  Iterate over each file.
        S7_DebugLog("Loading " .. fileName, "[Lua]")
        table.insert(toConfigure, {["S7_Config"] = Ext.LoadFile(fileName) or ""})
    end
    S7_StatsConfigurator() --  Pass stringified JSON to StatsConfigurator()
    toConfigure = {} -- flush list
end

--  ===============================================
Ext.RegisterListener("StatsLoaded", S7_StatsLoader)
--  ===============================================

--  ##################################################################################################################################
