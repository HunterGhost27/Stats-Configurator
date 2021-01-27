--  ============
--  CONTEXT MENU
--  ============

Ext.RegisterListener('SessionLoaded', function()
    UCL = Mods['S7_UI_Components_Library'] -- Import UI Components Library
    local GUID = ExtractGUID(Inspector)
    UCL.ContextMenu:Register({
        ["RootTemplate::" .. GUID] = {
            {
                ['actionID'] = 27701,
                ['clickSound'] = true,
                ['text'] = Color:Blue("Apply Configurations"),
                ['isDisabled'] = false,
                ['isLegal'] = true
            }
        }
    })
end)