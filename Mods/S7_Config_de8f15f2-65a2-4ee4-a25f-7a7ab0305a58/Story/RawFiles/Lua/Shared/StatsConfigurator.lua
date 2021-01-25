--  ==================
--  STATS-CONFIGURATOR
--  ==================

Stats = {
    ['Configurations'] = {},
    ['Synchronizations'] = {}
}

function Stats:Configurator()
    Write:SetHeader(Settings.StatsLoader.FileName .. " loaded. Applying configuration profile.")
    ForEach(self.Configurations, function(key, config)
        if type(config) ~= 'table' then return end

        local statList = Collections:Unpack(key)
        ForEach(statList, function(statName, bool)
            if not bool then return end

            local stat = Ext.GetStat(statName)
            if not stat then return end

            Write:NewLine(statName)
            Write:LineBreak('-')
            ForEach(config, function(key, value)
                local attribute, value = HandleAttributeTokens(stat, key, value)
                Write:NewLine(tostring(attribute) .. ": " .. tostring(value) .. " (" .. tostring(stat[attribute]) .. ")")
                stat[attribute] = value
            end)
            Write:LineBreak('_')
            self.Synchronizations[statName] = true
        end)
        self.Configurations[key] = nil
    end)
    Debug:Print(Write:Display())
    Debug:FPrint('Configuration Profile Active')
end

--  STATS-SYNCHRONIZE
--  =================

function Stats:Synchronize()
    Write:SetHeader('Synchronizing Stats [Persistence: ' .. tostring(Settings.SyncStatPersistence) .. ']')
    for stat, bool in pairs(self.Synchronizations) do
        Ext.SyncStat(stat, Settings.SyncStatPersistence)
        Write:NewLine('Synchronized Stat: ' .. stat)
        self.Synchronizations[stat] = nil
    end
    Debug:Print(Write:Display())
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
    elseif token == "%" then value = stat[attribute] % value
    elseif token == "^" then local v = 1 for i = 1, value do v = v * stat[attribute] end value = v
    elseif token == "$" then value = Ext.StatGetAttribute('value', attribute) or stat[attribute]
    elseif token == "?" then value = Ext.Random(0, value)
    end
    return attribute, value
end