--  =======
--  IMPORTS
--  =======

Ext.Require("Auxiliary.lua")
Ext.Require("Server/ModMenu.lua")
Ext.Require("Server/InspectSkill.lua")
Ext.Require("Server/Networking.lua")
Ext.Require("Shared/Collections.lua")
Ext.Require("Shared/References.lua")
Ext.Require("Server/ConsoleCommands.lua")
Ext.Require("Shared/StatsConfigurator.lua")

--  ==========
--  GAME START
--  ==========

Ext.RegisterOsirisListener("GameStarted", 2, "after", function (level, gameMode)
    if not Osi.IsGameLevel(level) then return end

    RefreshSettings()
    Collections:Rebuild()

    local hostCharacter = Osi.CharacterGetHostCharacter()
    if Osi.ItemTemplateIsInPartyInventory(hostCharacter, Inspector, 1) < 1 then
        Osi.ItemTemplateAddTo(Inspector, hostCharacter, 1)
    end
end)