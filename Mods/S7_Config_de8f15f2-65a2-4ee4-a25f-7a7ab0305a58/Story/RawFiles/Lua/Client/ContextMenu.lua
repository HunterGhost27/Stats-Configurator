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
            }
        }
    })
end)