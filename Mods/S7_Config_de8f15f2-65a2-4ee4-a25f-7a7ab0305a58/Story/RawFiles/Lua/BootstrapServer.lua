--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")
Ext.Require("Server/DialogMenus/DialogVars.lua")
Ext.Require("Server/DialogMenus/ModMenu.lua")
Ext.Require("Server/DialogMenus/ModInterface.lua")
Ext.Require("Server/Networking.lua")
Ext.Require("Shared/Collections.lua")
Ext.Require("Shared/StatsConfigurator.lua")

if Ext.IsDeveloperMode() then Ext.Require("Server/ConsoleCommander.lua") end

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