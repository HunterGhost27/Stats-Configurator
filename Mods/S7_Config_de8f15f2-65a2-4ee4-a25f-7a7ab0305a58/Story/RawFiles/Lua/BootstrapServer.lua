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
            for i, stats in ipairs(S7_ConfigSettings.ManuallySynchronize) do --  Iterate over manually selected stats.
                table.insert(toSync, stats) --  insert stats into toSync queue.
            end
        end
        S7_StatsSynchronize() --  Call StatsSynchronize.
        S7_DebugLog("StatsSynchronization Finished.")
    end

    --  BUILD CONFIG-DATA
    --  =================

    if Signal == "S7_BuildConfigData" then
        local buildData = Ext.LoadFile(S7_ConfigSettings.ConfigFile)
        S7_BuildConfigData(buildData)
        S7_DebugLog("Rebuilt " .. S7_ConfigSettings.StatsLoader.FileName .. "using " .. S7_ConfigSettings.ConfigFile)
    end

    --  SEND ACTIVE CONFIG
    --  ==================

    if Signal == "S7_BroadcastActiveConfig" then
        local broadcast = Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName) or ""
        if type(broadcast) == "string" and broadcast ~= "" and broadcast ~= nil then --  if file exists and is not empty
            Ext.BroadcastMessage("S7_ActiveConfig", broadcast) --  broadcast Server's configFile
            S7_DebugLog("Server broadcasts Active Configuration Profile.")
        else
            S7_DebugLog("Failed to broadcast Active Configuration Profile", "[Error]")
        end
    end

    --  VALIDATE CLIENT FILES
    --  =====================

    if Signal == "S7_ValidateClientConfig" then
        local compare = Ext.LoadFile(S7_ConfigSettings.StatsLoader.FileName) --  Loads server's config
        if type(compare) == "string" and compare ~= "" and compare ~= nil then -- if file exists and is not empty
            Ext.BroadcastMessage("S7_ValidateClientConfig", compare) -- broadcast server's config file to all clients.
            S7_DebugLog("Validating Client Config.")
        else
            S7_DebugLog(
                "Nothing to validate. Please check if the server has " .. S7_ConfigSettings.StatsLoader.FileName,
                "[Error]"
            )
        end
    end

    --  TOGGLE STATSLOADER
    --  ==================

    if Signal == "S7_ToggleStatsLoader" then
        if S7_ConfigSettings.StatsLoader.Enable == true then
            S7_ConfigSettings.StatsLoader.Enable = false
            S7_DebugLog("StatsLoader: Deactivated")
        else
            S7_ConfigSettings.StatsLoader.Enable = true
            S7_DebugLog("StatsLoader: Activated")
        end
    end

    --  TOGGLE SYNC-STAT PERSISTENCE
    --  ============================

    if Signal == "S7_ToggleSyncStatPersistence" then
        if S7_ConfigSettings.SyncStatPersistence == true then
            S7_ConfigSettings.SyncStatPersistence = false
            S7_DebugLog("SyncStatPersistence: Deactivated")
        else
            S7_ConfigSettings.SyncStatPersistence = true
            S7_DebugLog("SyncStatPersistence: Activated")
        end
    end

    --  TOGGLE BYPASS-SAFETY-CHECK
    --  ==========================

    if Signal == "S7_ToggleSafetyCheck" then
        if S7_ConfigSettings.BypassSafetyCheck == false then
            S7_ConfigSettings.BypassSafetyCheck = true
            S7_DebugLog("BypassSafetyCheck: Activated")
        else
            S7_ConfigSettings.BypassSafetyCheck = false
            S7_DebugLog("BypassSafetyCheck: Deactivated")
        end
    end

    --  SET DEFAULT SETTINGS
    -- ======================

    if Signal == "S7_SetDefaultSettings" then --  Resets ConfigSettings to Default Values.
        S7_ConfigSettings = S7_Rematerialize(S7_DefaultSettings)
        S7_DebugLog("Using default settings.")
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
            S7_DebugLog("S7_ConfigLog: Disabled", "[Warning]")
        else
            S7_ConfigSettings.ConfigLog = true
            S7_DebugLog("S7_ConfigLog: Enabled", "[Warning]")
        end
    end

    S7_SetDialogVars() --  Request dialogVar update
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

function S7_ValidateClientResponse(channel, payload)
    local validateClients = {}
    table.insert(validateClients, payload)
    for i, clientResponse in ipairs(validateClients) do
        if payload == "Config Mismatch Detected." then
            S7_DebugLog("Client Response: " .. tostring(payload), "[Warning]")
        else
            S7_DebugLog("Client Response: " .. tostring(payload))
        end
    end
end

--  ===========================================================================
Ext.RegisterNetListener("S7_ValidateClientResponse", S7_ValidateClientResponse)
--  ===========================================================================

--  ################################################################################################################################
