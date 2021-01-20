--  ==================
--  STATS-CONFIGURATOR
--  ==================

Stats = {
    ['Configurations'] = {},
    ['Synchronizations'] = {}
}

function Stats:Configurator()
    Stringer:SetHeader(Settings.StatsLoader.FileName .. " loaded. Applying configuration profile.")
    for statName, config in pairs(self.Configurations) do
        if type(config) ~= 'table' then return end
        local statList = Collections:Unpack(statName)
        for name, bool in pairs(statList) do
            local stat = Ext.GetStat(name)
            if not stat then return end
            Stringer:Add(name)
            Stringer:LineBreak('-')

            for key, value in pairs(config) do
                if not SafeToModify(name, key) then else
                Stringer:Add(tostring(key) .. ": " .. tostring(value) .. " (" .. tostring(stat[key]) .. ")")
                stat[key] = value
                end
            end
            Stringer:LineBreak('_')
            self.Synchronizations[name] = true
        end
        self.Configurations[statName] = nil
    end
    Debug:Print(Stringer:Build())
    Debug:FPrint('Configuration Profile Active')
end

function SafeToModify(name, key)
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


    if dontFwith[key] then
        Debug:Warn("SafeToModify() prevents modification of " .. key .. " [BypassSafetyCheck: " .. tostring(Settings.BypassSafetyCheck) .. "]")
        return false
    else
        if Ext.StatGetAttribute(name, key) then return true
        else Debug:Warn(key .. " is not a valid attribute for " .. name) end
    end
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
