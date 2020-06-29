--  ###################################################################################################################################################
--                                                                      STATS CONFIG AND SYNC
--  ===================================================================================================================================================
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_ConfigCollections.lua")
logSource = "Lua:S7_StatsConfigurator"
--  ###################################################################################################################################################

--  ##################
--  STATS-CONFIGURATOR
--  ##################

toConfigure = {} -- holds a list of stringified-jsons that need to be configured.
toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

function S7_StatsConfigurator()
    for i, config in ipairs(toConfigure) do --  Iterate over toConfigure queue
        for modID, JSONstring in pairs(config) do
            if S7_ValidJSON(JSONstring) then --  if json exists and is not empty.
                local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.

                S7_ConfigLog(modID .. " loaded. Applying Configuration Profile.")
                S7_ConfigLog("=============================================================")
                for keyName, content in pairs(JSONborne) do --  Iterate over JSONborne.
                    nameList = S7_Rematerialize(S7_DetermineKey(keyName, content))
                    for name, _ in pairs(nameList) do
                        S7_ConfigLog(name)
                        S7_ConfigLog("-------------------------------------------------------------")

                        local stat = Ext.GetStat(name) --  Gets original stat-entry.
                        if stat ~= nil then
                            for key, value in pairs(content) do
                                if S7_SafeToModify(key) == true then --  Checks if key is safe to modify
                                    S7_ConfigLog(key .. ": " .. value .. " (" .. Ext.JsonStringify(stat[key]) .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                                    stat[key] = S7_Rematerialize(value) --  Sets new value for Name[Attribute]
                                else
                                    S7_ConfigLog(key .. " is not a valid attribute for " .. name)
                                end
                            end
                        else
                            S7_ConfigLog("Error 404 - " .. name .. " not found!", "[Error]")
                        end
                        S7_ConfigLog("_____________________________________________________________")
                        table.insert(toSync, name) --  Records stat-ids of the modified stats. To call Ext.SyncStat() on them later.
                    end
                end
                S7_ConfigLog("=============================================================")
                S7_ConfigLog("Configuration Profile Active.", nil, "StatsConfigurator")
            else
                S7_ConfigLog("Failed to apply configuration.", "[Error]", "StatsConfigurator")
            end
        end
    end
end

function S7_DetermineKey(keyName, content)
    local returnNameList = {}
    if string.match(keyName, "COLLECTION") then
        for substring in string.gmatch(keyName, "[^%s]+") do
            if substring ~= "COLLECTION" then
                for subcollection, _ in pairs(configCollections[substring]) do
                    returnNameList[subcollection] = 1
                end
            end
        end
    elseif string.match(keyName, "CREATE") and Ext.IsServer() then
        for substring in string.gmatch(keyName, "[^%s]+") do
            if substring ~= "CREATE" then
                if content.Using ~= nil or content.Using ~= "" then
                    Ext.CreateStat(substring, Osi.NRD_StatGetType(content.Using), content.Using)
                    returnNameList[substring] = 1
                end
            end
        end
    else
        returnNameList[keyName] = 1
    end
    return returnNameList
end

function S7_SafeToModify(key) --  Checks if key is safe to modify.
    local dontFwith = --  dont mess with these keys
        "AoEConditions, TargetConditions, ForkingConditions, CycleConditions, SkillProperties, WinBoost, LoseBoost, RootTemplate"

    if ConfigSettings.BypassSafetyCheck == true then --  Manual-Override setting is true.
        return true --  S7_SafeToModify() returns true for everything.
    else -- Default Setting
        if string.match(dontFwith, key) then --  If key matches.
            S7_ConfigLog(key .. " Modification Prevented by SafetyCheck.", "[Warning]")
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
        S7_ConfigLog(
            "Synchronizing Stats [Savegame-Persistence: " .. tostring(ConfigSettings.SyncStatPersistence) .. "]",
            "[Lua]"
        )
        S7_ConfigLog("=============================================================")

        for i, name in ipairs(toSync) do
            Ext.SyncStat(name, ConfigSettings.SyncStatPersistence) --  Sync
            S7_ConfigLog("Synchronized Stat: " .. name)
            toSync[i] = nil --  Clears out toSync entry.
        end
        S7_ConfigLog("=============================================================")
        S7_ConfigLog("Synchronization Complete.", nil, "SyncStat")
    elseif type(next(toSync)) == "nil" then
        S7_ConfigLog("Nothing to Synchronize. toSync queue is empty.", "[Warning]", "SyncStat")
    end
end

--  BUILD CONFIG-DATA
--  =================

function S7_BuildConfigData(modID, buildData) --  Rebuilds/updates ConfigData file.
    local configTable = {}
    local file = Ext.LoadFile(ConfigSettings.StatsLoader.FileName)
    if file ~= nil and file ~= "" then
        configTable = Ext.JsonParse(file) -- gets existing ConfigData
    else
        Ext.SaveFile(ConfigSettings.StatsLoader.FileName, "{}") --  if ConfigData doesn't exist, create empty file.
    end
    configTable[modID] = buildData --  Update ConfigData
    Ext.SaveFile(ConfigSettings.StatsLoader.FileName, Ext.JsonStringify(configTable)) --  Save ConfigData
end

--  ####################################################################################################################################################
