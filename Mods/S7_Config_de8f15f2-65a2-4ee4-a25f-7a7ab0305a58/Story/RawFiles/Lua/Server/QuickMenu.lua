QuickMenu = {}
QuickMenu.Dialog = Dialog:New({['Name'] = 'S7_Config_QuickMenu'})
QuickMenu.Vars = {}

function QuickMenu.VarsRefresh()
    QuickMenu.Vars = Integrate(QuickMenu.Vars, {
        --  Global Table to hold data relevant to the current QuickMenu session.
        ["level"] = 1, --  level indicates how far the user is along the dialog session. level 1 - statIDs, level 2 - attributes, level 3 - action.
        ["modName"] = "", --  name of the mod set in DB_S7_Config_ModRegistry() by the mod author. Used to match entries in DB_S7_Config_ModInterface().
        ["modUUID"] = "", --  UUID of the mod corresponding to the modName. Used to fetch information like Mod's Name and Author.
        ["database"] = {}, --  fetched data from DB_S7_Config_ModInterface(). Used to build stageList.
        ["stageList"] = {}, --  holds dialogVar data for the current session, level and page.
        ["page"] = 1, --  page number for the current level. (If a level has more than 5 entries, they are split into multiple pages.)
        ["maxPage"] = 1, --  The total number of pages for the current level. (If the level has more than 5 entries.)
        ["selectedStat"] = "", --  stat selected for modification.
        ["selectedAttribute"] = "", --  attribute selected for modification.
        ["selectedAttributeType"] = "", --  attributeType selected for modification.
        ["selectedAttributeEnumType"] = "", --  Corresponding enumeration type.
        ["selectedAction"] = "", --  selected action.
        ["selectedVal"] = nil, --  selected Value for modification.
        ["defaultVal"] = nil, -- current Value for the selected attribute.
        ["configData"] = {}, -- Table temporarily holds the user's configuration during the session.
        ["inDialog"] = false --  boolean. true if host-character is currently in dialog.
    })
end

QuickMenu.VarsRefresh() --  quickMenuVars initialization.

QuickMenuRelay = {
    ['S7_Notebook'] = function ()
        Ext.Print('Success')
    end,
    ['S7_Config_GoBack'] = function ()
        if QuickMenu.Vars.level > 1 then
            QuickMenu.Vars.level = QuickMenu.Vars.level - 1
            QuickMenu.Vars.page = 1 --  Resets page index to 1.
            QuickMenu.Vars.selectedAction = nil
        end
    end,

    ['S7_Config_SetOpt1'] = DynamicAction(1, 'S7_Config_SetOpt1'),
    ['S7_Config_SetOpt2'] = DynamicAction(2, 'S7_Config_SetOpt2'),
    ['S7_Config_SetOpt3'] = DynamicAction(3, 'S7_Config_SetOpt3'),
    ['S7_Config_SetOpt4'] = DynamicAction(4, 'S7_Config_SetOpt4'),
    ['S7_Config_SetOpt5'] = DynamicAction(5, 'S7_Config_SetOpt5'),

    ['S7_Config_NextPage'] = function ()
        if QuickMenu.Vars.page < QuickMenu.Vars.maxPage then
            QuickMenu.Vars.page = QuickMenu.Vars.page + 1
        end
    end,
    ['S7_Config_PrevPage'] = function ()
        if QuickMenu.Vars.page > 1 then
            QuickMenu.Vars.page = QuickMenu.Vars.page - 1
        end
    end,
    ['S7_Config_ExitCleanUp'] = function ()
        Debug:Print(QuickMenu.Vars.modName .. " dialog ends.")
        QuickMenu.VarsRefresh() --  Resets quickMenuVars.
    end,
    ['S7_Config_MoveToNextLevel'] = function ()
        if QuickMenu.Vars.level < 3 then
            QuickMenu.Vars.level = QuickMenu.Vars.level + 1
            QuickMenu.Vars.page = 1 --  Resets page index to 1.
        end
    end,
}


Ext.RegisterOsirisListener('CharacterUsedSkill', 6, 'after', function ()
    Ext.Print('SuCEESS')
    Osi.GlobalSetFlag('S7_Notebook')
end)

Ext.RegisterOsirisListener("GlobalFlagSet", 1, "after", function (signal)
    Debug:HFPrint('SUCCESS')
    if not QuickMenuRelay[signal] then return end

    if not QuickMenu.Vars.inDialog then --  if there is no dialog session active.
        --  =====================
        --  DIALOG NOT IN SESSION
        --  =====================

        --  READ MOD-REGISTRY
        --  -----------------

        local modUUID = Pinpoint('S7_Notebook', ModRegistry)
        Ext.Print(modUUID)
        QuickMenu.Vars.level = 1 --  Set session level to 1. (start dialog session)
        QuickMenu.Vars.modName = ModRegistry[modUUID][1] --  set modName
        QuickMenu.Vars.modUUID = ModRegistry[modUUID][2] --  set modUUID

        --  LOAD PRE-EXISTING CONFIGURATION
        --  -------------------------------
        local configFile = LoadFile(MODINFO.SubdirPrefix .. Settings.StatsLoader.FileName) or {}
        for modName, content in pairs(configFile) do
            if modName == QuickMenu.Vars.modName then --  if configuration already exists.
                QuickMenu.Vars.configData = Ext.JsonParse(content) --  Pre-load configData with existing configuration.
            end
        end

        --  START DIALOG
        --  ------------

        Debug:Print("Start " .. QuickMenu.Vars.modName .. "'s Dynamic Quick-Configuration Dialog.")
        QuickMenu.Dialog:Start()
        QuickMenu.Vars.inDialog = true --  Dynamic Quick-Menu dialog now in session.
    end

    UserInformation:ReSync()
    QuickMenuRelay[signal]()
    QuickMenu.Dialog:Set()
    if signal ~= "S7_Config_ExitCleanUp" then --  Prevents update when player has quit the dialog session.
        UpdateDynamicMenu() --  Updates Dynamic Quick-Menu.
    end
    Osi.GlobalClearFlag(signal)
end)


--  ###################
--      STAGED LIST
--  ###################

function BuildStagedList() --  Builds the list of options for the current session, level and page.
    QuickMenu.Vars.stageList = {} --  reinitialize stageList.

    --  FILTER MOD-INTERFACE DATABASE
    --  =============================

    if QuickMenu.Vars.level == 1 then QuickMenu.Vars.database = ModInterface[QuickMenu.Vars.modName]
    elseif QuickMenu.Vars.level == 2 then QuickMenu.Vars.database = ModInterface[QuickMenu.Vars.modName][QuickMenu.Vars.selectedStat]
    elseif QuickMenu.Vars.level == 3 then
        if QuickMenu.Vars.selectedAttributeType == "Integer" then
            QuickMenu.Vars.database = {
                --  if level 3, use the following manual stage entries.
                ["Increase"] = 1,
                ["Decrease"] = 2,
                ["Set"] = 3,
                ["Confirm"] = 4,
                ["Clear"] = 5
            }
        elseif QuickMenu.Vars.selectedAttributeType == "Enumeration" then
            QuickMenu.Vars.database = {
                --  if level 3, use the following manual stage entries.
                ["Next"] = 1,
                ["Previous"] = 2,
                ["Set"] = 3,
                ["Confirm"] = 4,
                ["Clear"] = 5
            }
        end
    end

    -- --  FILTER UNIQUE ENTRIES AND BUILD STAGE LIST
    -- --  ==========================================

    -- local pos = 1 --  Marks the position of the entry in the current stage. Sequential Order.
    -- local tempList = {} --  temporary list to filter unique entries.

    -- for i, entry in ipairs(QuickMenu.Vars.database) do
    --     if QuickMenu.Vars.level == 1 then
    --         if tempList[entry[2]] == nil then --  if entry does not already exist.
    --             tempList[entry[2]] = pos --  create entry at position pos.
    --             pos = pos + 1 --  increase position index by 1.
    --         end
    --     elseif QuickMenu.Vars.level == 2 then
    --         if tempList[entry[3]] == nil then --   if entry does not already exist.
    --             if Ext.StatGetAttribute(QuickMenu.Vars.selectedStat, entry[3]) ~= nil then
    --                 tempList[entry[3]] = pos --  create entry at position pos.
    --                 pos = pos + 1 --  increase position index by 1.
    --             end
    --         end
    --     elseif QuickMenu.Vars.level == 3 then
    --         if QuickMenu.Vars.selectedAttributeType == "Integer" then
    --             tempList = {
    --                 --  if level 3, use the following manual stage entries.
    --                 ["Increase"] = 1,
    --                 ["Decrease"] = 2,
    --                 ["Set"] = 3,
    --                 ["Confirm"] = 4,
    --                 ["Clear"] = 5
    --             }
    --         elseif QuickMenu.Vars.selectedAttributeType == "Enumeration" then
    --             tempList = {
    --                 --  if level 3, use the following manual stage entries.
    --                 ["Next"] = 1,
    --                 ["Previous"] = 2,
    --                 ["Set"] = 3,
    --                 ["Confirm"] = 4,
    --                 ["Clear"] = 5
    --             }
    --         end
    --     end
    -- end

    
    -- --  Interchange entry and pos
    -- for entry, pos in pairs(tempList) do
    --     QuickMenu.Vars.stageList[pos] = entry
    -- end

    QuickMenu.Vars.stageList = ExtractKeys(QuickMenu.Vars.database) or {}

    --  DETERMINE MAXIMUM NUMBER OF PAGES
    --  =================================

    -- local count = 0 --  counts the total number of entries in the stage list.
    -- for pos, entry in ipairs(QuickMenu.Vars.stageList) do
    --     count = count + 1
    -- end

    local count = #QuickMenu.Vars.stageList
    QuickMenu.Vars.maxPage = math.floor((count - 1) / 5) + 1
    --  determines the maximum number of pages for the current level. Each page has 5 entries.
end

--  ####################################################################################################################################################

--  #######################
--      DYNAMIC ACTIONS
--  #######################

function DynamicAction(option, switch)
    BuildStagedList()
    local pos = (QuickMenu.Vars.page - 1) * 5 + option --  Retrieve absolute position of entry.

    if QuickMenu.Vars.level == 1 then
        QuickMenu.Vars.selectedStat = QuickMenu.Vars.stageList[pos]
        if not QuickMenu.Vars.configData[QuickMenu.Vars.selectedStat] then QuickMenu.Vars.configData[QuickMenu.Vars.selectedStat] = {} end
    elseif QuickMenu.Vars.level == 2 then
        QuickMenu.Vars.selectedAttribute = QuickMenu.Vars.stageList[pos]
        GetAttributeEnumType()
        QuickMenu.Vars.defaultVal = Ext.StatGetAttribute(QuickMenu.Vars.selectedStat, QuickMenu.Vars.selectedAttribute) --  get the current value for the attribute
        QuickMenu.Vars.configData[QuickMenu.Vars.selectedStat][QuickMenu.Vars.selectedAttribute] = QuickMenu.Vars.defaultVal -- initialize table with defaultValue
        QuickMenu.Vars.selectedVal = QuickMenu.Vars.selectedVal or QuickMenu.Vars.defaultVal
    elseif QuickMenu.Vars.level == 3 then
        GetAttributeEnumType()
        QuickMenu.Vars.selectedAction = QuickMenu.Vars.stageList[pos]
        QuickMenu.Vars.selectedVal = QuickMenu.Vars.selectedVal or QuickMenu.Vars.defaultVal
    end

    if QuickMenu.Vars.selectedAction == "Increase" or QuickMenu.Vars.selectedAction == "Next" then
        if QuickMenu.Vars.selectedAttributeType == "Integer" then QuickMenu.Vars.selectedVal = QuickMenu.Vars.selectedVal + 1
        else
            local enumIndex = EnumTransformer("Label2Index", QuickMenu.Vars.selectedAttributeEnumType, QuickMenu.Vars.selectedVal)
            QuickMenu.Vars.selectedVal = EnumTransformer("Index2Label", QuickMenu.Vars.selectedAttributeEnumType, enumIndex + 1)
        end
    elseif QuickMenu.Vars.selectedAction == "Decrease" or QuickMenu.Vars.selectedAction == "Previous" then
        if QuickMenu.Vars.selectedAttributeType == "Integer" then QuickMenu.Vars.selectedVal = QuickMenu.Vars.selectedVal - 1
        else
            local enumIndex = EnumTransformer("Label2Index", QuickMenu.Vars.selectedAttributeEnumType, QuickMenu.Vars.selectedVal)
            QuickMenu.Vars.selectedVal = EnumTransformer("Index2Label", QuickMenu.Vars.selectedAttributeEnumType, enumIndex - 1)
        end
    elseif QuickMenu.Vars.selectedAction == "Set" then
        QuickMenu.Vars.configData[QuickMenu.Vars.selectedStat][QuickMenu.Vars.selectedAttribute] = QuickMenu.Vars.selectedVal
    elseif QuickMenu.Vars.selectedAction == "Confirm" then
        table.insert(Configurations, {[QuickMenu.Vars.modName] = Ext.JsonStringify(QuickMenu.Vars.configData)})
        StatsConfigurator()
        StatsSynchronize()
        Configurations = {}
        BuildConfigData(Ext.JsonStringify(QuickMenu.Vars.configData), QuickMenu.Vars.modUUID, QuickMenu.Vars.modName)
    elseif QuickMenu.Vars.selectedAction == "Clear" then
        QuickMenu.Vars.selectedVal = QuickMenu.Vars.defaultVal
    end
end

function GetAttributeEnumType()
    local Ref = Rematerialize(References.StatObjectDefinitions[HandleStatType(QuickMenu.Vars.selectedStat)])
    for _, content in pairs(Ref) do
        if content["@name"] == QuickMenu.Vars.selectedAttribute then
            QuickMenu.Vars.selectedAttributeType = content["@type"]
            if content["@type"] == "Enumeration" then
                QuickMenu.Vars.selectedAttributeEnumType = content["@enumeration_type_name"]
            end
            break
        end
    end
end

--  ####################################################################################################################################################

--  ###########################
--      UPDATE DYNAMIC MENU
--  ###########################

function UpdateDynamicMenu()
    BuildStagedList()

    --  PAGE CONTROL OPTIONS VISIBILITY
    --  ===============================

    if QuickMenu.Vars.page == 1 and QuickMenu.Vars.page ~= QuickMenu.Vars.maxPage then
        Osi.GlobalClearFlag("S7_Config_PrevPageAvailable")
        Osi.GlobalSetFlag("S7_Config_NextPageAvailable")
    elseif QuickMenu.Vars.page ~= 1 and QuickMenu.Vars.page == QuickMenu.Vars.maxPage then
        Osi.GlobalClearFlag("S7_Config_NextPageAvailable")
        Osi.GlobalSetFlag("S7_Config_PrevPageAvailable")
    elseif QuickMenu.Vars.page == 1 and QuickMenu.Vars.page == QuickMenu.Vars.maxPage then
        Osi.GlobalClearFlag("S7_Config_NextPageAvailable")
        Osi.GlobalClearFlag("S7_Config_PrevPageAvailable")
    else
        Osi.GlobalSetFlag("S7_Config_NextPageAvailable")
        Osi.GlobalSetFlag("S7_Config_PrevPageAvailable")
    end

    --  BUILD DIALOG OPTIONS FROM STAGELIST
    --  ===================================

    local quickMenuDialogCase = {
        "S7_Config_Opt1_8523d721-fae5-4f64-81ee-749130f1c4eb",
        "S7_Config_Opt2_aa949336-d705-4a20-b8ff-564b381583f6",
        "S7_Config_Opt3_1c4f9b5f-907c-4b2f-b5bc-dd4f443dbf08",
        "S7_Config_Opt4_d07ece22-c225-4d76-b6e3-e94498ade0ba",
        "S7_Config_Opt5_19d98a3a-b117-4df4-b95d-9f937568ee35"
    }

    for i, case in ipairs(quickMenuDialogCase) do --  Iterate for all options.
        Osi.GlobalClearFlag("S7_Config_AvailableOpt" .. i) --   Clear availability of all options.

        for pos, entry in ipairs(QuickMenu.Vars.stageList) do --  Iterate over stageList.
            --  MAP POS (ABSOLUTE POSITION) TO RELPOS (RELATIVE POSITION)
            --  =========================================================
            if (pos < (1 + 5 * QuickMenu.Vars.page)) and (pos > (5 * (QuickMenu.Vars.page - 1))) then
                local relPos = pos % 5
                if relPos == 0 then
                    relPos = 5
                end

                --  SET DIALOG-VARS
                --  ===============
                if i == relPos then --  if relPos entry exists.
                    Osi.DialogSetVariableFixedString("S7_Config_QuickMenu", case, entry) --  Set dialog variable.
                    Osi.GlobalSetFlag("S7_Config_AvailableOpt" .. i) --  Make that option available.
                end
            end
        end
    end

    --  BUILD DISPLAY MESSAGE
    --  =====================

    local modInfo = Ext.GetModInfo(QuickMenu.Vars.modUUID)
    local displayMessage =
        "Configuring stats for: " ..
        tostring(modInfo.Name) ..
            " by " ..
                tostring(modInfo.Author) ..
                    " | Current Page: " ..
                        "(" .. tostring(QuickMenu.Vars.page) .. "/" .. tostring(QuickMenu.Vars.maxPage) .. ")\n"

    if QuickMenu.Vars.level > 1 and ValidString(QuickMenu.Vars.selectedStat) then
        displayMessage = displayMessage .. "Selected Stat: " .. tostring(QuickMenu.Vars.selectedStat) .. "\n"
    end
    if QuickMenu.Vars.level > 2 and ValidString(QuickMenu.Vars.selectedAttribute) then
        displayMessage = displayMessage .. "Selected Attribute: " .. tostring(QuickMenu.Vars.selectedAttribute) .. "\n"
    end
    if QuickMenu.Vars.level == 3 then
        if QuickMenu.Vars.selectedVal == nil then
            QuickMenu.Vars.selectedVal = QuickMenu.Vars.defaultVal
        end
        displayMessage =
            displayMessage ..
            "Selected Value: " ..
                tostring(QuickMenu.Vars.selectedVal) ..
                    " (Current Value: " .. tostring(QuickMenu.Vars.defaultVal) .. ")\n"
    end

    if QuickMenu.Vars.selectedAction == "Set" then
        displayMessage = displayMessage .. "Value Set."
    elseif QuickMenu.Vars.selectedAction == "Confirm" then
        displayMessage = displayMessage .. "Confirmed."
    elseif QuickMenu.Vars.selectedAction == "Clear" then
        displayMessage = displayMessage .. "Selected Value Reset."
    end

    Osi.DialogSetVariableFixedString(
        "S7_Config_QuickMenu",
        "S7_Config_DynamicQuickMenu_179ad34b-afc2-4d52-9c0d-3a925e8ee4f2",
        displayMessage
    )
end

--  ####################################################################################################################################################

