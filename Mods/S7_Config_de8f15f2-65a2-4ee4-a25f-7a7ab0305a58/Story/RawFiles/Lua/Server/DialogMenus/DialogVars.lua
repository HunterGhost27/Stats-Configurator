ModMenuDialog = Dialog:New({['Name'] = 'S7_Config_ModMenu'})

--  ================
--  DIALOG VARIABLES
--  ================

DialogVars = {}

--  UPDATE DIALOG-VARS
--  ==================

function DialogVars:Update()
    ModMenuDialog:Update({
        ['ConfigFile'] = {['dialogVar'] = 'S7_Config_ConfigFile_d1802751-5b8f-4cc2-91bb-0ed459bf920d', ['dialogVal'] = tostring(ConfigSettings.ConfigFile)},
        ['ConfigData'] = {['dialogVar'] = 'S7_ConfigData_50855cec-1d18-4305-9292-f47ae56735c8', ['dialogVal'] = tostring(ConfigSettings.StatsLoader.FileName)},
        ['StatsLoader'] = {['dialogVar'] = 'S7_Config_StatsLoader_11670d82-a36e-4657-9868-5fdb7c86db37', ['dialogVal'] = tostring(ConfigSettings.StatsLoader.Enable)},
        ['SyncStatPersistence'] = {['dialogVar'] = 'S7_SyncStatPersistence_e48a7ea1-a9e4-430e-8ccc-99fe3fcc477a', ['dialogVal'] = tostring(ConfigSettings.SyncStatPersistence)},
        ['BypassSafetyCheck'] = {['dialogVar'] = 'S7_Config_BypassSafety_06618d4e-dff1-4bfb-a0e2-14865b5dfb64', ['dialogVal'] = tostring(ConfigSettings.BypassSafetyCheck)},
        ['Settings'] = {['dialogVar'] = 'S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6', ['dialogVal'] = Ext.JsonStringify(ConfigSettings) == Ext.JsonStringify(DefaultSettings) and 'Default' or 'Custom'},
    })
end

--  SET DIALOG VARIABLES
--  ====================

function DialogVars:Set() --  Short-hand for DialogSetVariableFixedString(). Isn't called instantly so changes are applied when Osiris is available.
    ModMenuDialog:Set() 
    -- self.Update()
    -- local dialogAlias = {
    --     ["StatsLoader"] = "S7_Config_StatsLoader_11670d82-a36e-4657-9868-5fdb7c86db37",
    --     ["StatsConfigurator"] = "S7_Config_StatsConfiguratorResponse_68b60e77-cbff-460d-8a78-5a264fe0bbcb",
    --     ["Settings"] = "S7_Config_Settings_c02bc213-de0d-4f0f-b501-7b8913d146a6",
    --     ["ExportStats"] = "S7_Config_ExportedStats_e59ebc61-6f13-4e91-9200-36e474113c48",
    --     ["SyncStat"] = "S7_Config_SyncStat_7506390a-9fa8-4300-8abd-5dc476e6b917",
    --     ["SyncStatPersistence"] = "S7_SyncStatPersistence_e48a7ea1-a9e4-430e-8ccc-99fe3fcc477a",
    --     ["BypassSafetyCheck"] = "S7_Config_BypassSafety_06618d4e-dff1-4bfb-a0e2-14865b5dfb64",
    --     ["ModAddedTo"] = "S7_Config_ModAddedTo_70f2c40a-2237-4041-aed6-d1f1623d0ab6",
    --     ["ModID"] = "S7_Config_ModID_76d92488-990f-45d4-828a-525bf966efaa",
    --     ["ValidateClientConfig"] = "S7_ValidateConfigResponse_7b9be638-58ed-44ff-ab3e-6245efdee698",
    --     ["RegisteredMods"] = "S7_RegisteredMods_4ff2880e-6a62-4ed3-9f6f-28eaa30165b1",
    --     ["S7_ConfigLog"] = "S7_ConfigLog_f7d055c6-0d9c-44e8-9959-21046cc33cb5",
    --     ["ConfigData"] = "S7_ConfigData_50855cec-1d18-4305-9292-f47ae56735c8",
    --     ["ConfigFile"] = "S7_Config_ConfigFile_d1802751-5b8f-4cc2-91bb-0ed459bf920d"
    -- }

    -- for dialogName, dialogVariable in pairs(dialogAlias) do
    --     if ValidString(self[dialogName]) then
    --         Osi.DialogSetVariableFixedString(DIALOGMENU.ModMenu, dialogVariable, self[dialogName])
    --     end
    -- end
end
