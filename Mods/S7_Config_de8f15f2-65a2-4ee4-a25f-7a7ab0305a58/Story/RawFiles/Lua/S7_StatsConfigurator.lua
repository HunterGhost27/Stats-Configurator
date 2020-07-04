--  ###################################################################################################################################################
--                                                                      STATS CONFIGURATOR
--  ===================================================================================================================================================
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_ConfigCollections.lua")
logSource = "Lua:StatsConfigurator"
--  ###################################################################################################################################################

--  ##################
--  STATS-CONFIGURATOR
--  ##################

toConfigure = {} -- holds a list of stringified-jsons that need to be configured.
toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat().

--  STATS CONFIGURATOR
--  ==================

function StatsConfigurator()
    for i, config in ipairs(toConfigure) do --  Iterate over toConfigure queue
        for modID, JSONstring in pairs(config) do
            if ValidJSONFile(JSONstring) then --  if json exists and is not empty.
                local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.
                S7_ConfigLog(modID .. " loaded. Applying configuration profile.")
                S7_ConfigLog("=============================================================")

                for keyName, content in pairs(JSONborne) do --  Iterate over JSONborne.
                    nameList = Rematerialize(UnpackCollection(keyName, content)) -- extract stat-names to nameList.
                    for name, _ in pairs(nameList) do
                        S7_ConfigLog(name)
                        S7_ConfigLog("-------------------------------------------------------------")
                        local stat = Ext.GetStat(name) --  Gets original stat-entry.

                        if Ext.IsServer() and stat == nil and ConfigSettings.CreateStats == true then -- Stat-Creation possible.
                            if content.Using ~= nil and Osi.NRD_StatExists(content.Using) then -- parent specified.
                                Ext.CreateStat(name, Osi.NRD_StatGetType(content.Using), content.Using)
                                S7_ConfigLog("Created stat: " .. name .. " using " .. content.Using)
                            else
                                S7_ConfigLog("Can't create stat: " .. name .. " : (using) template not specified.")
                            end
                        elseif stat ~= nil then -- Stat already exists.
                            for key, value in pairs(content) do
                                if SafeToModify(key) then --  Checks if attribute key is safe to modify.
                                    S7_ConfigLog(key .. ": " .. value .. " (" .. Ext.JsonStringify(stat[key]) .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                                    stat[key] = Rematerialize(value) --  Sets new value for Name[Attribute]
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

function UnpackCollection(keyName, content) --  Determines if keyName is a collection and returns a table of stat-entries.
    local returnNameList = {} -- return variable
    if string.match(keyName, "COLLECTION") then -- if config entry has "COLLECTION" keyword.
        for collectionName in string.gmatch(keyName, "[^%s]+") do -- split entry into "COLLECTION" and "CollectionName"
            if collectionName ~= "COLLECTION" then -- Filter "CollectionName"
                if configCollections[collectionName] ~= nil then --  if collection exists.
                    S7_ConfigLog("Unpacking collection " .. collectionName)
                    for statName, _ in pairs(configCollections[collectionName]) do -- iterate over collection.
                        returnNameList[statName] = 1 --  record statNames.
                    end
                else
                    S7_ConfigLog("No collection named " .. collectionName .. " found.", "[Error]")
                end
            end
        end
    else
        returnNameList[keyName] = 1 --  if not a collection, just record keyName as statName
    end
    return returnNameList --  return table of statNames.
end

function SafeToModify(key) --  Checks if key is safe to modify.
    local dontFwith = --  dont mess with these keys
        "AoEConditions, TargetConditions, ForkingConditions, CycleConditions, SkillProperties, WinBoost, LoseBoost, RootTemplate"

    if ConfigSettings.BypassSafetyCheck == true then --  Manual-Override setting is true.
        return true --  SafeToModify() returns true for everything.
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

function StatsSynchronize()
    if toSync ~= nil then --  Stats were modified. toSync is not empty.
        S7_ConfigLog(
            "Synchronizing Stats [Savegame-Persistence: " .. tostring(ConfigSettings.SyncStatPersistence) .. "]",
            "[Lua]"
        )
        S7_ConfigLog("=============================================================")

        for i, name in ipairs(toSync) do --  Iterate over toSync queue.
            if Osi.NRD_StatExists(name) then -- if stat-exists.
                Ext.SyncStat(name, ConfigSettings.SyncStatPersistence) --  Sync
                S7_ConfigLog("Synchronized Stat: " .. name)
            end
            toSync[i] = nil --  Clears out toSync entry.
        end
        S7_ConfigLog("=============================================================")
        S7_ConfigLog("Synchronization Complete.", nil, "SyncStat")
    else
        S7_ConfigLog("Nothing to Synchronize. toSync queue is empty.", "[Warning]", "SyncStat")
    end
end

--  BUILD CONFIG-DATA
--  =================

function BuildConfigData(buildData, modUUID, modName) --  Rebuilds/updates ConfigData file.
    local modName = modName or "Unassigned"
    if modUUID ~= nil then
        local configTable = {} --  temporary table.
        local file = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) --  Load existing file.
        if ValidJSONFile(file) then
            configTable = Ext.JsonParse(file) -- gets existing ConfigData.
        else
            Ext.SaveFile(ConfigSettings.StatsLoader.FileName, "") --  if ConfigData doesn't exist, create empty file.
        end

        configTable[modUUID] = {
            ["ModUUID"] = modUUID,
            ["ModName"] = modName,
            ["Content"] = buildData
        }

        Ext.SaveFile(ConfigSettings.StatsLoader.FileName, Ext.JsonStringify(configTable)) --  Save ConfigData
    else
        S7_ConfigLog("Invalid modUUID. Can't build " .. ConfigSettings.StatsLoader.FileName, "[Error]")
    end
end

--  ####################################################################################################################################################
