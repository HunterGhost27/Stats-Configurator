--  ==================
--  STATS-CONFIGURATOR
--  ==================

Stats = {
    ['Configurations'] = {},
    ['Synchronizations'] = {}
}

function Stats:Configurator()
    Stringer:SetHeader(Settings.StatsLoader.FileName .. " loaded. Applying configuration profile.")
    ForEach(self.Configurations, function(key, config)
        if type(config) ~= 'table' then return end

        local statList = Collections:Unpack(key)
        ForEach(statList, function(statName, bool)
            if not bool then return end

            local stat = Ext.GetStat(statName)
            if not stat then return end

            Stringer:Add(statName)
            Stringer:LineBreak('-')
            ForEach(config, function(attribute, value)
                if not SafeToModify(statName, attribute) then return end
                Stringer:Add(tostring(attribute) .. ": " .. tostring(value) .. " (" .. tostring(stat[attribute]) .. ")")
                stat[attribute] = value
            end)
            Stringer:LineBreak('_')
            self.Synchronizations[statName] = true
        end)
        self.Configurations[key] = nil
    
    end)
    Debug:Print(Stringer:Build())
    Debug:FPrint('Configuration Profile Active')
end

--  STATS-SYNCHRONIZE
--  =================

function Stats:Synchronize()
    Stringer:SetHeader('Synchronizing Stats [Persistence: ' .. tostring(Settings.SyncStatPersistence) .. ']')
    for stat, bool in pairs(self.Synchronizations) do
        Ext.SyncStat(stat, Settings.SyncStatPersistence)
        Stringer:Add('Synchronized Stat: ' .. stat)
        self.Synchronizations[stat] = nil
    end
    Debug:Print(Stringer:Build())
    Debug:Print('Synchronization Complete', {['dialogVar'] = 'SyncStat'})
end

--  BUILD CONFIG-DATA
--  =================

function BuildConfigData(buildData)
    local configData = LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or {}
    for key, value in pairs(buildData) do configData[key] = value end
    SaveFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName, configData)
end

--  ==============
--  SAFE TO MODIFY
--  ==============

function SafeToModify(statName, attribute)
    if Settings.BypassSafetyCheck then return true end

    local dontFwith = {
        ["AoEConditions"] = true,
        ["TargetConditions"] = true,
        ["ForkingConditions"] = true,
        ["CycleConditions"] = true,
        ["SkillProperties"] = true,
        ["WinBoost"] = true,
        ["LoseBoost"] = true,
        ["RootTemplate"] = true
    } --  dont mess with these keys


    if dontFwith[attribute] then
        Debug:Warn("SafeToModify() prevents modification of " .. attribute .. " [BypassSafetyCheck: " .. tostring(Settings.BypassSafetyCheck) .. "]")
        return false
    else
        if Ext.StatGetAttribute(statName, attribute) then return true
        else Debug:Warn(attribute .. " is not a valid attribute for " .. statName) return false end
    end
end
