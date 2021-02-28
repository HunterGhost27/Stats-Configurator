--  ==================
--  STATS-CONFIGURATOR
--  ==================

---@class Configurator
---@field Configurations table Table of Configs
---@field Synchronizations table Queue of Syncs
---@field Memoizer Memoizer Config Cacher
---@field Handlers table StatObject Handlers
Stats = {
    ['Configurations'] = {},
    ['Synchronizations'] = {},
    ['Memoizer'] = Memoizer:Init(),
    ['Handlers'] = {

        --  STATS-OBJECT HANDLER
        --  --------------------

        ['StatsObject'] = function(statName, config)
            local stat = Ext.GetStat(statName)
            if not stat then return end

            ForEach(config, function(attribute, value)
                local attribute, value = HandleAttributeConfig(stat, attribute, value)
                if not IsValid(stat[attribute]) then return end
                Write:NewLine("\t\t" .. attribute .. ":\t" .. stat[attribute] .. " --> " .. value)
                stat[attribute] = value
            end)
            Stats.Synchronizations[statName] = true
        end,

        --  NON STATS-OBJECT HANDLERS
        --  -------------------------

        ['TreasureTable'] = function (name, config)
            local treasureTable = Ext.GetTreasureTable(name) or {}
            treasureTable = Integrate(treasureTable, config)
            Ext.UpdateTreasureTable(treasureTable)
        end,
        ['TreasureCategory'] = function (name, config)
            local treasureCategory = Ext.GetTreasureCategory(name) or {}
            treasureCategory = Integrate(treasureCategory, config)
            Ext.UpdateTreasureCategory(name, treasureCategory)
        end,
        ['SkillSet'] = function (name, config)
            local skillSet = Ext.GetSkillSet(name) or {}
            skillSet = Integrate(skillSet, config)
            Ext.UpdateSkillSet(skillSet)
        end,
        ['ItemCombo'] = function (name, config)
            local itemCombo = Ext.GetItemCombo(name) or {} -- ⚠ WARNING: Causes crash in non-dev SE v53
            itemCombo = Integrate(itemCombo, config)
            Ext.UpdateItemCombo(itemCombo)
        end,
        ['ItemComboPreviewData'] = function (name, config)
            local itemComboPreviewData = Ext.GetItemComboPreviewData(name) or {} -- Doesn't seem to work
            itemComboPreviewData = Integrate(itemComboPreviewData, config)
            Ext.UpdateItemComboPreviewData(itemComboPreviewData)
        end,
        ['ItemComboProperty'] = function (name, config)
            local itemComboProperty = Ext.GetItemComboProperty(name) or {}
            itemComboProperty = Integrate(itemComboProperty, config)
            Ext.UpdateItemComboProperty(itemComboProperty)
        end,
        ['EquipmentSet'] = function (name, config)
            local equipmentSet = Ext.GetEquipmentSet(name) or {}
            equipmentSet = Integrate(equipmentSet, config)
            Ext.UpdateEquipmentSet(equipmentSet)
        end,
        ['DeltaModifier'] = function (name, config)
            local deltaMod = Ext.GetDeltaMod(name, config.ModifierType) or {}
            deltaMod = Integrate(deltaMod, config)
            Ext.UpdateDeltaMod(deltaMod)
        end,

        --  TRANSLATED STRING HANDLERS
        --  --------------------------

        ['TranslatedStringHandle'] = function(handle, value) Ext.CreateTranslatedStringHandle(handle, value) end,
        ['TranslatedString'] = function(key, value) Ext.CreateTranslatedString(key, value) end,
    }
}

---Main Configurator Function
function Stats:Configurator()
    Write:SetHeader(Settings.StatsLoader.FileName .. " loaded. Applying configuration profile")

    ForEach(self.Configurations, function(key, config)
        local statList = Collections:Unpack(key)
        ForEach(statList, function(statName, bool)
            if not bool then return end

            local statName, statType = Disintegrate(statName, ":")
            local genericStatType = 'Armor,Shield,Weapon,Potion,Character,Object,SkillData,StatusData,StatsObject'
            if IsValid(string.match(genericStatType, statType or "")) then statType = 'StatsObject' end
            statType = statType or 'StatsObject'
            Write:NewLine("\t" .. statName)

            Stats.Handlers[statType](statName, config)
        end)
        self.Configurations[key] = nil
    end)

    Debug:Print(Write:Display())
    Debug:FPrint('Configuration Profile Active')
end

--  STATS-SYNCHRONIZE
--  =================

---Synchronizes all stats in Sync-Queue
function Stats:Synchronize()
    Write:SetHeader('Synchronizing Stats [Persistence: ' .. tostring(Settings.SyncStatPersistence) .. ']')
    for stat, bool in pairs(self.Synchronizations) do
        Ext.SyncStat(stat, Settings.SyncStatPersistence)
        Write:NewLine('\t' .. stat)
        self.Synchronizations[stat] = nil
    end
    Debug:Print(Write:Display())
    Debug:Print('Synchronization Complete', {['dialogVar'] = 'SyncStat'})
end

--  LOAD CONFIGS
--  ============

---Loads Config-Files
function Stats:LoadConfigs()
    local fileNames = Map(Settings.ConfigFiles, function (idx, fileName) return idx, MODINFO.SubdirPrefix .. fileName end)
    local files = LoadFiles(fileNames) or {}
    Debug:Print("Loading ConfigFiles", {['dialogVar'] = 'StatsConfigurator'})
    for fileName, fileContent in pairs(files) do
        if not IsValid(fileContent) then SaveFile(fileName, "{}") end
        self.Configurations = Integrate(self.Configurations, fileContent)
    end
    self.Memoizer:LoadCache(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName)
    self:Configurator()
    self:Synchronize()
    Debug:Print("StatsConfiguration Finished", {['dialogVar'] = 'StatsConfigurator'})
end

--  BUILD CONFIG-DATA
--  =================

---Builds ConfigData using Config-Files
function Stats:BuildConfigs()
    local fileNames = Map(Settings.ConfigFiles, function (idx, fileName) return idx, MODINFO.SubdirPrefix .. fileName end)
    local files = LoadFiles(fileNames) or {}
    for _, file in pairs(files) do
        local configData = LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or {}
        for key, value in pairs(file) do configData[key] = value end
        SaveFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName, configData)
    end
    Stats.Memoizer:SaveCache(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName)
    Osi.ShowNotification(Osi.CharacterGetHostCharacter(), 'ConfigData Rebuilt')
    Debug:Print("Rebuilt " .. Settings.StatsLoader.FileName)
end

--  BROADCAST CONFIGDATA
--  ====================

---Broadcasts Host's Config to all Clients
function Stats:BroadcastConfigData()
    local configData = Ext.LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or ""
    if not ValidString(configData) then Debug:Error("Failed to broadcast the configuration file") return end
    Ext.BroadcastMessage("S7_Config::ConfigData", configData)
    Debug:Print("Server broadcasted their configuration file")
end

--  VALIDATE CLIENT CONFIGS
--  =======================

---Validate Client ConfigData
function Stats:ValidateConfigs()
    UserInformation:ReSync()
    Debug:FPrint("Validating Client Config...", {['dialogVar'] = 'ValidateClientConfigs'})
    local source = Ext.LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName)
    if not ValidString(source) then Debug:FWarn("Nothing to validate. Please check if the server has " .. Settings.StatsLoader.FileName, {['dialogVar'] = 'ValidateClientConfigs'}) end

    ForEach(UserInformation.Clients, function (userProfileID, information)
        if not IsValid(userProfileID) then return end
        local clientID = information['DisplayName'] .. " (" .. information['UserName'] .. ")"
        Ext.PostMessageToClient(information['CurrentCharacter'], 'S7_Config::ConfigValidation', Ext.JsonStringify({[clientID] = source}))
    end)
end

--  =======
--  HELPERS
--  =======

--  ATTRIBUTE TOKENS
--  ----------------

---Attribute token handlers
---@param stat table StatObject
---@param attribute string Config-Attribute
---@param value any Config-Value
---@return string attribute AttributeName
---@return any value AttributeValue
function HandleAttributeConfig(stat, attribute, value)
    local token, attribute = string.match(attribute, '^(%p?)(.-)$')
    if not IsValid(token) then return attribute, value end -- No special attribute token. return attribute and value as is

    local originalValue = Stats.Memoizer:UseMemo(stat.Name ..":" .. attribute, stat[attribute]) -- Lookup original value in cache
    local attributeType = DetermineAttributeType(attribute, stat.Name)

    if attributeType == 'Integer' or attributeType == 'number' then
        if token == '+' then value = originalValue + value
        elseif token == '-' then value = originalValue - value
        elseif token == '*' then value = originalValue * value
        elseif token == '/' then value = originalValue / value
        elseif token == '%' then value = originalValue % value
        elseif token == '^' then value = originalValue ^ value
        elseif token == '$' then value = Ext.StatGetAttribute(stat.Name, attribute) or originalValue
        elseif token == '?' then value = Ext.Random(0, value)
        end
    end

    if attributeType == 'String' or attributeType == 'string' then
        if token == '+' then
            local t = table.pack(Disintegrate(originalValue, ';'))
            table.insert(t, value)
            value = table.concat(t, ';')
        elseif token == '-' then
            if string.match(originalValue, value) then value = string.gsub(originalValue, value, '') end
            value = string.gsub(value, '[;]+', ';')
        elseif token == '$' then value = Ext.StatGetAttribute(stat.Name, attribute) or originalValue
        end
    end

    if attributeType == 'Enumeration' then
        local _, enumType = Disintegrate(attributeType, ":")
        if type(originalValue) == 'string' then originalValue = EnumTransformer('Label2Index', enumType, originalValue) end
        value = type(value) == 'string' and EnumTransformer('Label2Index', enumType, value) or value
        if token == '+' then value = originalValue + value
        elseif token == '-' then value = originalValue - value
        elseif token == '$' then
            local copy = Ext.StatGetAttribute(stat.Name, attribute)
            copy = type(copy) == 'string' and EnumTransformer('Label2Index', enumType, copy) or copy
            value =  copy or originalValue
        end
    end

    if type(value) == 'number' then value = math.modf(value) end

    return attribute, value
end