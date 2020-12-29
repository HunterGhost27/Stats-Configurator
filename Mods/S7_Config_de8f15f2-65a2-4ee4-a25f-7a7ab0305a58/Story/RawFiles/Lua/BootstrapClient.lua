--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")
Ext.Require("Collections.lua")
Ext.Require("StatsConfigurator.lua")

--  ============
--  STATS LOADER
--  ============

function StatsLoader()
    Collections:Rebuild()

    --  LOAD CONFIG-DATA
    --  ================

    if ConfigSettings.StatsLoader.Enable then
        S7DebugPrint("StatsLoader active. Loading " .. ConfigSettings.StatsLoader.FileName, "BootstrapClient")
        local configData = LoadFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName) or {}

        --  QUEUE CONFIGURATION W.R.T LOAD ORDER
        --  ====================================

        local modLoadOrder = Ext.GetModLoadOrder()
        for _, modUUID in ipairs(modLoadOrder) do
            if modUUID ~= ModInfo.UUID then
                if configData[modUUID] and configData[modUUID]["ModUUID"] == modUUID then
                    Configurations[#Configurations + 1] = {[configData[modUUID]["ModName"]] = configData[modUUID]["Content"]}
                end
            end
        end

        if configData[ModInfo.UUID] then
            table.insert(Configurations, {[configData[ModInfo.UUID]["ModName"]] = configData[ModInfo.UUID]["Content"]})
        end

        --  CALL CONFIGURATOR
        --  =================

        StatsConfigurator()
        Configurations = {}
        Synchronizations = {}
        S7DebugPrint("StatsLoading completed.", "BootstrapClient")
    else S7DebugPrint("StatsLoader is disabled.", "BootstrapClient", nil, nil, "Warning") end
end

--  ============================================
Ext.RegisterListener("StatsLoaded", StatsLoader)
--  ============================================

--  ===============
--  CATCH BROADCAST
--  ===============

--- Listens for broadcasts from the Server
---@param channel string
---@param payload string
local function CatchBroadcast(channel, payload)

    --  BROADCASTED CONFIG-DATA
    --  =======================

    if channel == "S7_ConfigData" then
        S7DebugPrint("Client recieved configuration. Saving file: " .. ConfigSettings.StatsLoader.FileName, "BootstrapClient")
        SaveFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName, payload)
    end

    --  CLIENT CONFIG VALIDATION
    --  ========================

    if channel == "S7_ValidateClientConfig" then
        local verify = Ext.LoadFile(SubdirectoryPrefix .. ConfigSettings.StatsLoader.FileName) or ""

        for clientID, compare in pairs(Ext.JsonParse(payload)) do
            local message = clientID .. " : "

            if ValidString(verify) and compare == verify then
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