--  ============
--  CONTEXT MENU
--  ============

Ext.RegisterListener('SessionLoaded', function()
    UCL = Mods['S7_UI_Components_Library']
    local GUID = ExtractGUID(Inspector)

    UCL.ContextMenu:Register({
        ["RootTemplate::" .. GUID] = {
            {
                ['actionID'] = 27701,
                ['clickSound'] = true,
                ['text'] = Color:Blue("Apply Configuration"),
                ['isDisabled'] = false,
                ['isLegal'] = true
            },
            {
                ['actionID'] = 27702,
                ['clickSound'] = true,
                ['text'] = Color:Blue("Mod Information"),
                ['isDisabled'] = false,
                ['isLegal'] = true
            }
        }
    })
end)

Ext.RegisterNetListener("S7UCL::ContextMenu", function (channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload)
    if payload.actionID == 27702 then
        local manual = LoadFile("Mods/S7_Config_de8f15f2-65a2-4ee4-a25f-7a7ab0305a58/ModInformation.md", "data")

        local replacers = {
            {["?ModVersion"] = Version:Parse(MODINFO.Version):String()},
            {["?ModAuthor"] = MODINFO.Author},
            {["?ModDescription"] = MODINFO.Description},
            -- {["?UniquesOption"] = tostring(PersistentVars.Settings.Uniques)},
            -- {["?StorageOption"] = tostring(PersistentVars.Settings.Storage)},
            -- {["?SyncOption"] = tostring(PersistentVars.Settings.SyncTo)}
        }

        local specs = UCL.Journalify(manual, replacers)
        specs = Integrate(specs, {["GMJournal"] = {
            ["Component"] = {["Name"] = "S7_ConfigCtxMenu"},
            ["SubComponent"] = {["ToggleEditButton"] = {["Visible"] = false}}
        }})
        UCL.Render(specs)
    end
end)