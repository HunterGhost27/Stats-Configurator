--  ################################################################################################################
--  ########                                       STATS CONFIGURATOR                                       ########
--  ################################################################################################################

--  ##################
--       MOD-MENU
--  ##################

local function S7_Config_ModMenuSignal(Signal) --  Signal recieved from Osiris
    if Signal == "S7_StatsConfigurator" then --  Load JSON and Configure Stats
        S7_StatsConfigurator() --  Call StatsConfigurator
    end
    if Signal == "S7_StatsSynchronize" then --  Synchronize stats between all clients
        S7_StatsSynchronize() --  Call StatsSynchronize
    end
end

--  ==============================================================================
Ext.NewCall(S7_Config_ModMenuSignal, "S7_Config_ModMenuSignal", "(STRING)_Signal")
--  ==============================================================================

toSync = {}

function S7_StatsConfigurator()
    Ext.Print("[S7:Config - BootstrapServer.lua] --- Loading S7_Config.json")
    local JSONstring = Ext.LoadFile("S7_Config.json") --  Loads Configuration File.
    local JSONborne = Ext.JsonParse(JSONstring) --  Parse JSONstring.

    if JSONborne ~= nil then --  JSONborne is not empty.
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON file loaded. Applying Configuration Profile.\n\n")

        Ext.Print("=============================================================")
        for name, content in pairs(JSONborne) do --  Iterate over JSONborne
            Ext.Print(name)
            Ext.Print("-------------------------------------------------------------")

            local stat = Ext.GetStat(name) --  Gets original stat-entry
            for key, value in pairs(content) do
                Ext.Print(key .. ": " .. value .. "\t(" .. stat[key] .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                stat[key] = value --  Sets new value for Name[Attribute]
            end
            Ext.Print("_____________________________________________________________")
            Ext.Print("\n")
            table.insert(toSync, name)
        end
        Ext.Print("=============================================================")
    else
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON file could not be loaded.")
    end
    Ext.Print("[S7:Config - BootstrapServer.lua] --- Configuration Profile Active.")
end

--  =========================================================
-- Ext.RegisterListener("StatsLoaded", S7_StatsConfigurator)
Ext.NewCall(S7_StatsConfigurator, "S7_StatsConfigurator", "")
--  =========================================================

function S7_StatsSynchronize()
    if toSync ~= nil then
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Synchronizing Stats.")
        Ext.Print("==========================================================")
        for i, name in ipairs(toSync) do
            Ext.SyncStat(name)
            Ext.Print("Synchronized Stat: " .. name)
            toSync[i] = nil
        end
        Ext.Print("==========================================================")
    elseif toSync[1] == nil then
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Failed to Synchronize. toSync queue is empty.")
    else
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Failed to Synchronize. toSync is nil.")
    end
end

--  =========================================================
Ext.NewCall(S7_StatsSynchronize, "S7_StatsSynchronize", "")
--  =========================================================
