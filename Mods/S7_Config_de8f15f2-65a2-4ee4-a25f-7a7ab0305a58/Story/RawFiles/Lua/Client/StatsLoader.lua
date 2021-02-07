--  ============
--  STATS LOADER
--  ============

---Loads ConfigData
function StatsLoader()
    if not Settings.StatsLoader.Enable then Debug:FWarn("StatsLoader is disabled.") return end

    Collections:Rebuild()

    --  LOAD CONFIG-DATA
    --  ================

    Debug:HFPrint("StatsLoader active. Loading " .. Settings.StatsLoader.FileName)
    local configData = LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or {}

    Stats.Memoizer.Cache = Integrate(Stats.Memoizer, configData['Cache']) -- Preload Cached Information
    ForEach(configData, function (key, value)
        if key == 'Cache' then return end
        Stats.Configurations[key] = value
    end)

    --  CALL CONFIGURATOR
    --  =================

    Stats:Configurator()
    Debug:Print("StatsLoading completed")
end

--  ============================================
Ext.RegisterListener('StatsLoaded', StatsLoader)
--  ============================================
