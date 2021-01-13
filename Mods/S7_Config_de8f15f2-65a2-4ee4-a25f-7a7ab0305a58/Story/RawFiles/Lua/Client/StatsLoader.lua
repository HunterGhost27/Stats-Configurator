--  ============
--  STATS LOADER
--  ============

function StatsLoader()
    if not ConfigSettings.StatsLoader.Enable then Debug:Warn("StatsLoader is disabled.") return end

    Collections:Rebuild()

    --  LOAD CONFIG-DATA
    --  ================

    Debug:Print("StatsLoader active. Loading " .. ConfigSettings.StatsLoader.FileName)
    local configData = LoadFile(MODINFO.SubdirPrefix .. ConfigSettings.StatsLoader.FileName) or {}

    --  QUEUE CONFIGURATION W.R.T LOAD ORDER
    --  ====================================

    for _, modUUID in ipairs(Ext.GetModLoadOrder()) do
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
end

--  ============================================
Ext.RegisterListener("StatsLoaded", StatsLoader)
--  ============================================
