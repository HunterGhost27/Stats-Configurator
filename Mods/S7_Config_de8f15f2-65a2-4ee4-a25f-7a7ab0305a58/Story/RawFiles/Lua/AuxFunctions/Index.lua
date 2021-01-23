--  ===================
--  AUXILIARY FUNCTIONS
--  ===================

--  FUNDAMENTAL
--  ===========

Ext.Require('AuxFunctions/Shared/General.lua')
Ext.Require('AuxFunctions/Shared/Strings.lua')
Ext.Require('AuxFunctions/Shared/Tables.lua')
Ext.Require('AuxFunctions/Shared/Yamlifier.lua')
Ext.Require('AuxFunctions/Shared/Files.lua')
Ext.Require('AuxFunctions/Shared/Debug.lua')

--  DERIVED
--  =======

Ext.Require('AuxFunctions/Shared/Centralize.lua')
Ext.Require('AuxFunctions/Shared/Networker.lua')
Ext.Require('AuxFunctions/Shared/ConsoleCommander.lua')

--  SERVER-SPECIFIC
--  ---------------

if Ext.IsServer() then
    Ext.Require('AuxFunctions/Server/DialogManager.lua')
    Ext.Require('AuxFunctions/Server/FlagsManager.lua')
end

--  CLIENT-SPECIFIC
--  ---------------

if Ext.IsClient() then

end

--  LATE LOADER
--  ===========

Ext.Require('AuxFunctions/Shared/Versioning.lua')