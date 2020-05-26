--  ################################################################################################################
--  ########                                       STATS CONFIGURATOR                                       ########
--  ################################################################################################################

--  ##################
--       MOD-MENU
--  ##################

local function S7_Config_ModMenuSignal(Signal) --  Signal recieved from Osiris
    if Signal == "S7_StatsConfigurator" then --  Load JSON and Configure Stats
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Loading S7_Config.json")
        local JSONstring = Ext.LoadFile("S7_Config.json") --  Loads Configuration File.
        S7_StatsConfigurator(JSONstring) --  Call StatsConfigurator
    end

    if Signal == "S7_StatsSynchronize" then --  Synchronize stats between all clients
        S7_StatsSynchronize() --  Call StatsSynchronize
    end
end

--  ==============================================================================
Ext.NewCall(S7_Config_ModMenuSignal, "S7_Config_ModMenuSignal", "(STRING)_Signal")
--  ==============================================================================

toSync = {}

function S7_StatsConfigurator(JSONstring)
    local JSONborne = Ext.JsonParse(JSONstring) --  Parse JSONstring.

    if JSONborne ~= nil then --  JSONborne is not empty.
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON loaded. Applying Configuration Profile.\n\n")

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
    S7_StatsSynchronize()
end

--  =========================================================
-- Ext.RegisterListener("StatsLoaded", S7_StatsConfigurator)
Ext.NewCall(S7_StatsConfigurator, "S7_StatsConfigurator", "")
--  =========================================================

function S7_StatsSynchronize()
    if type(next(toSync)) ~= "nil" then
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Synchronizing Stats.")
        Ext.Print("==========================================================")

        for i, name in ipairs(toSync) do
            Ext.SyncStat(name)
            Ext.Print("Synchronized Stat: " .. name)
            toSync[i] = nil
        end
        Ext.Print("==========================================================")
    elseif type(next(toSync)) == "nil" then
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Failed to Synchronize. toSync queue is empty.")
    end
end

--  =========================================================
Ext.NewCall(S7_StatsSynchronize, "S7_StatsSynchronize", "")
--  =========================================================

local function S7_InspectStats(StatsID, StatType)
    local allstat = Ext.GetStatEntries(StatType)

    for name, content in pairs(allstat) do
        if content == StatsID then
            Ext.Print("(" .. StatType .. "): " .. StatsID)
        end
    end
end

--  ==================================================================================
Ext.NewCall(S7_InspectStats, "S7_InspectStats", "(STRING)_StatsID, (STRING)_StatType")
--  ==================================================================================

--  ####################
--      ISSUE-TRACKER
--  ####################

--  Cone skills are unsupported.
--  Memorization-Requirements bugged in tooltips. Show up multiple times.

-- dontFwith = {
--     "AoEConditions",
--     "TargetConditions",
--     "ForkingConditions",
--     "CycleConditions",
--     "SkillProperties",
--     "WinBoost",
--     "LoseBoost"
-- }
