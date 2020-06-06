--  ###################################################################################################################################################
--                                                                      STATS CONFIG AND SYNC
--  ===================================================================================================================================================
logSource = "Lua:S7_StatsConfigurator"
Ext.Require("S7_ConfigAuxiliary.lua")
--  ###################################################################################################################################################

--  ##################
--  STATS-CONFIGURATOR
--  ##################

toConfigure = {} -- queues jsons that need to be configured.
toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

function S7_StatsConfigurator()
    for i, config in ipairs(toConfigure) do
        for modID, JSONstring in pairs(config) do
            if (type(JSONstring) == "string") and (JSONstring ~= "") and (JSONstring ~= nil) then --  if json file exists and is not empty.
                local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.

                S7_DebugLog(modID .. " loaded. Applying Configuration Profile.")
                S7_DebugLog("=============================================================")
                for name, content in pairs(JSONborne) do --  Iterate over JSONborne.
                    S7_DebugLog(name)
                    S7_DebugLog("-------------------------------------------------------------")

                    local stat = Ext.GetStat(name) --  Gets original stat-entry.
                    for key, value in pairs(content) do
                        if S7_SafeToModify(key) then --  Checks if key is safe to modify
                            S7_DebugLog(key .. ": " .. value .. " (" .. stat[key] .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                            stat[key] = value --  Sets new value for Name[Attribute]
                        end
                    end
                    S7_DebugLog("_____________________________________________________________")
                    table.insert(toSync, name) --  Records stat-ids of the modified stats. To call Ext.SyncStat() on them later.
                end
                S7_DebugLog("=============================================================")
                S7_DebugLog("Configuration Profile Active.", nil, "StatsConfigurator")
            else
                S7_DebugLog("Failed to apply configuration.", "[Error]", "StatsConfigurator")
            end
        end
    end
end

function S7_SafeToModify(key) --  Checks if key is safe to modify.
    local dontFwith = {
        --  Don't mess with these keys.
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
        S7_DebugLog("=============================================================")

        for i, name in ipairs(toSync) do
            Ext.SyncStat(name, S7_ConfigSettings.SyncStatPersistence) --  Sync
            S7_DebugLog("Synchronized Stat: " .. name)
            toSync[i] = nil --  Clears out toSync entry.
        end
        S7_DebugLog("=============================================================")
        S7_DebugLog("Synchronization Complete.", nil, "SyncStat")
    elseif type(next(toSync)) == "nil" then
        S7_DebugLog("Nothing to Synchronize. toSync queue is empty.", "[Warning]", "SyncStat")
    end
end

--  BUILD ACTIVE CONFIG
--  ===================

function S7_BuildActiveConfig() --  Creates S7_ActiveConfig.json from the staged changes.
    --  Load existing data from S7_ActiveConfig.json
    local currentData = {}
    local ActiveConfig = Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName) or ""
    if ActiveConfig ~= "" then
        currentData = Ext.JsonParse(ActiveConfig)
    end

    --  Add data from toConfigure for export
    local buildConfig = S7_Rematerialize(toConfigure) or nil
    for i, content in ipairs(buildConfig) do
        for modID, modString in pairs(content) do
            local string = Ext.JsonParse(modString)
            for key, value in pairs(string) do
                currentData[key] = value
            end
        end
    end

    Ext.SaveFile(S7_ConfigSettings.StatsLoader.FileName, Ext.JsonStringify(currentData))
    S7_DebugLog("Staged profile exported to S7_ActiveConfig.json")
    toConfigure = {}
end

--  PUSH ACTIVE CONFIG TO CLIENTS
--  =============================

function S7_BroadcastToClients()
    local broadcast = Ext.LoadFile("S7_ActiveConfig.json") or ""
    Ext.BroadcastMessage("S7_ActiveConfig", broadcast)
    S7_DebugLog("Server broadcasts Active Configuration Profile.")
end

--  ####################################################################################################################################################
