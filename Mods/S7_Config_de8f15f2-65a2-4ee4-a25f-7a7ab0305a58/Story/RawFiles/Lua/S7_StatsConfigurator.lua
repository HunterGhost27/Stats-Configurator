--  #############################
--      STATS CONFIG AND SYNC
--  #############################

fileName = "S7_StatsConfigurator.lua"

--  =================================
Ext.Require("S7_ConfigAuxiliary.lua")
--  =================================

--  STATS-CONFIGURATOR
--  ==================

-- queues jsons that need to be configured.
toConfigure = {}
toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

function S7_StatsConfigurator() --  Recieves stringified JSON from Ext.LoadFile(), Osiris or a mod.
    for i, config in ipairs(toConfigure) do
        for modID, configure in pairs(config) do
            local JSONstring = configure
            if (type(JSONstring) == "string") and (JSONstring ~= "") and (JSONstring ~= nil) then --  if json file exists and is not empty.
                local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.

                S7_DebugLog("JSON loaded. Applying Configuration Profile.\n", "[Lua]")
                S7_DebugLog("=============================================================", "[Lua]")
                for name, content in pairs(JSONborne) do --  Iterate over JSONborne.
                    S7_DebugLog(name, "[Lua]")
                    S7_DebugLog("-------------------------------------------------------------", "[Lua]")

                    local stat = Ext.GetStat(name) --  Gets original stat-entry.
                    for key, value in pairs(content) do
                        if S7_SafeToModify(key) then --  Checks if key is safe to modify
                            S7_DebugLog(key .. ": " .. value .. " (" .. stat[key] .. ")", "[Lua]") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                            stat[key] = value --  Sets new value for Name[Attribute]
                        end
                    end

                    S7_DebugLog("_____________________________________________________________\n", "[Lua]")
                    table.insert(toSync, name) --  Records stat-ids of the modified stats. To call Ext.SyncStat() on them later.
                end
                S7_DebugLog("=============================================================", "[Lua]")
                S7_DebugLog("Configuration Profile Active.", "[Lua]", "StatsConfigurator")
            else
                S7_DebugLog("Failed to load JSON.", "[Lua]", "StatsConfigurator")
            end
        end
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
                S7_DebugLog(key .. ": Modification Prevented by S7_SafeToModify()", "[Warning]")
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
        S7_DebugLog(
            "Synchronizing Stats [Savegame-Persistence: " .. tostring(S7_ConfigSettings.SyncStatPersistence) .. "]",
            "[Lua]"
        )
        S7_DebugLog("=============================================================", "[Lua]")

        for i, name in ipairs(toSync) do
            Ext.SyncStat(name, S7_ConfigSettings.SyncStatPersistence) --  Sync
            S7_DebugLog("Synchronized Stat: " .. name, "[Lua]")
            toSync[i] = nil --  Clears out toSync entry.
        end
        S7_DebugLog("=============================================================", "[Lua]")
        S7_DebugLog("Synchronization Complete.", "[Lua]", "SyncStat")
    elseif type(next(toSync)) == "nil" then
        S7_DebugLog("Nothing to Synchronize. toSync queue is empty.", "[Warning]", "SyncStat")
    end
end

--  ####################################################################################################################################################
