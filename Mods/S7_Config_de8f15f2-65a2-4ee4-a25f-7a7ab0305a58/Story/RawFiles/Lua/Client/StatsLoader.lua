--  ============
--  STATS LOADER
--  ============

function StatsLoader()
    if not Settings.StatsLoader.Enable then Debug:Warn("StatsLoader is disabled.") return end

    Collections:Rebuild()

    --  LOAD CONFIG-DATA
    --  ================

    Debug:HFPrint("StatsLoader active. Loading " .. Settings.StatsLoader.FileName)
    local configData = LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or {}

    --  QUEUE CONFIGURATION W.R.T LOAD ORDER
    --  ====================================

    for _, modUUID in ipairs(Ext.GetModLoadOrder()) do
        if modUUID == MODINFO.UUID then break end -- Defer user-configurations from this mod
        if configData[modUUID] then table.insert(Configurations, {[configData[modUUID]["ModName"]] = configData[modUUID]["Content"]}) end
    end

    -- Loads configurations from this mod last
    if configData[MODINFO.UUID] then table.insert(Configurations, {[configData[MODINFO.UUID]["ModName"]] = configData[MODINFO.UUID]["Content"]}) end

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
