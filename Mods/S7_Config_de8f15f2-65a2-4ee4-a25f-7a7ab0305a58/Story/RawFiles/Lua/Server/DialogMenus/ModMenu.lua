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
    local hostCharacter = Osi.CharacterGetHostCharacter()
    if Osi.QRY_SpeakerIsAvailable(hostCharacter) then Osi.Proc_StartDialog(1, DIALOGMENU.ModMenu, hostCharacter) end
end)

--  ==============
--  MOD-MENU RELAY
--  ==============

function ModMenuRelay(signal)
    if not modMenuSignals[signal] then return end

    UserInformation:Fetch()

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
            Ext.BroadcastMessage("S7_ConfigData", broadcast)
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

    --  EXPORT STATS TO TSV FILE
    -- ==========================

    -- if Signal == "S7_StatsExportTSV" then
    --     S7Debug:Print("Exporting StatIDs to " .. ConfigSettings.ExportStatIDtoTSV.FileName)
    --     StatsExportTSV()
    -- end

    --  CHANGELOG
    -- ===========

    if signal == "S7_Config_CHANGELOG" then
        Osi.Proc_S7_Config_ChangelogRequest()
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

    --  TOGGLE LOG
    --  ==========

    if signal == "S7_ToggleConfigLog" then
        if ConfigSettings.ConfigLog.Enable == true then
            ConfigSettings.ConfigLog.Enable = false
            Debug:Print("S7_ConfigLog: Disabled")
        else
            ConfigSettings.ConfigLog.Enable = true
            Debug:Print("S7_ConfigLog: Enabled")
        end
    end

    DialogVars:Set() --  Request dialogVar update everytime ModMenu relays a signal.
    Osi.GlobalClearFlag(signal)
end

--  =================================================================
Ext.RegisterOsirisListener("GlobalFlagSet", 1, "after", ModMenuRelay)
--  =================================================================