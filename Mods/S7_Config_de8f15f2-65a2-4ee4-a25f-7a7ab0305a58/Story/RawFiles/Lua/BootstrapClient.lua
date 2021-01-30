--  =======
--  IMPORTS
--  =======

Ext.Require('Auxiliary.lua')
Ext.Require('Shared/Collections.lua')
Ext.Require('Shared/References.lua')
Ext.Require('Shared/StatsConfigurator.lua')
Ext.Require('Client/Networking.lua')
Ext.Require('Client/StatsLoader.lua')

--  UI-COMPONENTS-LIBRARY INTEGRATION
--  =================================

if Ext.IsModLoaded(UCLUUID) then Ext.Require('Client/ContextMenu.lua') end