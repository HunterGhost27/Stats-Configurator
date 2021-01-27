--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")
Ext.Require("Shared/Collections.lua")
Ext.Require("Shared/References.lua")
Ext.Require("Shared/StatsConfigurator.lua")
Ext.Require("Client/Networking.lua")
Ext.Require("Client/StatsLoader.lua")

--  UI-COMPONENTS-LIBRARY INTEGRATION
--  =================================

if Ext.IsModLoaded('b66d56c6-12f9-4abc-844f-0c30b89d32e4') then
    Ext.Require('Client/ContextMenu.lua')
end