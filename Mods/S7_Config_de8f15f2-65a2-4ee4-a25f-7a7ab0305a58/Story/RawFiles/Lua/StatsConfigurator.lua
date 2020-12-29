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
            if not ValidString(JSONstring) then S7Debug:Error("Failed to apply configuration.", {['dialogVar'] = "StatsConfigurator"}) end
            local JSONborne = Ext.JsonParse(JSONstring)
            S7Debug:Print(modID .. " loaded. Applying configuration profile.")
            S7Debug:Print("=============================================================")

            for keyName, content in pairs(JSONborne) do
                local nameList = UnpackCollection(keyName, content)
                for name, _ in pairs(nameList) do
                    S7Debug:Print(name)
                    S7Debug:Print("-------------------------------------------------------------")
                    local stat = Ext.GetStat(name)

                    for key, value in pairs(content) do
                        if SafeToModify(name, key) then
                            S7Debug:Print(key .. ": " .. Ext.JsonStringify(value) .. " (" .. Ext.JsonStringify(stat[key]) .. ")")
                            Ext.StatSetAttribute(name, key, Rematerialize(value))
                        end
                    end
                    S7Debug:Print("_____________________________________________________________")
                    Synchronizations[name] = 1
                end
            end
            S7Debug:Print("=============================================================")
            S7Debug:Print("Configuration Profile Active.")
        end
    end
end

function UnpackCollection(keyName, content)
    local returnNameList = {}

    if string.match(keyName, "COLLECTION") then
        for collectionName in string.gmatch(keyName, "[%w]+") do
            if collectionName ~= "COLLECTION" then
                if Collections[collectionName] then
                    S7Debug:Print("Unpacking collection " .. collectionName)
                    for statName, _ in pairs(Collections[collectionName]) do returnNameList[statName] = 1 end
                else S7Debug:Error("No collection named " .. collectionName .. " found.") end
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
            S7Debug:Warn("SafeToModify() prevents modification of " .. key .. " [BypassSafetyCheck: " .. tostring(ConfigSettings.BypassSafetyCheck) .. "]")
            return false
        else
            if Ext.StatGetAttribute(name, key) then return true
            else S7Debug:Warn(key .. " is not a valid attribute for " .. name) end
        end
    end
end

--  STATS-SYNCHRONIZE
--  =================

function StatsSynchronize()
    if Synchronizations then
        S7Debug:Print("Synchronizing Stats [Savegame-Persistence: " .. tostring(ConfigSettings.SyncStatPersistence) .. "]")
        S7Debug:Print("=============================================================")

        for name, _ in pairs(Synchronizations) do
            if Osi.NRD_StatExists(name) then
                Ext.SyncStat(name, ConfigSettings.SyncStatPersistence)
                S7Debug:Print("Synchronized Stat: " .. name)
            end
        end
        S7Debug:Print("=============================================================")
        S7Debug:Print("Synchronization Complete.", {['dialogVar'] = 'SyncStat'})
    else S7Debug:Print("Nothing to Synchronize. toSync queue is empty.", {['dialogVar'] = 'SyncStat'}) end
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
        else S7Debug:Print("Invalid modUUID. Can't build " .. ConfigSettings.StatsLoader.FileName) end
    else S7Debug:Print("Invalid modName. Can't build" .. ConfigSettings.StatsLoader.FileName) end
end

--  ####################################################################################################################################################
