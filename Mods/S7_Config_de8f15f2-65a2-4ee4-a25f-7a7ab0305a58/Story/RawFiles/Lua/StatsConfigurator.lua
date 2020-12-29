--  ==================
--  STATS-CONFIGURATOR
--  ==================

Configurations = {}
Synchronizations = {}

--  STATS CONFIGURATOR
--  ==================

function StatsConfigurator()
    for _, config in Spairs(Configurations, 'ascending') do
        for modID, JSONstring in pairs(config) do
            if not ValidString(JSONstring) then S7DebugPrint("Failed to apply configuration.", "StatsConfigurator", "StatsConfigurator", nil, "Error") end
            local JSONborne = Ext.JsonParse(JSONstring)
            S7DebugPrint(modID .. " loaded. Applying configuration profile.", "StatsConfigurator")
            S7DebugPrint("=============================================================", "StatsConfigurator")

            for keyName, content in pairs(JSONborne) do
                local nameList = UnpackCollection(keyName, content)
                for name, _ in pairs(nameList) do
                    S7DebugPrint(name, "StatsConfigurator")
                    S7DebugPrint("-------------------------------------------------------------", "StatsConfigurator")
                    local stat = Ext.GetStat(name)

                    for key, value in pairs(content) do
                        if SafeToModify(name, key) then
                            S7DebugPrint(key .. ": " .. Ext.JsonStringify(value) .. " (" .. Ext.JsonStringify(stat[key]) .. ")", "StatsConfigurator")
                            Ext.StatSetAttribute(name, key, Rematerialize(value))
                        end
                    end
                    S7DebugPrint("_____________________________________________________________", "StatsConfigurator")
                    Synchronizations[name] = 1
                end
            end
            S7DebugPrint("=============================================================", "StatsConfigurator")
            S7DebugPrint("Configuration Profile Active.", "StatsConfigurator")
        end
    end
end

function UnpackCollection(keyName, content)
    local returnNameList = {}

    if string.match(keyName, "COLLECTION") then
        for collectionName in string.gmatch(keyName, "[%w]+") do
            if collectionName ~= "COLLECTION" then
                if Collections[collectionName] then
                    S7DebugPrint("Unpacking collection " .. collectionName, "StatsConfigurator")
                    for statName, _ in pairs(Collections[collectionName]) do returnNameList[statName] = 1 end
                else S7DebugPrint("No collection named " .. collectionName .. " found.", "StatsConfigurator", nil, nil, "Error") end
            end
        end
    else returnNameList[keyName] = 1 end
    return returnNameList
end

function SafeToModify(name, key)
    local dontFwith =
        [[
        "AoEConditions",
        "TargetConditions",
        "ForkingConditions",
        "CycleConditions",
        "SkillProperties",
        "WinBoost",
        "LoseBoost",
        "RootTemplate"
    ]] --  dont mess with these keys

    if ConfigSettings.BypassSafetyCheck then return true
    else
        if string.match(dontFwith, key) then
            S7DebugPrint("SafeToModify() prevents modification of " .. key .. " [BypassSafetyCheck: " .. tostring(ConfigSettings.BypassSafetyCheck) .. "]", "StatsConfigurator", nil, nil, "Warning")
            return false
        else
            if Ext.StatGetAttribute(name, key) then return true
            else S7DebugPrint(key .. " is not a valid attribute for " .. name, "StatsConfigurator", nil, nil, "Warning") end
        end
    end
end

--  STATS-SYNCHRONIZE
--  =================

function StatsSynchronize()
    if Synchronizations then
        S7DebugPrint("Synchronizing Stats [Savegame-Persistence: " .. tostring(ConfigSettings.SyncStatPersistence) .. "]", "StatsConfigurator")
        S7DebugPrint("=============================================================", "StatsConfigurator")

        for name, _ in pairs(Synchronizations) do
            if Osi.NRD_StatExists(name) then
                Ext.SyncStat(name, ConfigSettings.SyncStatPersistence)
                S7DebugPrint("Synchronized Stat: " .. name, "StatsConfigurator")
            end
        end
        S7DebugPrint("=============================================================", "StatsConfigurator")
        S7DebugPrint("Synchronization Complete.", nil, "SyncStat", "StatsConfigurator")
    else S7DebugPrint("Nothing to Synchronize. toSync queue is empty.", "StatsConfigurator", "SyncStat") end
end

--  BUILD CONFIG-DATA
--  =================

function BuildConfigData(buildData, modUUID, modName)
    if ValidString(modName) then
        if ValidString(modUUID) then
            local configTable = LoadFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName) or {}
            configTable[modUUID] = {
                ["ModUUID"] = modUUID,
                ["ModName"] = modName,
                ["Content"] = buildData
            }
            SaveFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName, configTable)
        else S7DebugPrint("Invalid modUUID. Can't build " .. ConfigSettings.StatsLoader.FileName, "StatsConfigurator") end
    else S7DebugPrint("Invalid modName. Can't build" .. ConfigSettings.StatsLoader.FileName, "StatsConfigurator") end
end

--  ####################################################################################################################################################
