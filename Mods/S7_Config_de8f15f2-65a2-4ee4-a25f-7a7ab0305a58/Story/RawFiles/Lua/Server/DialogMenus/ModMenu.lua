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

    --  REFRESH SETTINGS
    --  ================

    ['S7_RefreshSettings'] = function ()
        RefreshSettings()
        Collections:Rebuild()
        Debug:Print("Settings refreshed.")
    end,

    --  PRINT MOD-REGISTRY
    --  ==================

    ['S7_PrintModRegistry'] = function ()
        local registry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, nil)
        Stringer:SetHeader("Mods registered to Stats-Configurator")
        local registeredMods = ""
        for i, entry in ipairs(registry) do
            local registeredModInfo = {["Name"] = "Unspecified", ["Author"] = "Unspecified"}
            if entry[2] ~= nil then registeredModInfo = Ext.GetModInfo(entry[2]) end
            registeredMods = registeredMods .. "[" .. i .. "]" .. " - " .. registeredModInfo.Name .. " by " .. registeredModInfo.Author .. "\n"
        end
        Stringer:Add(registeredMods)
        Stringer:Build()
    end,

    --  TOGGLES
    --  =======

    ['S7_ToggleSafetyCheck'] = function () ConfigSettings.BypassSafetyCheck = not ConfigSettings.BypassSafetyCheck end,
    ['S7_ToggleStatsLoader'] = function () ConfigSettings.StatsLoader.Enable = not ConfigSettings.StatsLoader.Enable end,
    ['S7_ToggleSyncStatPersistence'] = function () ConfigSettings.SyncStatPersistence = not ConfigSettings.SyncStatPersistence end,

    --  SETTINGS
    --  ========

    ['S7_SetDefaultSettings'] = function ()
        ConfigSettings = Rematerialize(DefaultSettings)
        Debug:Print("Using default settings.")
    end,

    ['S7_RebuildCollections'] = function () Collections:Rebuild() end,

    ['S7_ExportCurrentSettings'] = function ()
        SaveFile(MODINFO.SubdirPrefix .. "S7_ConfigSettings.json", ConfigSettings)
        Debug:Print("Exporting current ConfigSettings to S7_ConfigSettings.json")
        RefreshSettings()
        Debug:Print("Custom Settings Exported and Refreshed.")
    end

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