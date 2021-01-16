--  ===================
--  AUXILIARY FUNCTIONS
--  ===================

--  FUNDAMENTAL
--  ===========

Ext.Require('Functions/Shared/General.lua')
Ext.Require('Functions/Shared/Strings.lua')
Ext.Require('Functions/Shared/Tables.lua')
Ext.Require('Functions/Shared/Files.lua')
Ext.Require('Functions/Shared/Debug.lua')

--  DERIVED
--  =======

Ext.Require('Functions/Shared/Centralize.lua')
Ext.Require('Functions/Shared/Networker.lua')
Ext.Require('Functions/Shared/ConsoleCommander.lua')

--  SERVER-SPECIFIC
--  ---------------

if Ext.IsServer() then
    Ext.Require('Functions/Server/DialogManager.lua')
end

--  CLIENT-SPECIFIC
--  ---------------

if Ext.IsClient() then

end

--  LATE LOADER
--  ===========

Ext.Require('Functions/Shared/Versioning.lua')