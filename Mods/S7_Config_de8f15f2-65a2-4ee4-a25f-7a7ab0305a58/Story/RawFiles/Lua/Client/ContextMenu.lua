--  ============
--  CONTEXT-MENU
--  ============

UCL = Mods['S7_UI_Components_Library'] -- Import UI Components Library

--  ============
--  CONTEXT MENU
--  ============

local GUID = ExtractGUID(Inspector)

if UCL.ContextMenu then
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
end