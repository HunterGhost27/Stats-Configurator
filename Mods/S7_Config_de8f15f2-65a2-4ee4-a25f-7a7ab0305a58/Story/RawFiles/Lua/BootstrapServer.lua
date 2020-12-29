--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")
Ext.Require("Collections.lua")
Ext.Require("StatsConfigurator.lua")
Ext.Require("ModInterface.lua")
Ext.Require("ConsoleCommander.lua")

if Ext.IsDeveloperMode() then Ext.Require("DevMode.lua") end

--  #######################
--       MOD-MENU RELAY
--  #######################

function S7_Config_ModMenuRelay(Signal)
    UserInfo:Fetch()

    --  STATS-CONFIGURATOR
    -- ====================

    if Signal == "S7_StatsConfigurator" then
        local file = Ext.LoadFile(SubdirectoryPrefix .. ConfigSettings.ConfigFile) or ""
        if ValidString(file) then
            S7Debug:Print("Loading: " .. ConfigSettings.ConfigFile)
            table.insert(Configurations, {["S7_Config"] = file})
        else
            S7Debug:Error(ConfigSettings.ConfigFile .. " not found. Creating empty file.")
            Ext.SaveFile(SubdirectoryPrefix .. ConfigSettings.ConfigFile, "")
        end
        StatsConfigurator()
        StatsSynchronize()
        Configurations = {}
        S7Debug:Print("StatsConfiguration Finished.")
    end

    --  BUILD CONFIG-DATA
    --  =================

    if Signal == "S7_BuildConfigData" then
        local buildData = Ext.LoadFile(SubdirectoryPrefix .. ConfigSettings.ConfigFile) or ""
        BuildConfigData(buildData, ModInfo.UUID, "S7_Config")
        S7Debug:Print("Rebuilt " .. ConfigSettings.StatsLoader.FileName .. " using " .. ConfigSettings.ConfigFile)
    end

    --  SEND CONFIG DATA
    --  ================

    if Signal == "S7_BroadcastConfigData" then
        local broadcast = Ext.LoadFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName) or ""
        if ValidString(broadcast) then
            Ext.BroadcastMessage("S7_ConfigData", broadcast)
            S7Debug:Print("Server broadcasted their configuration file.")
        else S7Debug:Error("Failed to broadcast the configuration file.") end
    end

    --  VALIDATE CLIENT FILES
    --  =====================

    if Signal == "S7_ValidateClientConfig" then ValidateClientConfigs() end

    --  TOGGLE STATSLOADER
    --  ==================

    if Signal == "S7_ToggleStatsLoader" then
        if ConfigSettings.StatsLoader.Enable == true then
            ConfigSettings.StatsLoader.Enable = false
            S7Debug:Print("StatsLoader: Deactivated")
        else
            ConfigSettings.StatsLoader.Enable = true
            S7Debug:Print("StatsLoader: Activated")
        end
    end

    --  TOGGLE SYNC-STAT PERSISTENCE
    --  ============================

    if Signal == "S7_ToggleSyncStatPersistence" then
        if ConfigSettings.SyncStatPersistence == true then
            ConfigSettings.SyncStatPersistence = false
            S7Debug:Print("SyncStatPersistence: Deactivated")
        else
            ConfigSettings.SyncStatPersistence = true
            S7Debug:Print("SyncStatPersistence: Activated")
        end
    end

    --  TOGGLE BYPASS-SAFETY-CHECK
    --  ==========================

    if Signal == "S7_ToggleSafetyCheck" then
        if ConfigSettings.BypassSafetyCheck == false then
            ConfigSettings.BypassSafetyCheck = true
            S7Debug:Print("BypassSafetyCheck: Activated")
        else
            ConfigSettings.BypassSafetyCheck = false
            S7Debug:Print("BypassSafetyCheck: Deactivated")
        end
    end

    --  SET DEFAULT SETTINGS
    -- ======================

    if Signal == "S7_SetDefaultSettings" then
        ConfigSettings = Rematerialize(DefaultSettings)
        S7Debug:Print("Using default settings.")
    end

    --  REFRESH SETTINGS
    -- ==================

    if Signal == "S7_RefreshSettings" then
        RefreshSettings()
        Collections:Rebuild()
        S7Debug:Print("Settings refreshed.")
    end

    --  EXPORT CURRENT SETTINGS
    -- =========================

    if Signal == "S7_ExportCurrentSettings" then
        SaveFile(SubdirectoryPrefix .. "S7_ConfigSettings.json", ConfigSettings)
        S7Debug:Print("Exporting current ConfigSettings to S7_ConfigSettings.json")
        RefreshSettings()
        S7Debug:Print("Custom Settings Exported and Refreshed.")
    end

    --  EXPORT STATS TO TSV FILE
    -- ==========================

    if Signal == "S7_StatsExportTSV" then
        S7Debug:Print("Exporting StatIDs to " .. ConfigSettings.ExportStatIDtoTSV.FileName)
        StatsExportTSV()
    end

    --  CHANGELOG
    -- ===========

    if Signal == "S7_Config_CHANGELOG" then
        Osi.Proc_S7_Config_ChangelogRequest()
    end

    --  MOD-REGISTRY
    --  ============

    if Signal == "S7_PrintModRegistry" then
        local registry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, nil)
        S7Debug:Print("Mods registered to Stats-Configurator")
        S7Debug:Print("======================================================")
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
        S7Debug:Print(registeredMods, nil, "RegisteredMods")
        S7Debug:Print("======================================================")
    end

    --  REBUILD COLLECTIONS
    --  ===================

    if Signal == "S7_RebuildCollections" then
        Collections:Rebuild()
    end

    --  TOGGLE LOG
    --  ==========

    if Signal == "S7_ToggleConfigLog" then
        if ConfigSettings.ConfigLog.Enable == true then
            ConfigSettings.ConfigLog.Enable = false
            S7Debug:Print("S7_ConfigLog: Disabled")
        else
            ConfigSettings.ConfigLog.Enable = true
            S7Debug:Print("S7_ConfigLog: Enabled")
        end
    end

    DialogVars:Set() --  Request dialogVar update everytime ModMenu relays a signal.
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  ##########################################################################################################################################

--  =======================
--  VALIDATE CLIENT CONFIGS
--  =======================

function ValidateClientConfigs()
    S7Debug:Print("Validating Client Config...")
    local compare = Ext.LoadFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName)
    if ValidString(compare) then
        UserInfo:Fetch()
        for userProfileID, _ in pairs(UserInfo.clientCharacters) do
            local clientID = UserInfo.clientCharacters[userProfileID]["currentCharacterName"] .. " (" .. UserInfo.clientCharacters[userProfileID]["userName"] .. ")"
            local payload = {[clientID] = compare}
            Ext.PostMessageToClient(UserInfo.clientCharacters[userProfileID]["currentCharacter"], "S7_ValidateClientConfig", Ext.JsonStringify(payload))
        end
    else
        S7Debug:Error("Nothing to validate. Please check if the server has " .. ConfigSettings.StatsLoader.FileName)
    end
end

--============================================================================
Ext.RegisterOsirisListener("UserConnected", 3, "after", ValidateClientConfigs)
--============================================================================

--  ========================
--  VALIDATE CLIENT RESPONSE
--  ========================

function ValidateClientResponse(channel, payload)
    local clientResponse = payload
    if string.match(clientResponse, "Active configuration mismatch detected.") then
        S7Debug:Warn("Client Response: " .. tostring(clientResponse))
    elseif string.match(clientResponse, "Active configuration profile verified.") then
        S7Debug:Print("Client Response: " .. tostring(clientResponse))
    end
end

--  ========================================================================
Ext.RegisterNetListener("S7_ValidateClientResponse", ValidateClientResponse)
--  ========================================================================

--  ################################################################################################################################
