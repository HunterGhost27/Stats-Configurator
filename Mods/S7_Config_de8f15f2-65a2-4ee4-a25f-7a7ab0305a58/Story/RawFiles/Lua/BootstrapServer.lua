--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  #################################################################################################################################

--  ====================================
logSource = "Lua:BootstrapServer"
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_StatsConfigurator.lua")
--  ===================================

--  #######################
--       MOD-MENU RELAY
--  #######################

local function S7_Config_ModMenuRelay(Signal) --  Signal recieved from Osiris.
    --  STATS-CONFIGURATOR
    -- ====================

    if Signal == "S7_StatsConfigurator" then
        local files = S7_ConfigSettings.ConfigFiles --  lists all config files.
        for i, fileName in ipairs(files) do --  Iterate over each file.
            S7_DebugLog("Queue: [" .. i .. "] - " .. fileName)
            table.insert(toConfigure, {["S7_Config"] = Ext.LoadFile(fileName)}) -- Queue json for Configuration.
        end
        S7_StatsConfigurator() --  Calls StatsConfigurator.
        S7_StatsSynchronize() --  Synchronize stats for all clients.
        toConfigure = {} --  Clear out toConfigure queue.
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
    end

    --  TOGGLE STATSLOADER
    --  ==================

    if Signal == "S7_ToggleStatsLoader" then
        if S7_ConfigSettings.StatsLoader == true then
            S7_ConfigSettings.StatsLoader = false
        else
            S7_ConfigSettings.StatsLoader = true
        end
    end

    --  TOGGLE SYNC-STAT PERSISTENCE
    --  ============================

    if Signal == "S7_ToggleSyncStatPersistence" then
        if S7_ConfigSettings.SyncStatPersistence == true then
            S7_ConfigSettings.SyncStatPersistence = false
        else
            S7_ConfigSettings.SyncStatPersistence = true
        end
    end

    --  TOGGLE BYPASS-SAFETY-CHECK
    --  ==========================

    if Signal == "S7_ToggleSafetyCheck" then
        if S7_ConfigSettings.BypassSafetyCheck == true then
            S7_ConfigSettings.BypassSafetyCheck = false
        else
            S7_ConfigSettings.BypassSafetyCheck = true
        end
    end

    --  SET DEFAULT SETTINGS
    -- ======================

    if Signal == "S7_SetDefaultSettings" then
        S7_SetDefaultSettings() --  Resets ConfigSettings to Default Values.
    end

    --  REFRESH SETTINGS
    -- ==================

    if Signal == "S7_RefreshSettings" then
        S7_RefreshSettings() --  Nice and easy
    end

    --  EXPORT CURRENT SETTINGS
    -- =========================

    if Signal == "S7_ExportCurrentSettings" then
        S7_ExportCurrentSettings() --  Calls Export settings function.
        S7_RefreshSettings() --  Reload settings.
    end

    --  EXPORT STATS TO TSV FILE
    -- ==========================

    if Signal == "S7_StatsExportTSV" then
        S7_DebugLog("Exporting StatIDs to " .. S7_ConfigSettings.ExportStatIDtoTSV.FileName)
        S7_StatsExportTSV() --  Logs statIDs in an external TSV file for reference
    end

    --  CHANGELOG
    -- ===========
    if Signal == "S7_Config_CHANGELOG" then
        Osi.Proc_S7_Config_ChangelogRequest() --  Procedure Call to ChangelogRequest
    end

    S7_UpdateSettingVars()
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  ################################################################################################################################
