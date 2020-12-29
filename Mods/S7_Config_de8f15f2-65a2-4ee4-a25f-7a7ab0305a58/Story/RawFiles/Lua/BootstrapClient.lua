--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")
Ext.Require("Configurator/Collections.lua")
Ext.Require("StatsConfigurator.lua")
Ext.Require("Networking/Client.lua")

--  ============
--  STATS LOADER
--  ============

function StatsLoader()
    Collections:Rebuild()

    --  LOAD CONFIG-DATA
    --  ================

    if ConfigSettings.StatsLoader.Enable then
        S7Debug:Print("StatsLoader active. Loading " .. ConfigSettings.StatsLoader.FileName)
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
        S7Debug:Print("StatsLoading completed.")
    else S7Debug:Warn("StatsLoader is disabled.") end
end

--  ============================================
Ext.RegisterListener("StatsLoaded", StatsLoader)
--  ============================================
