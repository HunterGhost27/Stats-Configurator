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

toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

local function S7_Config_ModMenuRelay(Signal) --  Signal recieved from Osiris.
    if Signal == "S7_StatsConfigurator" then --  =====   STATS-CONFIGURATOR  =====
        local files = S7_ConfigSettings.ConfigFiles --  lists all config files.
        for i, fileName in ipairs(files) do --  Iterate over each file.
            Ext.Print("[S7:Config - BootstrapServer.lua] --- Loading " .. fileName)
            local JSONstring = Ext.LoadFile(fileName) --  Loads Configuration File.
            S7_StatsConfigurator(JSONstring) --  Calls StatsConfigurator.
        end
    elseif Signal == "S7_StatsSynchronize" then --  =====   STATS-SYNCHRONIZE   =====
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Synchronizing at Player's request.")
        if S7_ConfigSettings.ManuallySynchronize ~= nil then --  Checks if player wants to manually synchronize certain stats.
            for i, stats in pairs(S7_ConfigSettings.ManuallySynchronize) do --  Iterate over manually selected stats.
                table.insert(toSync, stats) --  insert stats into toSync queue.
            end
        end
        S7_StatsSynchronize() --  Call StatsSynchronize.
    elseif Signal == "S7_SetDefaultSettings" then -- ==== SET DEFAULT SETTINGS =====
        S7_SetDefaultSettings()
        S7_SetDialogVars("Settings", "Settings: Default")
    elseif Signal == "S7_RefreshSettings" then --  =====   REAPPLY-SETTINGS    ======
        S7_RefreshSettings() --  Nice and easy
    elseif Signal == "S7_ExportCurrentSettings" then --  =====   EXPORT CURRENT SETTINGS ===
        S7_ExportCurrentSettings() --  Calls Export settings function.
    elseif Signal == "S7_StatsExportTSV" then --  =====   EXPORT STATS TO TSV   =====
        Ext.Print(
            "[S7:Config - BootstrapServer.lua] --- Exporting StatIDs to " ..
                S7_ConfigSettings.ExportStatIDtoTSV.FileName
        )
        S7_StatsExportTSV() --  Logs statIDs in an external TSV file for reference
    elseif Signal == "S7_Config_CHANGELOG" then --  =====   CHANGELOG   =====
        Osi.Proc_S7_Config_ChangelogRequest()
    end
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  ################################################################################################################################
