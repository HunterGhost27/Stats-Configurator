--  ------------------------------------------------------------
ModInfo = Ext.GetModInfo("de8f15f2-65a2-4ee4-a25f-7a7ab0305a58")
SubdirectoryPrefix = "StatsConfigurator/"
IDENTIFIER = "S7_Config"
--  ------------------------------------------------------------

--  =========================
--  VALIDATE NON-EMPTY STRING
--  =========================

--- Check validity of string.
---@param str any
function ValidString(str)
    if type(str) == "string" and str ~= "" and str ~= "{}" and str ~= "[]" then return true
    else return false end
end

--  =========
--  INTEGRATE
--  =========

--- Merge source and target. Existing source elements have priority.
---@param target table
---@param source table
---@return table source
function Integrate(target, source)
    local source = source or {}
    if type(target) ~= "table" then return source end

    for key, value in pairs(target) do
        if type(value) == "table" then
            if not source[key] then source[key] = {} end
            source[key] = Integrate(value, source[key])
        end
        source[key] = source[key] or value
    end

    return source
end


--  =============
--  REMATERIALIZE
--  =============

--- Completely clone an element
---@param element any Element to copy
---@param config table Configuration table
---@return any element Rematerialized element
function Rematerialize(element, config, clones)
    config = Integrate({["metatables"] = false, ['nonstringifiable'] = false}, config)
    clones = clones or {}
    local clone = {}

    if type(element) == "table" then
        if clones[element] then clone = clones[element]
        else
            clone = {}
            clones[element] = clone
            for key, value in next, element do clone[Rematerialize(key, clones)] = Rematerialize(value, clones) end
            if config.metatables then setmetatable(clone, Rematerialize(getmetatable(element), clones)) end   --  Copy metatables
        end
    else clone = element end    --  if element is anything other than a table, return as is

    if type(element) == "function" or type(element) == "userdata" or type(element) == "thread" then
        if config.nonstringifiable then clone = element else clone = nil end
    end

    return clone
end

--  ===================
--  DESTRINGIFY NUMBERS
--  ===================

--- Destringifies keys that should be numbers
---@param t table
function Destringify(t)
	for key, value in pairs(t) do
        if type(value) == "table" then Destringify(value) end
		if type(key) ~= "number" then
			local n = tonumber(key)
			if n then t[n] = value; t[key] = nil end
		end
	end
end

--  ===========
--  DEBUG PRINT
--  ===========

S7Debug = {
    ['IDENTIFIER'] = IDENTIFIER,
    ['printFunction'] = Ext.Print,
    ['ignoreDevMode'] = false,
    ['highlight'] = "",
}

function S7Debug:Update(t) self = Integrate(self, t) end

--- Debug Print
---@param t table Table of elements
---@param config table Configuration table
function S7Debug:Print(t, config)
    local x = {}
    local config = Integrate(self, config)
    if type(t) ~= 'table' then x[1] = t else x = Rematerialize(t) end

    if ValidString(config.dialogVar) then DialogVars[config.dialogVar] = config.dialogVal or tostring(x[1]) end

    if Ext.IsDeveloperMode() or config.ignoreDevMode then
        local context = Ext.IsServer() and '(S)' or '(C)'
        local displayString = "[" .. config.IDENTIFIER .. context .. "] - "
        displayString = displayString .. tostring(table.remove(x, 1))
        local len = string.len(displayString)

        if ValidString(config.highlight) then config.printFunction(string.rep(config.highlight, len)) end
        if x then config.printFunction(displayString, table.unpack(x)) else config.printFunction(displayString) end
        if ValidString(config.highlight) then config.printFunction(string.rep(config.highlight, len)) end
    end
end
function S7Debug:FPrint(t, config) self.Print(t, Integrate({['ignoreDevMode'] = true}, config)) end
function S7Debug:HFPrint(t, config) self.Print(t, Integrate({['ignoreDevMode'] = true, ['highlight'] = '='}, config)) end

function S7Debug:Warn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning}, config)) end
function S7Debug:FWarn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning, ['ignoreDevMode'] = true}, config)) end
function S7Debug:HFWarn(t, config) self:Print(t, Integrate({['printFunction'] = Ext.PrintWarning, ['ignoreDevMode'] = true, ['highlight'] = '='}, config)) end

function S7Debug:Error(t, config) self.Print(t, Integrate({['printFunction'] = Ext.PrintError})) end
function S7Debug:FError(t, config) self.Print(t, Integrate({['printFunction'] = Ext.PrintError, ['ignoreDevMode'] = true}, config)) end
function S7Debug:HFError(t, config) self.Print(t, Integrate({['printFunction'] = Ext.PrintError, ['ignoreDevMode'] = true, ['highlight'] = '*'}, config)) end


--  ==============
--  SORT-&-ITERATE
--  ==============

--- Sort keys then iterate following a order
---@param t table Table to iterate over
---@param order string|function "ascending", "descending" or a custom function for table.sort
function Spairs(t, order)
    if type(t) ~= "table" then return end

    local keys = {}
    if type(order) == 'string' then order = string.lower(order) end

    for k, _ in pairs(t) do keys[#keys + 1] = k end
    if order == "ascending" then table.sort(keys, function(a, b) return tonumber(a) < tonumber(b) end)
    elseif order == "descending" then table.sort(keys, function(a, b) return tonumber(a) > tonumber(b) end)
    elseif type(order) == 'function' then table.sort(keys, function(a, b) return order(t, a, b) end)
    else table.sort(keys) end

    local i = 0
    return function ()
        i = i + 1
        if keys[i] then return keys[i], t[keys[i]] end
    end
end


--  =========
--  LOAD FILE
--  =========

--- Load file contents
---@param fileName string FilePath
---@param context string PathContext. 'data' for modData. 'user' or nil for osirisData
---@return table file Parsed file contents
function LoadFile(fileName, context)
    local file
    local _, fileContents = pcall(Ext.LoadFile, fileName, context)
    if ValidString(fileContents) then file = Ext.JsonParse(fileContents) end
    return file
end

--  =========
--  SAVE FILE
--  =========

--- Save file
---@param fileName string FilePath
---@param contents any File Contents to save
function SaveFile(fileName, contents)
    if ValidString(fileName) then
        local content = Rematerialize(contents)
        local fileContents = Ext.JsonStringify(content)
        Ext.SaveFile(fileName, fileContents)
    end
end

--  ===============
--  MOD INFORMATION
--  ===============

local defaultModInfo = {
    ["Author"] = ModInfo.Author,
    ["Name"] = ModInfo.Name,
    ["UUID"] = ModInfo.UUID,
    ["Version"] = ModInfo.Version,
    ["PublishedVersion"] = ModInfo.PublishVersion,
    ["ModVersion"] = "0.0.0.0",
    ["ModSettings"] = {
        ["ConfigFile"] = "S7_Config.json", --  FileName of the Configuration Profile
        ["StatsLoader"] = {["Enable"] = true, ["FileName"] = "S7_ConfigData.json"}, --  Enable stat-editing during ModuleLoading. FileName for ConfigData.
        ["SyncStatPersistence"] = false, --  Changes made with Ext.SyncStat() will be stored persistently if true.
        ["ExportStatIDtoTSV"] = {["FileName"] = "S7_AllTheStats.tsv", ["RestrictStatTypeTo"] = ""}, --  limits the export to only these statTypes. e.g. "Character", "Potions", "SkillData".
        ["BypassSafetyCheck"] = false, --  Bypasses SafeToModify() and allow modification of unsupported or problematic keys.
        ["CustomCollections"] = {} --  Allows users to create custom collections.
    }
}

CENTRAL = {}    --  Holds Global Settings and Information
CENTRAL = LoadFile("S7Central.json") or {}
if CENTRAL[IDENTIFIER] == nil then CENTRAL[IDENTIFIER] = Rematerialize(defaultModInfo) end

--  ==========  MOD VERSIONING  ==========
Ext.Require("Auxiliary/ModVersioning.lua")
--  ======================================

--- Initialize CENTRAL
---@param ref table Reference table
---@param tar table Target table
local function initCENTRAL(ref, tar)
    for field, value in pairs(ref) do
        if ModInfo[field] then tar[field] = Rematerialize(ModInfo[field])
        else if not tar[field] then tar[field] = Rematerialize(value) end end
        if type(value) == 'table' then initCENTRAL(value, tar[field]) end
    end
end

initCENTRAL(defaultModInfo, CENTRAL[IDENTIFIER])
CENTRAL[IDENTIFIER]["ModVersion"] = ParseVersion(ModInfo.Version, "string")
SaveFile("S7Central.json", CENTRAL)

--  ============
--  MOD-SETTINGS
--  ============

DefaultSettings = defaultModInfo.ModSettings
ConfigSettings = Rematerialize(DefaultSettings) --  just to initialize ConfigSettings.

---  Overrides ConfigSettings on ModuleLoadStarted event and Player's request.
function RefreshSettings()
    local dialogVal = "Settings: Default"
    CENTRAL = LoadFile("S7Central.json") or {}
    S7Debug:HFPrint("Synchronizing ModSettings")
    for setting, value in pairs(defaultModInfo.ModSettings) do
        if ConfigSettings[setting] ~= DefaultSettings[setting] then
            ConfigSettings[setting] = value
            S7Debug:FPrint(setting .. ": " .. tostring(value))
            dialogVal = "Settings: Custom"
        end
    end
    S7Debug:Print("Synchronized ModSettings", {['dialogVar'] = "Settings", ['dialogVal'] = dialogVal})
end

--  ======================================================
Ext.RegisterListener("ModuleLoadStarted", RefreshSettings)
--  ======================================================

--  ================
--  USER INFORMATION
--  ================

UserInfo = {
    ["clientCharacters"] = {},
    ["hostCharacter"] = {}
}

function UserInfo:Fetch()

    --  HOST CHARACTER
    --  --------------

    local hostCharacterGUID = Osi.CharacterGetHostCharacter()
    local hostUserID = Osi.CharacterGetReservedUserID(hostCharacterGUID)
    local currentHostCharacter = Osi.GetCurrentCharacter(hostUserID)
    local _, hostCharacterName = Osi.CharacterGetDisplayName(currentHostCharacter)
    --   Build Host Character's table.
    UserInfo.hostCharacter = {
        ["hostUserID"] = hostUserID,
        ["hostCharacterGUID"] = hostCharacterGUID,
        ["hostUserName"] = Osi.GetUserName(hostUserID),
        ["hostProfileID"] = Osi.GetUserProfileID(hostUserID),
        ["currentCharacter"] = currentHostCharacter,
        ["currentCharacterName"] = hostCharacterName
    }

    --  CLIENT CHARACTERS
    --  -----------------

    local tempUsers = {}
    for _, player in pairs(Osi.DB_IsPlayer:Get(nil)[1] or {}) do
        tempUsers[#tempUsers+1] = Osi.CharacterGetReservedUserID(player)
    end

    for _, user in pairs(tempUsers) do
        local userProfileID = Osi.GetUserProfileID(user)
        local currentCharacter = Osi.GetCurrentCharacter(user)
        local _, characterName = Osi.CharacterGetDisplayName(currentCharacter)
        -- Build ClientCharacter table.
        UserInfo.clientCharacters[userProfileID] = {
            ["userID"] = user,
            ["userName"] = Osi.GetUserName(user),
            ["userProfileID"] = Osi.GetUserProfileID(user),
            ["hostUserProfileID"] = Osi.GetUserProfileID(Osi.CharacterGetReservedUserID(hostCharacterGUID)),
            ["currentCharacter"] = Osi.GetCurrentCharacter(user),
            ["currentCharacterName"] = characterName
        }
    end
end

--  ================
--  DIALOG VARIABLES
--  ================

DialogVars = {}

--  UPDATE DIALOG-VARS
--  ==================

function DialogVars:Update()
    self["ConfigFile"] = ConfigSettings.ConfigFile
    self["ConfigData"] = ConfigSettings.StatsLoader.FileName

    local settingsLooper = {
        ["StatsLoader"] = ConfigSettings.StatsLoader.Enable,
        ["SyncStatPersistence"] = ConfigSettings.SyncStatPersistence,
        ["BypassSafetyCheck"] = ConfigSettings.BypassSafetyCheck,
        ["S7_ConfigLog"] = ConfigSettings.ConfigLog.Enable
    }

    for key, setting in pairs(settingsLooper) do if setting then self[key] = "Activated." else self[key] = "Deactivated." end end

    if Ext.JsonStringify(ConfigSettings) == Ext.JsonStringify(DefaultSettings) then self["Settings"] = "Default" else self["Settings"] = "Custom" end
end

--  SET DIALOG VARIABLES
--  ====================

function DialogVars:Set() --  Short-hand for DialogSetVariableFixedString(). Isn't called instantly so changes are applied when Osiris is available.
    self.Update()

    local dialogAlias = {
        ["StatsLoader"] = "S7_Config_StatsLoader_11670d82-a36e-4657-9868-5fdb7c86db37",
        ["StatsConfigurator"] = "S7_Config_StatsConfiguratorResponse_68b60e77-cbff-460d-8a78-5a264fe0bbcb",
        ["Settings"] = "S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6",
        ["ExportStats"] = "S7_Config_ExportedStats_e59ebc61-6f13-4e91-9200-36e474113c48",
        ["SyncStat"] = "S7_Config_SyncStat_7506390a-9fa8-4300-8abd-5dc476e6b917",
        ["SyncStatPersistence"] = "S7_SyncStatPersistence_e48a7ea1-a9e4-430e-8ccc-99fe3fcc477a",
        ["BypassSafetyCheck"] = "S7_Config_BypassSafety_06618d4e-dff1-4bfb-a0e2-14865b5dfb64",
        ["ModAddedTo"] = "S7_Config_ModAddedTo_70f2c40a-2237-4041-aed6-d1f1623d0ab6",
        ["ModID"] = "S7_Config_ModID_76d92488-990f-45d4-828a-525bf966efaa",
        ["ValidateClientConfig"] = "S7_ValidateConfigResponse_7b9be638-58ed-44ff-ab3e-6245efdee698",
        ["RegisteredMods"] = "S7_RegisteredMods_4ff2880e-6a62-4ed3-9f6f-28eaa30165b1",
        ["S7_ConfigLog"] = "S7_ConfigLog_f7d055c6-0d9c-44e8-9959-21046cc33cb5",
        ["ConfigData"] = "S7_ConfigData_50855cec-1d18-4305-9292-f47ae56735c8",
        ["ConfigFile"] = "S7_Config_ConfigFile_d1802751-5b8f-4cc2-91bb-0ed459bf920d"
    }

    for dialogVar, dialogVal in pairs(self) do
        for dialogName, dialogVariable in pairs(dialogAlias) do
            if dialogVar == dialogName then Osi.DialogSetVariableFixedString("S7_Config_ModMenu", dialogVariable, dialogVal) end
        end
    end
end

--  ===================
--  EXPORT STATS TO TSV
--  ===================

function StatsExportTSV()
    local content = "S.No\tType\tStatID\n" --  Header Column.

    local allStat = Ext.GetStatEntries()
    for key, value in pairs(allStat) do
        local type = Osi.NRD_StatGetType(value)
        if string.match(ConfigSettings.ExportStatIDtoTSV.RestrictStatTypeTo, type) then
            content = content .. key .. "\t" .. type .. "\t" .. value .. "\n" --  Tab Separated Values format.
        elseif not ValidString(ConfigSettings.ExportStatIDtoTSV.RestrictStatTypeTo) then
            content = content .. key .. "\t" .. type .. "\t" .. value .. "\n" --  Tab Separated Values format.
        end
    end
    SaveFile(SubdirectoryPrefix .. ConfigSettings.ExportStatIDtoTSV.FileName, content)
    S7Debug:Print("Stats exported to TSV file", {['DialogVar'] = "ExportStats"})
end
