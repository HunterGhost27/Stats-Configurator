--  ===============
--  MOD MENU DIALOG
--  ===============

ModMenuDialog = Dialog:New({['Name'] = 'S7_Config_ModMenu'})

-- Assigning dialog to debug
Debug.dialog = ModMenuDialog

ModMenuDialog:Update({
    ['ConfigData'] = {
        ['dialogVar'] = 'S7_ConfigData_50855cec-1d18-4305-9292-f47ae56735c8',
        ['dialogVal'] = function() return ValidString(Settings.StatsLoader.FileName) and Settings.StatsLoader.FileName or 'No ConfigData File Detected' end
    },
    ['StatsLoader'] = {
        ['dialogVar'] = 'S7_Config_StatsLoader_11670d82-a36e-4657-9868-5fdb7c86db37',
        ['dialogVal'] = function() return Settings.StatsLoader.Enable == true and 'Enabled' or 'Disabled' end
    },
    ['SyncStatPersistence'] = {
        ['dialogVar'] = 'S7_SyncStatPersistence_e48a7ea1-a9e4-430e-8ccc-99fe3fcc477a',
        ['dialogVal'] = function() return Settings.SyncStatPersistence == true and 'Enabled' or 'Disabled' end
    },
    ['Settings'] = {
        ['dialogVar'] = 'S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6',
        ['dialogVal'] = function() return IsEqual(Settings, MODINFO.DefaultSettings) and 'Default-Settings' or 'Custom-Settings' end
    },
    ['ConfigFile'] = {
        ['dialogVar'] = 'S7_Config_ConfigFile_d1802751-5b8f-4cc2-91bb-0ed459bf920d',
        ['dialogVal'] = function()
            local len = #Settings.ConfigFiles
            local dispMessage = 'No Config Files'
            if len == 1 then dispMessage = tostring(Settings.ConfigFiles[1])
            elseif len >= 2 then dispMessage = tostring(len) .. ' Config Files' end
            return dispMessage
        end
    },
    ['ValidateClientConfigs'] = {
        ['dialogVar'] = 'S7_ValidateConfigResponse_7b9be638-58ed-44ff-ab3e-6245efdee698',
        ['dialogVal'] = "Check the Script-Extender's DebugConsole for results"
    },
    ['StatsConfigurator'] = {['dialogVar'] = 'S7_Config_StatsConfiguratorResponse_68b60e77-cbff-460d-8a78-5a264fe0bbcb'},
    ['SyncStat'] = {['dialogVar'] = 'S7_Config_SyncStat_7506390a-9fa8-4300-8abd-5dc476e6b917'},
})

--  =================
--  INITIATE MOD-MENU
--  =================

Ext.RegisterOsirisListener("CharacterUsedItemTemplate", 3, 'after', function (character, itemTemplate, item)
    if itemTemplate ~= Inspector then return end
    ModMenuDialog:Start()
end)

--  CONSOLE COMMAND
--  ===============

ConsoleCommander:Register({
    ['Name'] = 'StartModMenu',
    ['Description'] = "Host-Character starts the Mod-Menu Dialog",
    ['Context'] = 'Server',
    ['Action'] = function()
        ModMenuDialog:Start()
        Debug:Print("ModMenu activated by the host-character")
    end
})

--  ======================
--  MOD-MENU RELAY SIGNALS
--  ======================

ModMenuDialog:AddListeners({

    --  STATS-CONFIGURATOR
    --  ==================

    ['S7_StatsConfigurator'] = function () Stats:LoadConfigs() end,

    --  BUILD CONFIG DATA
    --  =================

    ['S7_BuildConfigData'] = function() Stats:BuildConfigs() end,

    --  BROADCAST CONFIG-DATA
    --  =====================

    ['S7_BroadcastConfigData'] = function () Stats:BroadcastConfigData() end,

    --  VALIDATE CLIENT CONFIG
    --  ======================

    ['S7_ValidateClientConfigs'] = function () ValidateClientConfigs() end,

    --  TOGGLES
    --  =======

    ['S7_ToggleStatsLoader'] = function () Settings.StatsLoader.Enable = not Settings.StatsLoader.Enable end,
    ['S7_ToggleSyncStatPersistence'] = function () Settings.SyncStatPersistence = not Settings.SyncStatPersistence end,

    --  SETTINGS
    --  ========

    ['S7_RefreshSettings'] = function ()
        RefreshSettings()
        Collections:CustomRebuild()
        Debug:Print("Config-Settings refreshed")
    end,

    ['S7_SetDefaultSettings'] = function ()
        Settings = Integrate(Settings, MODINFO.DefaultSettings)
        MODINFO.ModSettings = Rematerialize(Settings)
        CENTRALIZE()
        SaveFile(CENTRALFILE, Rematerialize(CENTRAL))
        Debug:Print("Default-Settings restored")
    end,

    ['S7_RebuildCollections'] = function () Collections:Rebuild() end,
    ['S7_ExportCurrentSettings'] = function ()
        MODINFO.ModSettings = Rematerialize(Settings)
        CENTRALIZE()
        SaveFile(CENTRALFILE, Rematerialize(CENTRAL))
    end

})

ModMenuDialog:RegisterListeners()