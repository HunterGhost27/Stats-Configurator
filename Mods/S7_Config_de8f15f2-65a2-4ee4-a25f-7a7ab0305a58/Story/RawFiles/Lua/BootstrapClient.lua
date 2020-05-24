--  ################################################################################################################
--  ########                                       STATS CONFIGURATOR                                       ########
--  ################################################################################################################

local function S7_StatsConfigurator()
    Ext.Print("[S7:Config - BootstrapClient.lua] --- Loading S7_ClientConfig.json")
    local JSONstring = Ext.LoadFile("S7_ClientConfig.json") --  Loads Configuration File.
    local JSONborne = Ext.JsonParse(JSONstring) --  Parse JSONstring.

    --  ______________________________________________________
    --  JSONborne
    --        \---  name: content
    --                         \--- key: value
    --  ______________________________________________________

    if JSONborne ~= nil then --  JSONborne is not empty.
        Ext.Print("[S7:Config - BootstrapClient.lua] --- JSON file loaded. Applying Configuration Profile.\n\n")

        Ext.Print("=============================================================")
        for name, content in pairs(JSONborne) do --  Iterate over JSONborne
            Ext.Print(name)
            Ext.Print("-------------------------------------------------------------")

            local stat = Ext.GetStat(name) --  Gets original stat-entry
            for key, value in pairs(content) do
                Ext.Print(key .. ": " .. value .. "\t(" .. stat[key] .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                stat[key] = value --  Sets new value for Name[Attribute]
            end
            Ext.Print("_____________________________________________________________")
            Ext.Print("\n")
        end
        Ext.Print("=============================================================")
    else
        Ext.Print("[S7:Config - BootstrapClient.lua] --- JSON file could not be loaded.")
    end
    Ext.Print("[S7:Config - BootstrapClient.lua] --- Configuration Profile Active.")
end

--  =====================================================
Ext.RegisterListener("StatsLoaded", S7_StatsConfigurator)
--  =====================================================
