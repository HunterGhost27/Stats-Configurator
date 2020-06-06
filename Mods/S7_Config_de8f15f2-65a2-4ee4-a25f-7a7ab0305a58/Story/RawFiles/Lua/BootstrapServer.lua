--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  =================================================================================================================================
logSource = "Lua:BootstrapServer"
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
--  #################################################################################################################################

--  #######################
--       MOD-MENU RELAY
--  #######################

local function S7_Config_ModMenuRelay(Signal) --  Signal recieved from Osiris.
    --  STATS-CONFIGURATOR
    -- ====================

    if Signal == "S7_StatsConfigurator" then
        local file = Ext.LoadFile(S7_ConfigSettings.ConfigFile) or nil
        if type(file) ~= "nil" or file == "" then
            S7_DebugLog("Loading: " .. S7_ConfigSettings.ConfigFile)
            table.insert(toConfigure, {["S7_Config"] = file}) -- Queue json for Configuration.
        else
            S7_DebugLog(fileName .. " not found. Creating empty file.")
            Ext.SaveFile(fileName, "")
        end
        S7_StatsConfigurator() --  Calls StatsConfigurator.
        S7_StatsSynchronize() --  Synchronize stats for all clients.
        S7_DebugLog("StatsConfiguration Finished.")
    end

    --  STATS-SYNCHRONIZE
    -- ===================

    if Signal == "S7_StatsSynchronize" then
        S7_DebugLog("Synchronizing at Player's request.")
        if S7_ConfigSettings.ManuallySynchronize ~= nil then --  Checks if player wants to manually synchronize certain stats.
            for i, stats in pairs(S7_ConfigSettings.ManuallySynchronize) do --  Iterate over manually selected stats.
                table.insert(toSync, stats) --  insert stats into toSync queue.
            end
        end
        S7_StatsSynchronize() --  Call StatsSynchronize.
        S7_DebugLog("StatsSynchronization Finished.")
    end

    --  CLEAR STAGED-CHANGES
    --  ====================

    if Signal == "S7_ClearStagedConfig" then
        toConfigure = {}
    end

    --  BUILD ACTIVE CONFIG
    --  ===================

    if Signal == "S7_BuildActiveConfig" then
        S7_BuildActiveConfig()
    end

    --  SEND ACTIVE CONFIG
    --  ==================

    if Signal == "S7_BroadcastActiveConfig" then
        S7_BroadcastToClients()
    end

    --  TOGGLE STATSLOADER
    --  ==================

    if Signal == "S7_ToggleStatsLoader" then
        if S7_ConfigSettings.StatsLoader.Enable == true then
            S7_ConfigSettings.StatsLoader.Enable = false
            S7_DebugLog("StatsLoader: Deactivated", nil, "Settings", "Settings: Custom")
        else
            S7_ConfigSettings.StatsLoader.Enable = true
            S7_DebugLog("StatsLoader: Activated", nil, "Settings", "Settings: Custom")
        end
    end

    --  TOGGLE SYNC-STAT PERSISTENCE
    --  ============================

    if Signal == "S7_ToggleSyncStatPersistence" then
        if S7_ConfigSettings.SyncStatPersistence == true then
            S7_ConfigSettings.SyncStatPersistence = false
            S7_DebugLog("SyncStatPersistence: Deactivated", nil, "Settings", "Settings: Custom")
        else
            S7_ConfigSettings.SyncStatPersistence = true
            S7_DebugLog("SyncStatPersistence: Activated", nil, "Settings", "Settings: Custom")
        end
    end

    --  TOGGLE BYPASS-SAFETY-CHECK
    --  ==========================

    if Signal == "S7_ToggleSafetyCheck" then
        if S7_ConfigSettings.BypassSafetyCheck == false then
            S7_ConfigSettings.BypassSafetyCheck = true
            S7_DebugLog("BypassSafetyCheck: Activated", nil, "Settings", "Settings: Custom")
        else
            S7_ConfigSettings.BypassSafetyCheck = false
            S7_DebugLog("BypassSafetyCheck: Deactivated", nil, "Settings", "Settings: Custom")
        end
    end

    --  SET DEFAULT SETTINGS
    -- ======================

    if Signal == "S7_SetDefaultSettings" then
        S7_SetDefaultSettings() --  Resets ConfigSettings to Default Values.
        S7_DebugLog("Settings restored to default values.", nil, "Settings", "Settings: Default")
    end

    --  REFRESH SETTINGS
    -- ==================

    if Signal == "S7_RefreshSettings" then
        S7_RefreshSettings() --  Reload settings.
        S7_DebugLog("Settings refreshed.")
    end

    --  EXPORT CURRENT SETTINGS
    -- =========================

    if Signal == "S7_ExportCurrentSettings" then
        S7_ExportCurrentSettings() --  Calls Export settings function.
        S7_RefreshSettings() --  Reload settings.
        S7_DebugLog("Custom Settings Exported and Refreshed.")
    end

    --  EXPORT STATS TO TSV FILE
    -- ==========================

    if Signal == "S7_StatsExportTSV" then
        S7_StatsExportTSV() --  Logs statIDs in an external TSV file for reference
        S7_DebugLog("Exporting StatIDs to " .. S7_ConfigSettings.ExportStatIDtoTSV.FileName)
    end

    --  CHANGELOG
    -- ===========
    if Signal == "S7_Config_CHANGELOG" then
        Osi.Proc_S7_Config_ChangelogRequest() --  Procedure Call to ChangelogRequest
    end

    S7_SetDialogVars() --  Request dialogVar update
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  ################################################################################################################################
