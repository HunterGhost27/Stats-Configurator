--  ###################################################################################################################################################
--                                                                      STATS CONFIG AND SYNC
--  ===================================================================================================================================================
logSource = "Lua:S7_StatsConfigurator"
Ext.Require("S7_ConfigAuxiliary.lua")
--  ###################################################################################################################################################

--  ##################
--  STATS-CONFIGURATOR
--  ##################

toConfigure = {} -- holds a list of stringified-jsons that need to be configured.
toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

function S7_StatsConfigurator()
    for i, config in ipairs(toConfigure) do --  Iterate over toConfigure queue
        for modID, JSONstring in pairs(config) do
            if (type(JSONstring) == "string") and (JSONstring ~= "") and (JSONstring ~= nil) then --  if json exists and is not empty.
                local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.

                S7_DebugLog(modID .. " loaded. Applying Configuration Profile.")
                S7_DebugLog("=============================================================")
                for name, content in pairs(JSONborne) do --  Iterate over JSONborne.
                    S7_DebugLog(name)
                    S7_DebugLog("-------------------------------------------------------------")

                    local stat = Ext.GetStat(name) --  Gets original stat-entry.
                    if stat ~= nil then
                        for key, value in pairs(content) do
                            if S7_SafeToModify(key) == true then --  Checks if key is safe to modify
                                S7_DebugLog(key .. ": " .. value .. " (" .. Ext.JsonStringify(stat[key]) .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                                stat[key] = S7_Rematerialize(value) --  Sets new value for Name[Attribute]
                            end
                        end
                    else
                        S7_DebugLog("Error 404 - " .. name .. " not found!", "[Error]")
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
    local dontFwith = --  dont mess with these keys
        "AoEConditions, TargetConditions, ForkingConditions, CycleConditions, SkillProperties, WinBoost, LoseBoost"

    if S7_ConfigSettings.BypassSafetyCheck == true then --  Manual-Override setting is true.
        return true --  S7_SafeToModify() returns true for everything.
    else -- Default Setting
        if string.match(dontFwith, key) then --  If key matches.
            S7_DebugLog(key .. ": Modification Prevented by S7_SafeToModify()", "[Warning]")
            return false --  Stop it right there.
        else
            return true --  else continue.
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

--  BUILD CONFIG-DATA
--  =================

function S7_BuildConfigData(buildData)
    local configData = Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName)
    local configTable = {}
    if configData ~= nil then
        configTable = Ext.JsonParse(configData)
        configTable["S7_Config"] = buildData
        Ext.SaveFile(S7_ConfigSettings.StatsLoader.FileName, Ext.JsonStringify(configTable))
    else
        Ext.SaveFile(S7_ConfigSettings.StatsLoader.FileName, "")
    end
end

--  ####################################################################################################################################################
