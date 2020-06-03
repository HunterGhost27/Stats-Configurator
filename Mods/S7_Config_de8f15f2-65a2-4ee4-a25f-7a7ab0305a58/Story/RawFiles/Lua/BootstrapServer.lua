--  #################################################################################################################################
--  #########                                                STATS CONFIGURATOR                                             #########
--  #################################################################################################################################

--  ===================================
Ext.Require("S7_ConfigSettings.lua")
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
            Ext.Print("[S7:Config - BootstrapServer.lua] --- Loading " .. fileName)
            local JSONstring = Ext.LoadFile(fileName) --  Loads Configuration File.
            S7_StatsConfigurator(JSONstring) --  Calls StatsConfigurator.
            S7_StatsSynchronize() --  Synchronize stats for all clients.
        end
    end

    --  STATS-SYNCHRONIZE
    -- ===================

    if Signal == "S7_StatsSynchronize" then
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Synchronizing at Player's request.")
        if S7_ConfigSettings.ManuallySynchronize ~= nil then --  Checks if player wants to manually synchronize certain stats.
            for i, stats in pairs(S7_ConfigSettings.ManuallySynchronize) do --  Iterate over manually selected stats.
                table.insert(toSync, stats) --  insert stats into toSync queue.
            end
        end
        S7_StatsSynchronize() --  Call StatsSynchronize.
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
    end

    --  EXPORT STATS TO TSV FILE
    -- ==========================

    if Signal == "S7_StatsExportTSV" then
        Ext.Print(
            "[S7:Config - BootstrapServer.lua] --- Exporting StatIDs to " ..
                S7_ConfigSettings.ExportStatIDtoTSV.FileName
        )
        S7_StatsExportTSV() --  Logs statIDs in an external TSV file for reference
    end

    --  CHANGELOG
    -- ===========
    if Signal == "S7_Config_CHANGELOG" then
        Osi.Proc_S7_Config_ChangelogRequest()
    end
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  ################################################################################################################################
