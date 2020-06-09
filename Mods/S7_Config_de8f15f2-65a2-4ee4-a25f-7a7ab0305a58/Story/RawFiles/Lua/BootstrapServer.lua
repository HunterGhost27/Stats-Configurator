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
        local file = Ext.LoadFile(S7_ConfigSettings.ConfigFile) or "" --  Load file.
        if type(file) == "string" and file ~= nil and file ~= "" then --  if file exists and is not empty.
            S7_DebugLog("Loading: " .. S7_ConfigSettings.ConfigFile)
            table.insert(toConfigure, {["S7_Config"] = file}) -- Queue json for Configuration.
        else
            S7_DebugLog(S7_ConfigSettings.ConfigFile .. " not found. Creating empty file.", "[Error]")
            Ext.SaveFile(S7_ConfigSettings.ConfigFile, "")
        end
        S7_StatsConfigurator() --  Calls StatsConfigurator.
        S7_StatsSynchronize() --  Synchronize stats for all clients.
        S7_DebugLog("StatsConfiguration Finished.")
    end

    --  STATS-SYNCHRONIZE
    -- ===================

    if Signal == "S7_StatsSynchronize" then
        S7_DebugLog("Synchronizing stats at Player's request.")
        if S7_ConfigSettings.ManuallySynchronize ~= nil then --  Checks if player wants to manually synchronize certain stats.
            for i, stats in pairs(S7_ConfigSettings.ManuallySynchronize) do --  Iterate over manually selected stats.
                table.insert(toSync, stats) --  insert stats into toSync queue.
            end
        end
        S7_StatsSynchronize() --  Call StatsSynchronize.
        S7_DebugLog("StatsSynchronization Finished.")
    end

    --  SEND ACTIVE CONFIG
    --  ==================

    if Signal == "S7_BroadcastActiveConfig" then
        local package = {}
        local content = Ext.LoadFile(S7_ConfigSettings.ConfigFile) or ""
        if type(content) == "string" and content ~= "" and content ~= nil then
            package[S7_ConfigSettings.ConfigFile] = content
            local broadcast = Ext.JsonStringify(package)
            Ext.BroadcastMessage("S7_ActiveConfig", broadcast)
            S7_DebugLog("Server broadcasts Active Configuration Profile.")
        else
            S7_DebugLog("Failed to broadcast Active Configuration Profile", "[Error]")
        end
    end

    --  VALIDATE CLIENT FILES
    --  =====================

    if Signal == "S7_ValidateClientConfig" then
        local compare = Ext.LoadFile(S7_ConfigSettings.ConfigFile)
        if type(compare) == "string" and compare ~= "" and compare ~= nil then
            Ext.BroadcastMessage("S7_ValidateClientConfig", compare)
            S7_DebugLog("Validating Client Config.")
        else
            S7_DebugLog(
                "Nothing to validate. Please check if the server has " .. S7_ConfigSettings.ConfigFile,
                "[Error]"
            )
        end
    end

    --  TOGGLE STATSLOADER
    --  ==================

    if Signal == "S7_ToggleStatsLoader" then
        if S7_ConfigSettings.StatsLoader == true then
            S7_ConfigSettings.StatsLoader = false
            S7_DebugLog("StatsLoader: Deactivated", nil, "Settings", "Settings: Custom")
        else
            S7_ConfigSettings.StatsLoader = true
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

    if Signal == "S7_SetDefaultSettings" then --  Resets ConfigSettings to Default Values.
        S7_ConfigSettings = S7_Rematerialize(S7_DefaultSettings)
        S7_DebugLog("Using default settings.", nil, "Settings", "Settings: Default")
    end

    --  REFRESH SETTINGS
    -- ==================

    if Signal == "S7_RefreshSettings" then
        S7_RefreshSettings() --  Reload settings.
        S7_DebugLog("Settings refreshed.")
    end

    --  EXPORT CURRENT SETTINGS
    -- =========================

    if Signal == "S7_ExportCurrentSettings" then --  Exports the current ConfigSettings to S7_ConfigSettings.json file.
        local exportSettings = Ext.JsonStringify(S7_ConfigSettings) --  stringifies the current ConfigSettings.
        Ext.SaveFile("S7_ConfigSettings.json", exportSettings) --  Save json file.
        S7_DebugLog("Exporting current ConfigSettings to S7_ConfigSettings.json")
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

    --  TOGGLE LOG
    --  ==========

    if Signal == "S7_ToggleConfigLog" then
        if S7_ConfigSettings.ConfigLog == true then
            S7_ConfigSettings.ConfigLog = false
            S7_DebugLog("S7_ConfigLog: Disabled", "[Warning]", "S7_ConfigLog")
        else
            S7_ConfigSettings.ConfigLog = true
            S7_DebugLog("S7_ConfigLog: Enabled", "[Warning]", "S7_ConfigLog")
        end
    end

    S7_SetDialogVars() --  Request dialogVar update
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

function S7_ValidateClientResponse(channel, payload)
    S7_DebugLog("Client Response: " .. tostring(payload))
end

--  ===========================================================================
Ext.RegisterNetListener("S7_ValidateClientResponse", S7_ValidateClientResponse)
--  ===========================================================================

--  ################################################################################################################################
