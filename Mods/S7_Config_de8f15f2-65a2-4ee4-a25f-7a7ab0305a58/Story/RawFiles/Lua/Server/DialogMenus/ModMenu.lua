--  ===============
--  MOD MENU DIALOG
--  ===============

ModMenuDialog = Dialog:New({['Name'] = 'S7_Config_ModMenu'})

ModMenuDialog:Set({
    ['ConfigFile'] = {['dialogVar'] = 'S7_Config_ConfigFile_d1802751-5b8f-4cc2-91bb-0ed459bf920d', ['dialogVal'] = tostring(ConfigSettings.ConfigFile)},
    ['ConfigData'] = {['dialogVar'] = 'S7_ConfigData_50855cec-1d18-4305-9292-f47ae56735c8', ['dialogVal'] = tostring(ConfigSettings.StatsLoader.FileName)},
    ['StatsLoader'] = {['dialogVar'] = 'S7_Config_StatsLoader_11670d82-a36e-4657-9868-5fdb7c86db37', ['dialogVal'] = tostring(ConfigSettings.StatsLoader.Enable)},
    ['SyncStatPersistence'] = {['dialogVar'] = 'S7_SyncStatPersistence_e48a7ea1-a9e4-430e-8ccc-99fe3fcc477a', ['dialogVal'] = tostring(ConfigSettings.SyncStatPersistence)},
    ['BypassSafetyCheck'] = {['dialogVar'] = 'S7_Config_BypassSafety_06618d4e-dff1-4bfb-a0e2-14865b5dfb64', ['dialogVal'] = tostring(ConfigSettings.BypassSafetyCheck)},
    ['Settings'] = {['dialogVar'] = 'S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6', ['dialogVal'] = Ext.JsonStringify(ConfigSettings) == Ext.JsonStringify(DefaultSettings) and 'Default' or 'Custom'},
    ['StatsConfigurator'] = {['dialogVar'] = 'S7_Config_StatsConfiguratorResponse_68b60e77-cbff-460d-8a78-5a264fe0bbcb', ['dialogVal'] = ""},
    ['ExportStats'] = {['dialogVar'] = 'S7_Config_ExportedStats_e59ebc61-6f13-4e91-9200-36e474113c48', ['dialogVal'] = ""},
    ['SyncStat'] = {['dialogVar'] = 'S7_Config_SyncStat_7506390a-9fa8-4300-8abd-5dc476e6b917', ['dialogVal'] = ""},
    ['ModAddedTo'] = {['dialogVar'] = 'S7_Config_ModAddedTo_70f2c40a-2237-4041-aed6-d1f1623d0ab6', ['dialogVal'] = ""},
    ['ModID'] = {['dialogVar'] = 'S7_Config_ModID_76d92488-990f-45d4-828a-525bf966efaa', ['dialogVal'] = ""},
    ['ValidateClientConfigs'] = {['dialogVar'] = 'S7_ValidateConfigResponse_7b9be638-58ed-44ff-ab3e-6245efdee698', ['dialogVal'] = ""},
    ['RegisteredMods'] = {['dialogVar'] = 'S7_RegisteredMods_4ff2880e-6a62-4ed3-9f6f-28eaa30165b1"', ['dialogVal'] = ""},
})


--  ======================
--  MOD-MENU RELAY SIGNALS
--  ======================

local modMenuSignals = {
    ["S7_BuildConfigData"] = true,
    ["S7_ToggleConfigLog"] = true,
    ["S7_RefreshSettings"] = true,
    ["S7_PrintModRegistry"] = true,
    ["S7_Config_CHANGELOG"] = true,
    ["S7_StatsConfigurator"] = true,
    ["S7_ToggleSafetyCheck"] = true,
    ["S7_ToggleStatsLoader"] = true,
    ["S7_SetDefaultSettings"] = true,
    ["S7_RebuildCollections"] = true,
    ["S7_BroadcastConfigData"] = true,
    ["S7_Config::ConfigValidation"] = true,
    ["S7_ExportCurrentSettings"] = true,
    ["S7_ToggleSyncStatPersistence"] = true,
}

--  =================
--  INITIATE MOD-MENU
--  =================

Ext.RegisterOsirisListener("CharacterUsedItemTemplate", 3, "after", function (character, itemTemplate, item)
    if itemTemplate ~= Inspector then return end
    ModMenuDialog:Start()
end)

--  ==============
--  MOD-MENU RELAY
--  ==============

function ModMenuRelay(signal)
    if not modMenuSignals[signal] then return end

    UserInformation:ReSync()

    --  STATS-CONFIGURATOR
    -- ====================

    if signal == "S7_StatsConfigurator" then
        local file = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.ConfigFile) or ""
        if ValidString(file) then
            Debug:Print("Loading: " .. ConfigSettings.ConfigFile)
            table.insert(Configurations, {["S7_Config"] = file})
        else
            Debug:Error(ConfigSettings.ConfigFile .. " not found. Creating empty file.")
            Ext.SaveFile(MODINFO.SubdirPrefix .. ConfigSettings.ConfigFile, "")
        end
        StatsConfigurator()
        StatsSynchronize()
        Configurations = {}
        Debug:Print("StatsConfiguration Finished.")
    end

    --  BUILD CONFIG-DATA
    --  =================

    if signal == "S7_BuildConfigData" then
        local buildData = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.ConfigFile) or ""
        BuildConfigData(buildData, MODINFO.UUID, "S7_Config")
        Debug:Print("Rebuilt " .. ConfigSettings.StatsLoader.FileName .. " using " .. ConfigSettings.ConfigFile)
    end

    --  SEND CONFIG DATA
    --  ================

    if signal == "S7_BroadcastConfigData" then
        local broadcast = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName) or ""
        if ValidString(broadcast) then
            Ext.BroadcastMessage("S7_Config::ConfigData", broadcast)
            Debug:Print("Server broadcasted their configuration file.")
        else Debug:Error("Failed to broadcast the configuration file.") end
    end

    --  VALIDATE CLIENT FILES
    --  =====================

    if signal == "S7_Config::ConfigValidation" then ValidateClientConfigs() end

    --  TOGGLE STATSLOADER
    --  ==================

    if signal == "S7_ToggleStatsLoader" then
        if ConfigSettings.StatsLoader.Enable == true then
            ConfigSettings.StatsLoader.Enable = false
            Debug:Print("StatsLoader: Deactivated")
        else
            ConfigSettings.StatsLoader.Enable = true
            Debug:Print("StatsLoader: Activated")
        end
    end

    --  TOGGLE SYNC-STAT PERSISTENCE
    --  ============================

    if signal == "S7_ToggleSyncStatPersistence" then
        if ConfigSettings.SyncStatPersistence == true then
            ConfigSettings.SyncStatPersistence = false
            Debug:Print("SyncStatPersistence: Deactivated")
        else
            ConfigSettings.SyncStatPersistence = true
            Debug:Print("SyncStatPersistence: Activated")
        end
    end

    --  TOGGLE BYPASS-SAFETY-CHECK
    --  ==========================

    if signal == "S7_ToggleSafetyCheck" then
        if ConfigSettings.BypassSafetyCheck == false then
            ConfigSettings.BypassSafetyCheck = true
            Debug:Print("BypassSafetyCheck: Activated")
        else
            ConfigSettings.BypassSafetyCheck = false
            Debug:Print("BypassSafetyCheck: Deactivated")
        end
    end

    --  SET DEFAULT SETTINGS
    -- ======================

    if signal == "S7_SetDefaultSettings" then
        ConfigSettings = Rematerialize(DefaultSettings)
        Debug:Print("Using default settings.")
    end

    --  REFRESH SETTINGS
    -- ==================

    if signal == "S7_RefreshSettings" then
        RefreshSettings()
        Collections:Rebuild()
        Debug:Print("Settings refreshed.")
    end

    --  EXPORT CURRENT SETTINGS
    -- =========================

    if signal == "S7_ExportCurrentSettings" then
        SaveFile(MODINFO.SubdirPrefix .. "S7_ConfigSettings.json", ConfigSettings)
        Debug:Print("Exporting current ConfigSettings to S7_ConfigSettings.json")
        RefreshSettings()
        Debug:Print("Custom Settings Exported and Refreshed.")
    end

    --  MOD-REGISTRY
    --  ============

    if signal == "S7_PrintModRegistry" then
        local registry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, nil)
        Debug:Print("Mods registered to Stats-Configurator")
        Debug:Print("======================================================")
        local registeredMods = ""
        for i, entry in ipairs(registry) do
            local registeredModInfo = {
                ["Name"] = "Unspecified",
                ["Author"] = "Unspecified"
            }
            if entry[2] ~= nil then
                registeredModInfo = Ext.GetModInfo(entry[2])
            end
            registeredMods =
                registeredMods ..
                "[" .. i .. "]" .. " - " .. registeredModInfo.Name .. " by " .. registeredModInfo.Author .. "\n"
        end
        Debug:Print(registeredMods, nil, "RegisteredMods")
        Debug:Print("======================================================")
    end

    --  REBUILD COLLECTIONS
    --  ===================

    if signal == "S7_RebuildCollections" then
        Collections:Rebuild()
    end

    ModMenuDialog:Set() --  Request dialogVar update everytime ModMenu relays a signal.
    Osi.GlobalClearFlag(signal)
end

--  =================================================================
Ext.RegisterOsirisListener("GlobalFlagSet", 1, "after", ModMenuRelay)
--  =================================================================