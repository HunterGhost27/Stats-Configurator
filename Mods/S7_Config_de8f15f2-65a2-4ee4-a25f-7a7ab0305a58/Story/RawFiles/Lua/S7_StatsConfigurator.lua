--  #############################
--      STATS CONFIG AND SYNC
--  #############################

--  ================================
Ext.Require("S7_ConfigSettings.lua")
--  ================================

--  STATS-CONFIGURATOR
--  ==================

toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

function S7_StatsConfigurator(JSONstring) --  Recieves stringified JSON from Ext.LoadFile(), Osiris or a mod.
    if (type(JSONstring) == "string") and (JSONstring ~= "") and (JSONstring ~= nil) then --  if json file exists and is not empty.
        local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.

        Ext.Print("[S7:Config - S7_StatsConfigurator.lua] --- JSON loaded. Applying Configuration Profile.\n")
        Ext.Print("=============================================================")
        for name, content in pairs(JSONborne) do --  Iterate over JSONborne.
            Ext.Print(name)
            Ext.Print("-------------------------------------------------------------")

            local stat = Ext.GetStat(name) --  Gets original stat-entry.
            for key, value in pairs(content) do
                if S7_SafeToModify(key) then --  Checks if key is safe to modify
                    Ext.Print(key .. ": " .. value .. " (" .. stat[key] .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                    stat[key] = value --  Sets new value for Name[Attribute]
                end
            end

            Ext.Print("_____________________________________________________________\n")
            table.insert(toSync, name) --  Records stat-ids of the modified stats. To call Ext.SyncStat() on them later.
        end
        Ext.Print("=============================================================")
        Ext.Print("[S7:Config - S7_StatsConfigurator.lua] --- Configuration Profile Active.")
        dialogVarToSet["StatsConfigurator"] = "Configuration Profile Active."
    else
        Ext.Print("[S7:Config - S7_StatsConfigurator.lua] --- Failed to load JSON.")
        dialogVarToSet["StatsConfigurator"] = "Failed to load JSON."
    end
end

function S7_SafeToModify(key) --  Checks if key is safe to modify.
    local dontFwith = {
        --  Don't mess with these keys.
        "MemorizationRequirements",
        "Requirements",
        "AoEConditions",
        "TargetConditions",
        "ForkingConditions",
        "CycleConditions",
        "SkillProperties",
        "WinBoost",
        "LoseBoost"
    }

    if S7_ConfigSettings.BypassSafetyCheck == true then --  Manual-Override setting is true.
        return true --  S7_SafeToModify() returns true for everything.
    else -- Default Setting
        for i, avoid in ipairs(dontFwith) do --  Iterate over keys to avoid.
            if key == avoid then --  If key matches.
                Ext.Print(key .. ": Modification Prevented by S7_SafeToModify()")
                return false --  Stop it right there.
            else
                return true --  else continue.
            end
        end
    end
end

--  STATS-SYNCHRONIZE
--  =================

function S7_StatsSynchronize()
    if type(next(toSync)) ~= "nil" then --  Stats were modified. toSync is not empty.
        Ext.Print(
            "[S7:Config - S7_StatsConfigurator.lua] --- Synchronizing Stats [Savegame-Persistence: " ..
                tostring(S7_ConfigSettings.SyncStatPersistence) .. "]"
        )
        Ext.Print("=============================================================")

        for i, name in ipairs(toSync) do
            Ext.SyncStat(name, S7_ConfigSettings.SyncStatPersistence) --  Sync
            Ext.Print("Synchronized Stat: " .. name)
            toSync[i] = nil --  Clears out toSync entry.
        end
        Ext.Print("=============================================================")
        dialogVarToSet["SyncStat"] = "Synchronization Complete."
    elseif type(next(toSync)) == "nil" then
        Ext.PrintWarning("[S7:Config - S7_StatsConfigurator.lua] --- Nothing to Synchronize. toSync queue is empty.")
        dialogVarToSet["SyncStat"] = "Nothing to Synchronize. toSync queue is empty."
    end
end

--  ####################################################################################################################################################
