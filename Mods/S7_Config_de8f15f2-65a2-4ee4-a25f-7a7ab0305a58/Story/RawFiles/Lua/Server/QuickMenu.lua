DynamicDialog = {}
DynamicDialog.Dialog = Dialog:New({['Name'] = 'S7_Config_QuickMenu'})
DynamicDialog.State = {}

function DynamicDialog.VarsRefresh()
    DynamicDialog.State = Integrate(DynamicDialog.State, {
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

DynamicDialog.VarsRefresh() --  quickMenuVars initialization.

--  ###################
--      STAGED LIST
--  ###################

function BuildStagedList() --  Builds the list of options for the current session, level and page.
    DynamicDialog.State.stageList = {} --  reinitialize stageList.

    --  FILTER MOD-INTERFACE DATABASE
    --  =============================

    if DynamicDialog.State.level == 1 then DynamicDialog.State.database = ModInterface[DynamicDialog.State.modName]
    elseif DynamicDialog.State.level == 2 then DynamicDialog.State.database = ModInterface[DynamicDialog.State.modName][DynamicDialog.State.selectedStat]
    elseif DynamicDialog.State.level == 3 then
        if DynamicDialog.State.selectedAttributeType == "Integer" then
            DynamicDialog.State.database = {
                --  if level 3, use the following manual stage entries.
                ["Increase"] = 1,
                ["Decrease"] = 2,
                ["Set"] = 3,
                ["Confirm"] = 4,
                ["Clear"] = 5
            }
        elseif DynamicDialog.State.selectedAttributeType == "Enumeration" then
            DynamicDialog.State.database = {
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

    DynamicDialog.State.stageList = ExtractKeys(DynamicDialog.State.database) or {}

    --  DETERMINE MAXIMUM NUMBER OF PAGES
    --  =================================

    -- local count = 0 --  counts the total number of entries in the stage list.
    -- for pos, entry in ipairs(QuickMenu.Vars.stageList) do
    --     count = count + 1
    -- end

    local count = #DynamicDialog.State.stageList
    DynamicDialog.State.maxPage = math.floor((count - 1) / 5) + 1
    --  determines the maximum number of pages for the current level. Each page has 5 entries.
end

--  ####################################################################################################################################################

--  #######################
--      DYNAMIC ACTIONS
--  #######################

function DynamicAction(option, switch)
    BuildStagedList()
    local pos = (DynamicDialog.State.page - 1) * 5 + option --  Retrieve absolute position of entry.

    if DynamicDialog.State.level == 1 then
        DynamicDialog.State.selectedStat = DynamicDialog.State.stageList[pos]
        if not DynamicDialog.State.configData[DynamicDialog.State.selectedStat] then DynamicDialog.State.configData[DynamicDialog.State.selectedStat] = {} end
    elseif DynamicDialog.State.level == 2 then
        DynamicDialog.State.selectedAttribute = DynamicDialog.State.stageList[pos]
        GetAttributeEnumType()
        DynamicDialog.State.defaultVal = Ext.StatGetAttribute(DynamicDialog.State.selectedStat, DynamicDialog.State.selectedAttribute) --  get the current value for the attribute
        DynamicDialog.State.configData[DynamicDialog.State.selectedStat][DynamicDialog.State.selectedAttribute] = DynamicDialog.State.defaultVal -- initialize table with defaultValue
        DynamicDialog.State.selectedVal = DynamicDialog.State.selectedVal or DynamicDialog.State.defaultVal
    elseif DynamicDialog.State.level == 3 then
        GetAttributeEnumType()
        DynamicDialog.State.selectedAction = DynamicDialog.State.stageList[pos]
        DynamicDialog.State.selectedVal = DynamicDialog.State.selectedVal or DynamicDialog.State.defaultVal
    end

    if DynamicDialog.State.selectedAction == "Increase" or DynamicDialog.State.selectedAction == "Next" then
        if DynamicDialog.State.selectedAttributeType == "Integer" then DynamicDialog.State.selectedVal = DynamicDialog.State.selectedVal + 1
        else
            local enumIndex = EnumTransformer("Label2Index", DynamicDialog.State.selectedAttributeEnumType, DynamicDialog.State.selectedVal)
            DynamicDialog.State.selectedVal = EnumTransformer("Index2Label", DynamicDialog.State.selectedAttributeEnumType, enumIndex + 1)
        end
    elseif DynamicDialog.State.selectedAction == "Decrease" or DynamicDialog.State.selectedAction == "Previous" then
        if DynamicDialog.State.selectedAttributeType == "Integer" then DynamicDialog.State.selectedVal = DynamicDialog.State.selectedVal - 1
        else
            local enumIndex = EnumTransformer("Label2Index", DynamicDialog.State.selectedAttributeEnumType, DynamicDialog.State.selectedVal)
            DynamicDialog.State.selectedVal = EnumTransformer("Index2Label", DynamicDialog.State.selectedAttributeEnumType, enumIndex - 1)
        end
    elseif DynamicDialog.State.selectedAction == "Set" then
        DynamicDialog.State.configData[DynamicDialog.State.selectedStat][DynamicDialog.State.selectedAttribute] = DynamicDialog.State.selectedVal
    elseif DynamicDialog.State.selectedAction == "Confirm" then
        table.insert(Configurations, {[DynamicDialog.State.modName] = Ext.JsonStringify(DynamicDialog.State.configData)})
        StatsConfigurator()
        StatsSynchronize()
        Configurations = {}
        BuildConfigData(Ext.JsonStringify(DynamicDialog.State.configData), DynamicDialog.State.modUUID, DynamicDialog.State.modName)
    elseif DynamicDialog.State.selectedAction == "Clear" then
        DynamicDialog.State.selectedVal = DynamicDialog.State.defaultVal
    end
end

function GetAttributeEnumType()
    local Ref = Rematerialize(References.StatObjectDefinitions[HandleStatType(DynamicDialog.State.selectedStat)])
    for _, content in pairs(Ref) do
        if content["@name"] == DynamicDialog.State.selectedAttribute then
            DynamicDialog.State.selectedAttributeType = content["@type"]
            if content["@type"] == "Enumeration" then
                DynamicDialog.State.selectedAttributeEnumType = content["@enumeration_type_name"]
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

        for pos, entry in ipairs(DynamicDialog.State.stageList) do --  Iterate over stageList.
            --  MAP POS (ABSOLUTE POSITION) TO RELPOS (RELATIVE POSITION)
            --  =========================================================
            if (pos < (1 + 5 * DynamicDialog.State.page)) and (pos > (5 * (DynamicDialog.State.page - 1))) then
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

    local modInfo = Ext.GetModInfo(DynamicDialog.State.modUUID)
    local displayMessage =
        "Configuring stats for: " ..
        tostring(modInfo.Name) ..
            " by " ..
                tostring(modInfo.Author) ..
                    " | Current Page: " ..
                        "(" .. tostring(DynamicDialog.State.page) .. "/" .. tostring(DynamicDialog.State.maxPage) .. ")\n"

    if DynamicDialog.State.level > 1 and ValidString(DynamicDialog.State.selectedStat) then
        displayMessage = displayMessage .. "Selected Stat: " .. tostring(DynamicDialog.State.selectedStat) .. "\n"
    end
    if DynamicDialog.State.level > 2 and ValidString(DynamicDialog.State.selectedAttribute) then
        displayMessage = displayMessage .. "Selected Attribute: " .. tostring(DynamicDialog.State.selectedAttribute) .. "\n"
    end
    if DynamicDialog.State.level == 3 then
        if DynamicDialog.State.selectedVal == nil then
            DynamicDialog.State.selectedVal = DynamicDialog.State.defaultVal
        end
        displayMessage =
            displayMessage ..
            "Selected Value: " ..
                tostring(DynamicDialog.State.selectedVal) ..
                    " (Current Value: " .. tostring(DynamicDialog.State.defaultVal) .. ")\n"
    end

    if DynamicDialog.State.selectedAction == "Set" then
        displayMessage = displayMessage .. "Value Set."
    elseif DynamicDialog.State.selectedAction == "Confirm" then
        displayMessage = displayMessage .. "Confirmed."
    elseif DynamicDialog.State.selectedAction == "Clear" then
        displayMessage = displayMessage .. "Selected Value Reset."
    end

    Osi.DialogSetVariableFixedString(
        "S7_Config_QuickMenu",
        "S7_Config_DynamicQuickMenu_179ad34b-afc2-4d52-9c0d-3a925e8ee4f2",
        displayMessage
    )
end

--  ####################################################################################################################################################

