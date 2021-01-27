--  =======
--  IMPORTS
--  =======

Ext.Require('Auxiliary.lua')
Ext.Require('Server/ModMenu.lua')
Ext.Require('Server/InspectSkill.lua')
Ext.Require('Server/Networking.lua')
Ext.Require('Shared/Collections.lua')
Ext.Require('Shared/References.lua')
Ext.Require('Server/ConsoleCommands.lua')
Ext.Require('Shared/StatsConfigurator.lua')

--  UI-COMPONENTS-LIBRARY INTEGRATION
--  =================================

if Ext.IsModLoaded('b66d56c6-12f9-4abc-844f-0c30b89d32e4') then
    Ext.Require('Server/ContextMenu.lua')
end

--  ==========
--  GAME START
--  ==========

Ext.RegisterOsirisListener('GameStarted', 2, 'after', function (level, gameMode)
    if not IsValid(Osi.IsGameLevel(level)) then return end

    RefreshSettings()
    Collections:Rebuild()

    local hostCharacter = Osi.CharacterGetHostCharacter()
    if Osi.ItemTemplateIsInPartyInventory(hostCharacter, Inspector, 1) < 1 then
        Osi.ItemTemplateAddTo(Inspector, hostCharacter, 1)
    end
end)