--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  =================================================================================================================================
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_ConfigCollections.lua")
Ext.Require("S7_StatsConfigurator.lua")
Ext.Require("S7_ModInterface.lua")
Ext.Require("S7_ConsoleCommander.lua")
logSource = "Lua:BootstrapServer"
--  #################################################################################################################################

--  #######################
--       MOD-MENU RELAY
--  #######################

local function S7_Config_ModMenuRelay(Signal) --  Signal recieved from Osiris.
    FetchPlayers() -- Refetch PlayerInfo

    --  STATS-CONFIGURATOR
    -- ====================

    if Signal == "S7_StatsConfigurator" then
        local file = Ext.LoadFile(ConfigSettings.ConfigFile) or "" --  Load file.
        if ValidString(file) then --  if file exists and is not empty.
            S7_ConfigLog("Loading: " .. ConfigSettings.ConfigFile)
            table.insert(toConfigure, {["S7_Config"] = file}) -- Queue json for Configuration.
            Osi.OpenMessageBox(userInfo.hostCharacter.currentCharacter, "Configuration initiated. Please be patient.")
        else
            S7_ConfigLog(ConfigSettings.ConfigFile .. " not found. Creating empty file.", "[Error]")
            Ext.SaveFile(ConfigSettings.ConfigFile, "")
        end
        RebuildCollections() -- Rebuild Collections.
        StatsConfigurator() --  Calls StatsConfigurator.
        StatsSynchronize() --  Synchronize stats for all clients.
        toConfigure = {} --  Clear toConfigure queue.
        S7_ConfigLog("StatsConfiguration Finished.")
    end

    --  BUILD CONFIG-DATA
    --  =================

    if Signal == "S7_BuildConfigData" then
        local buildData = Ext.LoadFile(ConfigSettings.ConfigFile) or "" --  Load ConfigFile.
        BuildConfigData(buildData, modInfo.UUID, "S7_Config") --  Rebuild ConfigData file.
        S7_ConfigLog("Rebuilt " .. ConfigSettings.StatsLoader.FileName .. " using " .. ConfigSettings.ConfigFile)
    end

    --  SEND CONFIG DATA
    --  ================

    if Signal == "S7_BroadcastConfigData" then
        local broadcast = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) or "" --  Load configData file.
        if ValidString(broadcast) then --  if file exists and is not empty
            Ext.BroadcastMessage("S7_ConfigData", broadcast) --  broadcast Server's configFile
            S7_ConfigLog("Server broadcasted their configuration file.")
        else
            S7_ConfigLog("Failed to broadcast the configuration file.", "[Error]")
        end
    end

    --  VALIDATE CLIENT FILES
    --  =====================

    if Signal == "S7_ValidateClientConfig" then
        ValidateClientConfigs()
    end

    --  TOGGLE STATSLOADER
    --  ==================

    if Signal == "S7_ToggleStatsLoader" then
        if ConfigSettings.StatsLoader.Enable == true then
            ConfigSettings.StatsLoader.Enable = false
            S7_ConfigLog("StatsLoader: Deactivated")
        else
            ConfigSettings.StatsLoader.Enable = true
            S7_ConfigLog("StatsLoader: Activated")
        end
    end

    --  TOGGLE SYNC-STAT PERSISTENCE
    --  ============================

    if Signal == "S7_ToggleSyncStatPersistence" then
        if ConfigSettings.SyncStatPersistence == true then
            ConfigSettings.SyncStatPersistence = false
            S7_ConfigLog("SyncStatPersistence: Deactivated")
        else
            ConfigSettings.SyncStatPersistence = true
            S7_ConfigLog("SyncStatPersistence: Activated")
        end
    end

    --  TOGGLE BYPASS-SAFETY-CHECK
    --  ==========================

    if Signal == "S7_ToggleSafetyCheck" then
        if ConfigSettings.BypassSafetyCheck == false then
            ConfigSettings.BypassSafetyCheck = true
            S7_ConfigLog("BypassSafetyCheck: Activated")
        else
            ConfigSettings.BypassSafetyCheck = false
            S7_ConfigLog("BypassSafetyCheck: Deactivated")
        end
    end

    --  SET DEFAULT SETTINGS
    -- ======================

    if Signal == "S7_SetDefaultSettings" then --  Resets ConfigSettings to Default Values.
        ConfigSettings = Rematerialize(DefaultSettings)
        S7_ConfigLog("Using default settings.")
    end

    --  REFRESH SETTINGS
    -- ==================

    if Signal == "S7_RefreshSettings" then
        RefreshSettings() --  Reload settings.
        S7_ConfigLog("Settings refreshed.")
    end

    --  EXPORT CURRENT SETTINGS
    -- =========================

    if Signal == "S7_ExportCurrentSettings" then --  Exports the current ConfigSettings to ConfigSettings.json file.
        local exportSettings = Ext.JsonStringify(ConfigSettings) --  stringifies the current ConfigSettings.
        Ext.SaveFile("S7_ConfigSettings.json", exportSettings) --  Save json file.
        S7_ConfigLog("Exporting current ConfigSettings to S7_ConfigSettings.json")
        RefreshSettings() --  Reload settings.
        S7_ConfigLog("Custom Settings Exported and Refreshed.")
    end

    --  EXPORT STATS TO TSV FILE
    -- ==========================

    if Signal == "S7_StatsExportTSV" then
        S7_ConfigLog("Exporting StatIDs to " .. ConfigSettings.ExportStatIDtoTSV.FileName)
        StatsExportTSV() --  Logs statIDs in an external TSV file for reference
    end

    --  CHANGELOG
    -- ===========

    if Signal == "S7_Config_CHANGELOG" then
        Osi.Proc_S7_Config_ChangelogRequest() --  Procedure Call to ChangelogRequest
    end

    --  MOD-REGISTRY
    --  ============

    if Signal == "S7_PrintModRegistry" then
        local registry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, nil)
        S7_ConfigLog("Mods registered to Stats-Configurator")
        S7_ConfigLog("======================================================")
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
        S7_ConfigLog(registeredMods, nil, "RegisteredMods")
        S7_ConfigLog("======================================================")
    end

    --  REBUILD COLLECTIONS
    --  ===================

    if Signal == "S7_RebuildCollections" then
        RebuildCollections()
    end

    --  TOGGLE LOG
    --  ==========

    if Signal == "S7_ToggleConfigLog" then
        if ConfigSettings.ConfigLog.Enable == true then
            ConfigSettings.ConfigLog.Enable = false
            S7_ConfigLog("S7_ConfigLog: Disabled", "[Warning]")
        else
            ConfigSettings.ConfigLog.Enable = true
            S7_ConfigLog("S7_ConfigLog: Enabled", "[Warning]")
        end
    end

    SetDialogVars() --  Request dialogVar update everytime ModMenu relays a signal.
    ExportLog() -- Exports logs to TSV file if ConfigLog is enabled.
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  ##########################################################################################################################################

--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

function ValidateClientConfigs()
    S7_ConfigLog("Validating Client Config...")
    local compare = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) --  Loads server's config
    if ValidString(compare) then -- if file exists and is not empty
        FetchPlayers() --  Rebuild user-information. UserID is volatile.
        for userProfileID, _ in pairs(userInfo.clientCharacters) do
            local clientID =
                userInfo.clientCharacters[userProfileID]["currentCharacterName"] ..
                " (" .. userInfo.clientCharacters[userProfileID]["userName"] .. ")"
            local payload = {[clientID] = compare}

            Ext.PostMessageToClient(
                userInfo.clientCharacters[userProfileID]["currentCharacter"],
                "S7_ValidateClientConfig",
                Ext.JsonStringify(payload)
            ) -- broadcast server's config file to all clients.
        end
        Osi.OpenMessageBox(userInfo.hostCharacter.currentCharacter, "Please check the debug-console for results.")
    else
        S7_ConfigLog(
            "Nothing to validate. Please check if the server has " .. ConfigSettings.StatsLoader.FileName,
            "[Error]"
        )
    end
end

--============================================================================
Ext.RegisterOsirisListener("UserConnected", 3, "after", ValidateClientConfigs)
--============================================================================

--  ========================
--  VALIDATE CLIENT RESPONSE
--  ========================

function ValidateClientResponse(channel, payload) --  Recieves client response.
    local clientResponse = payload
    if string.match(clientResponse, "Active configuration mismatch detected.") then --  if Client responded with ConfigMismatch.
        S7_ConfigLog("Client Response: " .. tostring(clientResponse), "[Warning]") --  Warn Player.
    elseif string.match(clientResponse, "Active configuration profile verified.") then
        S7_ConfigLog("Client Response: " .. tostring(clientResponse))
    end

    ExportLog() -- Exports ConfigLogs if they're enabled.
end

--  ========================================================================
Ext.RegisterNetListener("S7_ValidateClientResponse", ValidateClientResponse)
--  ========================================================================

--  ################################################################################################################################
