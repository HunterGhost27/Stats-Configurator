--  ===================
--  AUXILIARY FUNCTIONS
--  ===================

--  GENERAL-PURPOSE
--  ===============

Ext.Require('AuxFunctions/Shared/General.lua')
Ext.Require('AuxFunctions/Shared/Strings.lua')
Ext.Require('AuxFunctions/Shared/Tables.lua')
Ext.Require('AuxFunctions/Shared/Files.lua')
Ext.Require('AuxFunctions/Shared/Debug.lua')

--  SPECIAL PURPOSE
--  ===============

Ext.Require('AuxFunctions/Shared/Centralize.lua')
Ext.Require('AuxFunctions/Shared/Networker.lua')
Ext.Require('AuxFunctions/Shared/ConsoleCommander.lua')
Ext.Require('AuxFunctions/Shared/Memoizer.lua')

--      SERVER-SPECIFIC
--      ---------------

if Ext.IsServer() then
    Ext.Require('AuxFunctions/Server/Networker.lua')
    Ext.Require('AuxFunctions/Server/FlagsManager.lua')
    Ext.Require('AuxFunctions/Server/DialogManager.lua')
    -- Ext.Require('AuxFunctions/Server/DynamicDialog.lua') --  ⚠ Work-in-Progress
end

--      CLIENT-SPECIFIC
--      ---------------

if Ext.IsClient() then
    Ext.Require('AuxFunctions/Client/Networker.lua')
end

--  LATE LOADER
--  ===========

Ext.Require('AuxFunctions/Shared/Versioning.lua')