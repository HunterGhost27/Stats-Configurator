--  ===============
--  MOD MENU DIALOG
--  ===============

ModMenuDialog = Dialog:New({['Name'] = 'S7_Config_ModMenu'})

ModMenuDialog:Update({
    ['ConfigFile'] = {
        ['dialogVar'] = 'S7_Config_ConfigFile_d1802751-5b8f-4cc2-91bb-0ed459bf920d',
        ['dialogVal'] = function() return ValidString(ConfigSettings.ConfigFile) and ConfigSettings.ConfigFile or 'No Config File Detected.' end
    },
    ['ConfigData'] = {
        ['dialogVar'] = 'S7_ConfigData_50855cec-1d18-4305-9292-f47ae56735c8',
        ['dialogVal'] = function() return ValidString(ConfigSettings.StatsLoader.FileName) and ConfigSettings.StatsLoader.FileName or 'No ConfigData File Detected' end
    },
    ['StatsLoader'] = {
        ['dialogVar'] = 'S7_Config_StatsLoader_11670d82-a36e-4657-9868-5fdb7c86db37',
        ['dialogVal'] = function() return ConfigSettings.StatsLoader.Enable == true and 'Enabled' or 'Disabled' end
    },
    ['SyncStatPersistence'] = {
        ['dialogVar'] = 'S7_SyncStatPersistence_e48a7ea1-a9e4-430e-8ccc-99fe3fcc477a',
        ['dialogVal'] = function() return ConfigSettings.SyncStatPersistence == true and 'Enabled' or 'Disabled' end
    },
    ['BypassSafetyCheck'] = {
        ['dialogVar'] = 'S7_Config_BypassSafety_06618d4e-dff1-4bfb-a0e2-14865b5dfb64',
        ['dialogVal'] = function() return ConfigSettings.BypassSafetyCheck == true and 'Enabled' or 'Disabled' end
    },
    ['Settings'] = {
        ['dialogVar'] = 'S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6',
        ['dialogVal'] = function() return IsEqual(ConfigSettings, MODINFO.DefaultSettings) and 'Default-Settings' or 'Custom-Settings' end
    },
    ['StatsConfigurator'] = {['dialogVar'] = 'S7_Config_StatsConfiguratorResponse_68b60e77-cbff-460d-8a78-5a264fe0bbcb'},
    ['SyncStat'] = {['dialogVar'] = 'S7_Config_SyncStat_7506390a-9fa8-4300-8abd-5dc476e6b917'},
    ['ValidateClientConfigs'] = {['dialogVar'] = 'S7_ValidateConfigResponse_7b9be638-58ed-44ff-ab3e-6245efdee698'},
})

--  =================
--  INITIATE MOD-MENU
--  =================

Ext.RegisterOsirisListener("CharacterUsedItemTemplate", 3, "after", function (character, itemTemplate, item)
    if itemTemplate ~= Inspector then return end
    ModMenuDialog:Start()
end)


--  ======================
--  MOD-MENU RELAY SIGNALS
--  ======================

ModMenuRelay = {

    --  STATS-CONFIGURATOR
    --  ==================

    ['S7_StatsConfigurator'] = function ()
        local file = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.ConfigFile) or ""
        if ValidString(file) then
            Debug:Print("Loading: " .. ConfigSettings.ConfigFile, {['dialogVar'] = 'StatsConfigurator'})
            table.insert(Configurations, {["S7_Config"] = file})
        else
            Debug:Error(ConfigSettings.ConfigFile .. " not found. Creating empty file.", {['dialogVar'] = 'StatsConfigurator'})
            Ext.SaveFile(MODINFO.SubdirPrefix .. ConfigSettings.ConfigFile, "")
            return
        end
        StatsConfigurator()
        StatsSynchronize()
        Configurations = {}
        Debug:Print("StatsConfiguration Finished.", {['dialogVar'] = 'StatsConfigurator'})
    end,

    --  BUILD CONFIG DATA
    --  =================

    ['S7_BuildConfigData'] = function()
        local buildData = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.ConfigFile) or ""
        BuildConfigData(buildData, MODINFO.UUID, "S7_Config")
        Debug:Print("Rebuilt " .. ConfigSettings.StatsLoader.FileName .. " using " .. ConfigSettings.ConfigFile)
    end,

    --  BROADCAST CONFIG-DATA
    --  =====================

    ['S7_BroadcastConfigData'] = function ()
        local broadcast = Ext.LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName) or ""
        if ValidString(broadcast) then
            Ext.BroadcastMessage("S7_Config::ConfigData", broadcast)
            Debug:Print("Server broadcasted their configuration file.")
        else Debug:Error("Failed to broadcast the configuration file.") end
    end,

    --  VALIDATE CLIENT CONFIG
    --  ======================

    ['S7_ValidateClientConfigs'] = function () ValidateClientConfigs() end,

    --  TOGGLES
    --  =======

    ['S7_ToggleSafetyCheck'] = function () ConfigSettings.BypassSafetyCheck = not ConfigSettings.BypassSafetyCheck end,
    ['S7_ToggleStatsLoader'] = function () ConfigSettings.StatsLoader.Enable = not ConfigSettings.StatsLoader.Enable end,
    ['S7_ToggleSyncStatPersistence'] = function () ConfigSettings.SyncStatPersistence = not ConfigSettings.SyncStatPersistence end,

    --  SETTINGS
    --  ========

    ['S7_RefreshSettings'] = function ()
        RefreshSettings()
        Collections:Rebuild()
        Debug:Print("Config-Settings refreshed")
    end,

    ['S7_SetDefaultSettings'] = function ()
        ConfigSettings:Update()
        ConfigSettings:Save()
        Debug:Print("Default-Settings restored")
    end,

    ['S7_RebuildCollections'] = function () Collections:Rebuild() end,
    ['S7_ExportCurrentSettings'] = function () ConfigSettings:Save() end

}

--  ==============
--  MOD-MENU RELAY
--  ==============

Ext.RegisterOsirisListener("GlobalFlagSet", 1, "after", function (signal)
    if not ModMenuRelay[signal] then return end
    UserInformation:ReSync()
    ModMenuRelay[signal]()
    ModMenuDialog:Set()
    Osi.GlobalClearFlag(signal)
end)