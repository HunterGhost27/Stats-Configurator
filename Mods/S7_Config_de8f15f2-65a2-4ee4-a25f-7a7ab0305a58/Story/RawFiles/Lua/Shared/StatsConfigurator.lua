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
            ForEach(config, function(key, value)
                local attribute, value = HandleAttributeTokens(stat, key, value)
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

function Stats:BuildConfigData(buildData)
    local configData = LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or {}
    for key, value in pairs(buildData) do configData[key] = value end
    SaveFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName, configData)
end

--  ATTRIBUTE TOKENS
--  ================

function HandleAttributeTokens(stat, key, value)
    local token, attribute = string.match(key, "^(%p?)(.-)$")
    if token == "+" then
        if type(value) == 'string' then value = stat[attribute] .. ";" .. tostring(value) .. ";"
        else value = stat[attribute] + value end
    elseif token == "-" then value = stat[attribute] - value
    elseif token == "*" then value = stat[attribute] * value
    elseif token == "/" then value = stat[attribute] / value
    elseif token == "$" then value = Ext.StatGetAttribute('value', attribute) or stat[attribute]
    end
    return attribute, value
end