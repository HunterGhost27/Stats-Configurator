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

    for key, value in pairs(configData) do
        if key == 'Cache' then Stats.Memoizer = Memoizer:Init(value)
        else Stats.Configurations[key] = value
        end
    end

    Ext.Print(Ext.JsonStringify(Rematerialize(Stats)))

    --  CALL CONFIGURATOR
    --  =================

    Stats:Configurator()
    Debug:Print("StatsLoading completed")
end

--  ============================================
Ext.RegisterListener('StatsLoaded', StatsLoader)
--  ============================================
