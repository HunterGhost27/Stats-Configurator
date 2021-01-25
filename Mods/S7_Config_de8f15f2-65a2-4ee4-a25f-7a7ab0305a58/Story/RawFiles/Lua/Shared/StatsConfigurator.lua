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

function HandleAttributeTokens(stat, attribute, value)
    local originalValue = stat[attribute]
    local token, attribute = string.match(attribute, "^(%p?)(.-)$")
    local attributeType = DetermineAttributeType(attribute, stat.Name)

    if attributeType == 'Integer' or attributeType == 'number' then
        if token == "+" then value = originalValue + value
        elseif token == "-" then value = originalValue - value
        elseif token == "*" then value = originalValue * value
        elseif token == "/" then value = originalValue / value
        elseif token == "%" then value = originalValue % value
        elseif token == "^" then local v = 1 for i = 1, value do v = v * originalValue end value = v
        elseif token == "$" then value = Ext.StatGetAttribute(stat.Name, attribute) or originalValue
        elseif token == "?" then value = Ext.Random(0, value)
        end
    end

    if attributeType == 'String' or attributeType == 'string' then
        if token == "+" then
            local t = table.pack(Disintegrate(originalValue), ";")
            table.insert(t, value)
            value = ArrayToString(t)
        elseif token == "-" then
            local t = table.pack(Disintegrate(value), ";")
            table.remove(t, Pinpoint(value))
            value = ArrayToString(t)
        elseif token == "$" then value = Ext.StatGetAttribute(stat.Name, attribute) or originalValue
        end
    end

    if attributeType == 'Enumeration' then
        local _, enumType = Disintegrate(attributeType, ":")
        if type(originalValue) == 'string' then originalValue = EnumTransformer('Label2Index', enumType, originalValue) end
        value = type(value) == 'string' and EnumTransformer('Label2Index', enumType, value) or value
        if token == "+" then value = originalValue + value
        elseif token == "-" then value = originalValue - value
        elseif token == "$" then
            local copy = Ext.StatGetAttribute(stat.Name, attribute)
            copy = type(copy) == 'string' and EnumTransformer('Label2Index', enumType, copy) or copy
            value =  copy or originalValue
        end
    end

    return attribute, value
end