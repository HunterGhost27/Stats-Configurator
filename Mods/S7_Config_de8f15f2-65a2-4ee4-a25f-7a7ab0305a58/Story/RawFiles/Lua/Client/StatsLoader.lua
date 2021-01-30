--  ============
--  STATS LOADER
--  ============

function StatsLoader()
    if not Settings.StatsLoader.Enable then Debug:FWarn("StatsLoader is disabled.") return end

    Collections:Rebuild()

    --  LOAD CONFIG-DATA
    --  ================

    Debug:HFPrint("StatsLoader active. Loading " .. Settings.StatsLoader.FileName)
    local configData = LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or {}

    ForEach(configData, function (key, value)
        if key == 'Cache' then return end
        Stats.Configurations[key] = value
    end)

    Stats.Memoizer:LoadCache(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName)

    Ext.Print(Ext.JsonStringify(Rematerialize(Stats)))

    --  CALL CONFIGURATOR
    --  =================

    Stats:Configurator()
    Debug:Print("StatsLoading completed")
end

--  ============================================
Ext.RegisterListener('StatsLoaded', StatsLoader)
--  ============================================
