--  #################################################################################################################################
--  #########                                       STATS CONFIGURATOR - BOOTSTRAP_CLIENT                                   #########
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

local function StatsLoader() --  Loads stats-configuration json after StatsLoaded Event.
    if ConfigSettings.StatsLoader.Enable == true then --  StatsLoader enabled in settings.
        S7_ConfigLog("StatsLoader active. Loading " .. ConfigSettings.StatsLoader.FileName)
        local file = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) or "" --  Load file if it exists. Load empty string otherwise.
        if ValidJSONFile(file) then --  if configData file exists and is not empty.
            local configData = Ext.JsonParse(file) --  Parse into table.
            local modLoadOrder = Ext.GetModLoadOrder() --  Get Load order
            local pos = 1 --  position index
            for i, modUUID in ipairs(modLoadOrder) do --  Iterate over loadOrder.
                if configData[modUUID] ~= nil and configData[modUUID]["ModUUID"] == modUUID then --  if ModUUID matches.
                    toConfigure[pos] = {[configData[modUUID]["ModName"]] = configData[modUUID]["Content"]} --  Queue files for configuration.
                    pos = pos + 1 --  Increment position index.
                end
            end
            StatsConfigurator() --  Configure Stats
            toConfigure = {} -- flush config queue
            toSync = {} --  flush Sync queue, since StatsSynchronize() isn't called here.
            S7_ConfigLog("StatsLoading completed.")
        else
            S7_ConfigLog("Failed to load " .. ConfigSettings.StatsLoader.FileName, "[Error]")
        end
    else --  if StatsLoader disabled in settings.
        S7_ConfigLog("StatsLoader is disabled.", "[Warning]")
    end
end

--  ============================================
Ext.RegisterListener("StatsLoaded", StatsLoader)
--  ============================================

--  ===============
--  CATCH BROADCAST
--  ===============

local function CatchBroadcast(channel, payload) --  Listens for broadcasts from the Server.
    if channel == "S7_ConfigData" then --  if broadcast channel is S7_ConfigData.
        S7_ConfigLog("Client recieved active configuration. Saving file: " .. ConfigSettings.StatsLoader.FileName)
        Ext.SaveFile(ConfigSettings.StatsLoader.FileName, payload) --  Save stringified json.
    end

    if channel == "S7_ValidateClientConfig" then --  if broadcast channel is S7_ValidateClientConfig
        local verify = Ext.LoadFile(ConfigSettings.StatsLoader.FileName) or "" --    Load local ActiveConfiguration if available.
        for clientID, compare in pairs(Ext.JsonParse(payload)) do --  seperate client-info and the actual compare-string
            local message = clientID .. " : "
            if ValidJSONFile(verify) and compare == verify then --  compare strings
                message = message .. "Active configuration profile verified."
                Ext.PostMessageToServer("S7_ValidateClientResponse", message)
            else
                message = message .. "Active configuration mismatch detected."
                Ext.PostMessageToServer("S7_ValidateClientResponse", message)
            end
        end
    end
end

--  ==============================================================
Ext.RegisterNetListener("S7_ConfigData", CatchBroadcast)
Ext.RegisterNetListener("S7_ValidateClientConfig", CatchBroadcast)
--  ==============================================================

--  ##################################################################################################################################
