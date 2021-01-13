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
            if not ValidString(JSONstring) then Debug:Error("Failed to apply configuration.", {['dialogVar'] = "StatsConfigurator"}) end
            local JSONborne = Ext.JsonParse(JSONstring)
            Debug:Print(modID .. " loaded. Applying configuration profile.")
            Debug:Print("=============================================================")

            for keyName, content in pairs(JSONborne) do
                local nameList = UnpackCollection(keyName, content)
                for name, _ in pairs(nameList) do
                    Debug:Print(name)
                    Debug:Print("-------------------------------------------------------------")
                    local stat = Ext.GetStat(name)

                    for key, value in pairs(content) do
                        if SafeToModify(name, key) then
                            Debug:Print(key .. ": " .. Ext.JsonStringify(value) .. " (" .. Ext.JsonStringify(stat[key]) .. ")")
                            Ext.StatSetAttribute(name, key, Rematerialize(value))
                        end
                    end
                    Debug:Print("_____________________________________________________________")
                    Synchronizations[name] = 1
                end
            end
            Debug:Print("=============================================================")
            Debug:Print("Configuration Profile Active.")
        end
    end
end

function UnpackCollection(keyName, content)
    local returnNameList = {}

    if string.match(keyName, "COLLECTION") then
        for collectionName in string.gmatch(keyName, "[%w]+") do
            if collectionName ~= "COLLECTION" then
                if Collections[collectionName] then
                    Debug:Print("Unpacking collection " .. collectionName)
                    for statName, _ in pairs(Collections[collectionName]) do returnNameList[statName] = 1 end
                else Debug:Error("No collection named " .. collectionName .. " found.") end
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
            Debug:Warn("SafeToModify() prevents modification of " .. key .. " [BypassSafetyCheck: " .. tostring(ConfigSettings.BypassSafetyCheck) .. "]")
            return false
        else
            if Ext.StatGetAttribute(name, key) then return true
            else Debug:Warn(key .. " is not a valid attribute for " .. name) end
        end
    end
end

--  STATS-SYNCHRONIZE
--  =================

function StatsSynchronize()
    if Synchronizations then
        Debug:Print("Synchronizing Stats [Savegame-Persistence: " .. tostring(ConfigSettings.SyncStatPersistence) .. "]")
        Debug:Print("=============================================================")

        for name, _ in pairs(Synchronizations) do
            if Osi.NRD_StatExists(name) then
                Ext.SyncStat(name, ConfigSettings.SyncStatPersistence)
                Debug:Print("Synchronized Stat: " .. name)
            end
        end
        Debug:Print("=============================================================")
        Debug:Print("Synchronization Complete.", {['dialogVar'] = 'SyncStat'})
    else Debug:Print("Nothing to Synchronize. toSync queue is empty.", {['dialogVar'] = 'SyncStat'}) end
end

--  BUILD CONFIG-DATA
--  =================

function BuildConfigData(buildData, modUUID, modName)
    if ValidString(modName) then
        if ValidString(modUUID) then
            local configTable = LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName) or {}
            configTable[modUUID] = {
                ["ModUUID"] = modUUID,
                ["ModName"] = modName,
                ["Content"] = buildData
            }
            SaveFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName, configTable)
        else Debug:Print("Invalid modUUID. Can't build " .. ConfigSettings.StatsLoader.FileName) end
    else Debug:Print("Invalid modName. Can't build" .. ConfigSettings.StatsLoader.FileName) end
end

--  ####################################################################################################################################################
