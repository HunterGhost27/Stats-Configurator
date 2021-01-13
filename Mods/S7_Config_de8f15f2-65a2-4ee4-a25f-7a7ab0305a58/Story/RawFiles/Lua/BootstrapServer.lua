--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")
Ext.Require("Auxiliary/PlayerInfo.lua")
Ext.Require("DialogMenus/DialogVars.lua")
Ext.Require("DialogMenus/ModMenu.lua")
Ext.Require("DialogMenus/ModInterface.lua")
Ext.Require("Networking/Server.lua")
Ext.Require("Configurator/Collections.lua")
Ext.Require("StatsConfigurator.lua")

if Ext.IsDeveloperMode() then
    Ext.Require("Development/ConsoleCommander.lua")
    Ext.Require("Development/DevMode.lua")
end

--  ==========
--  GAME START
--  ==========

Ext.RegisterOsirisListener("GameStarted", 2, "after", function (level, gameMode)
    if not Osi.IsGameLevel(level) then return end

    Osi.GlobalSetFlag("S7_RefreshSettings")
    Osi.GlobalSetFlag("S7_RebuildCollections")

    local hostCharacter = Osi.CharacterGetHostCharacter()
    if not Osi.ItemTemplateIsInPartyInventory(hostCharacter, TEMPLATE.Inspector, 1, 1) then
        Osi.ItemTemplateAddTo(TEMPLATE.Inspector, hostCharacter, 1)
    end
end)