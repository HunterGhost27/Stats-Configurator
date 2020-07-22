--  #################################################################################################################################
--  #########                                               STATS CONFIGURATOR                                              #########
--  =================================================================================================================================
Ext.Require("S7_ConfigAuxiliary.lua")
Ext.Require("S7_ConfigCollections.lua")
Ext.Require("S7_StatsConfigurator.lua")
Ext.Require("S7_ConsoleCommander.lua")
logSource = "Lua:BootstrapClient"
--  #################################################################################################################################

--  ============
--  STATS LOADER
--  ============

local function StatsLoader() --  Loads configuration json after StatsLoaded event.
    RebuildCollections() --  Rebuild collections before StatsConfigurator() is called.

    --  LOAD CONFIG-DATA
    --  ================

    if ConfigSettings.StatsLoader.Enable == true then --  StatsLoader enabled in settings.
        S7_ConfigLog("StatsLoader active. Loading " .. ConfigSettings.StatsLoader.FileName)
        local file = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) or "" --  Load file if it exists. Load empty string otherwise.
        if ValidString(file) then --  if configData file exists and is not empty.
            local configData = Ext.JsonParse(file) --  Parse into table.

            --  QUEUE CONFIGURATION W.R.T LOAD ORDER
            --  ====================================

            local pos = 1 --  position index.
            local modLoadOrder = Ext.GetModLoadOrder() --  Get Load order.
            for _, modUUID in ipairs(modLoadOrder) do --  Iterate over loadOrder.
                if configData[modUUID] ~= nil and configData[modUUID]["ModUUID"] == modUUID then --  if ModUUID matches.
                    toConfigure[pos] = {[configData[modUUID]["ModName"]] = configData[modUUID]["Content"]} --  Queue files for configuration.
                    pos = pos + 1 --  Increment position index.
                end
            end

            --  CALL CONFIGURATOR
            --  =================

            StatsConfigurator() --  Configure Stats.
            toConfigure = {} -- flush config queue.
            toSync = {} --  flush Sync queue, since StatsSynchronize() isn't called here.
            S7_ConfigLog("StatsLoading completed.")
        else --  The ConfigData file made no sense
            S7_ConfigLog("Failed to load " .. ConfigSettings.StatsLoader.FileName, "[Error]")
        end
    else --  If StatsLoader is disabled in settings.
        S7_ConfigLog("StatsLoader is disabled.", "[Warning]")
    end

    ExportLog() -- Exports ConfigLogs if they're enabled.
end

--  ============================================
Ext.RegisterListener("StatsLoaded", StatsLoader)
--  ============================================

--  ===============
--  CATCH BROADCAST
--  ===============

local function CatchBroadcast(channel, payload) --  Listens for broadcasts from the Server.
    --  BROADCASTED CONFIG-DATA
    --  =======================

    if channel == "S7_ConfigData" then --  if broadcast channel is S7_ConfigData.
        S7_ConfigLog("Client recieved configuration. Saving file: " .. ConfigSettings.StatsLoader.FileName)
        Ext.SaveFile(ConfigSettings.StatsLoader.FileName, payload) --  Save stringified json.
    end

    --  CLIENT CONFIG VALIDATION
    --  ========================

    if channel == "S7_ValidateClientConfig" then --  if broadcast channel is S7_ValidateClientConfig.
        local verify = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) or "" --    Load local ConfigFile, if available.

        for clientID, compare in pairs(Ext.JsonParse(payload)) do --  seperate client-info and the actual compare-string.
            local message = clientID .. " : "

            if ValidString(verify) and compare == verify then --  if host's and client's config json match.
                message = message .. "Active configuration profile verified."
                Ext.PostMessageToServer("S7_ValidateClientResponse", message)
            else
                message = message .. "Active configuration mismatch detected."
                Ext.PostMessageToServer("S7_ValidateClientResponse", message)
            end
        end
    end

    ExportLog() -- Exports ConfigLogs if they're enabled.
end

--  ==============================================================
Ext.RegisterNetListener("S7_ConfigData", CatchBroadcast)
Ext.RegisterNetListener("S7_ValidateClientConfig", CatchBroadcast)
--  ==============================================================

--  ##################################################################################################################################
