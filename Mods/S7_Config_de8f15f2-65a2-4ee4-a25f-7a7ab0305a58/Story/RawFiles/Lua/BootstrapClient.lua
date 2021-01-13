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
        Debug:Print("StatsLoader active. Loading " .. ConfigSettings.StatsLoader.FileName)
        local configData = LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName) or {}

        --  QUEUE CONFIGURATION W.R.T LOAD ORDER
        --  ====================================

        local modLoadOrder = Ext.GetModLoadOrder()
        for _, modUUID in ipairs(modLoadOrder) do
            if modUUID ~= MODINFO.UUID then
                if configData[modUUID] and configData[modUUID]["ModUUID"] == modUUID then
                    Configurations[#Configurations + 1] = {[configData[modUUID]["ModName"]] = configData[modUUID]["Content"]}
                end
            end
        end

        if configData[MODINFO.UUID] then
            table.insert(Configurations, {[configData[MODINFO.UUID]["ModName"]] = configData[MODINFO.UUID]["Content"]})
        end

        --  CALL CONFIGURATOR
        --  =================

        StatsConfigurator()
        Configurations = {}
        Synchronizations = {}
        Debug:Print("StatsLoading completed.")
    else Debug:Warn("StatsLoader is disabled.") end
end

--  ============================================
Ext.RegisterListener("StatsLoaded", StatsLoader)
--  ============================================
