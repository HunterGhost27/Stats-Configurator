--  ============================
--  REFRESH QUICK-MENU VARIABLES
--  ============================

function RefreshQuickMenuVars() --  Resets quickMenuVars to initial (unset) conditions.
    QuickMenuVars = {
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
    }
    S7Debug:Print("Dynamic Quick-Menu Refreshed.")
end

RefreshQuickMenuVars() --  quickMenuVars initialization.

--  ####################################################################################################################################################

--  ########################
--      QUICK MENU RELAY
--  ########################

function S7_Config_QuickMenuRelay(signal) --  Recieves flag from Osiris (S7_Config_ModInterface.txt).
    if QuickMenuVars.inDialog ~= true then --  if there is no dialog session active.
        --  =====================
        --  DIALOG NOT IN SESSION
        --  =====================

        --  READ MOD-REGISTRY
        --  -----------------

        local modRegistry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, signal) --  fetch ModRegistry data corresponding to the signal.
        if modRegistry ~= nil then --  if ModRegistry exists.
            QuickMenuVars.level = 1 --  Set session level to 1. (start dialog session)
            QuickMenuVars.modName = modRegistry[1][1] --  set modName
            QuickMenuVars.modUUID = modRegistry[1][2] --  set modUUID

            --  LOAD PRE-EXISTING CONFIGURATION
            --  -------------------------------
            local configFile = Ext.LoadFile(SubdirectoryPrefix .. "S7_ConfigData.json") or ""
            if ValidString(configFile) then
                for modName, content in pairs(Ext.JsonParse(configFile)) do
                    if modName == QuickMenuVars.modName then --  if configuration already exists.
                        QuickMenuVars.configData = Ext.JsonParse(content) --  Pre-load configData with existing configuration.
                    end
                end
            end

            --  START DIALOG
            --  ------------

            S7Debug:Print("Start " .. QuickMenuVars.modName .. "'s Dynamic Quick-Configuration Dialog.")
            Osi.Proc_StartDialog(1, "S7_Config_QuickMenu", Osi.CharacterGetHostCharacter()) --  host-character starts dialog.
            QuickMenuVars.inDialog = true --  Dynamic Quick-Menu dialog now in session.
        end
    else --  Dynamic Quick-Menu in session.
        --  =================
        --  DIALOG IN SESSION
        --  =================

        --  DYNAMIC ACTIONS
        --  ---------------

        local optionSwitchCase = {
            --  Table of dynamic set-flags.
            "S7_Config_SetOpt1", -- Option 1
            "S7_Config_SetOpt2", -- Option 2
            "S7_Config_SetOpt3", -- Option 3
            "S7_Config_SetOpt4", -- Option 4
            "S7_Config_SetOpt5" -- Option 5
        }
        for option, switch in ipairs(optionSwitchCase) do
            if signal == switch then
                DynamicAction(option, switch) --  if signal matches any dynamic set-options then relay it(again!) to S7_DynamicAction()
            end
        end

        --  CHANGE LEVEL
        --  ------------

        if signal == "S7_Config_MoveToNextLevel" then --  moves to next level in the current dialog session.
            if QuickMenuVars.level < 3 then
                QuickMenuVars.level = QuickMenuVars.level + 1
                QuickMenuVars.page = 1 --  Resets page index to 1.
            end
        end

        if signal == "S7_Config_GoBack" then --  moves back one level in the current dialog session.
            if QuickMenuVars.level > 1 then
                QuickMenuVars.level = QuickMenuVars.level - 1
                QuickMenuVars.page = 1 --  Resets page index to 1.
                QuickMenuVars.selectedAction = nil
            end
        end

        --  CHANGE PAGE
        --  -----------

        if signal == "S7_Config_NextPage" then --  moves to the next page in the current level. Available if current level has more than 5 entries.
            if QuickMenuVars.page < QuickMenuVars.maxPage then
                QuickMenuVars.page = QuickMenuVars.page + 1
            end
        end

        if signal == "S7_Config_PrevPage" then --  moves back to the previous page in the current level.
            if QuickMenuVars.page > 1 then
                QuickMenuVars.page = QuickMenuVars.page - 1
            end
        end

        --  EXIT SESSION CLEANUP
        --  ====================

        if signal == "S7_Config_ExitCleanUp" then --  Called upon dialog exit. Cleans up quickMenuVars for the next session.
            S7Debug:Print(QuickMenuVars.modName .. " dialog ends.")
            RefreshQuickMenuVars() --  Resets quickMenuVars.
        end
    end

    --  UPDATE DYNAMIC MENU DIALOG
    --  ==========================

    if signal ~= "S7_Config_ExitCleanUp" then --  Prevents update when player has quit the dialog session.
        UpdateDynamicMenu() --  Updates Dynamic Quick-Menu.
    end
end

--  ================================================================================
Ext.NewCall(S7_Config_QuickMenuRelay, "S7_Config_QuickMenuRelay", "(STRING)_SIGNAL")
--  ================================================================================

--  ####################################################################################################################################################

--  ###################
--      STAGED LIST
--  ###################

function BuildStagedList() --  Builds the list of options for the current session, level and page.
    QuickMenuVars.stageList = {} --  reinitialize stageList.

    --  FILTER MOD-INTERFACE DATABASE
    --  =============================

    if QuickMenuVars.level == 1 then
        QuickMenuVars.database = Osi.DB_S7_Config_ModInterface:Get(QuickMenuVars.modName, nil, nil)
    elseif QuickMenuVars.level == 2 then
        QuickMenuVars.database =
            Osi.DB_S7_Config_ModInterface:Get(QuickMenuVars.modName, QuickMenuVars.selectedStat, nil)
    end

    --  FILTER UNIQUE ENTRIES AND BUILD STAGE LIST
    --  ==========================================

    local pos = 1 --  Marks the position of the entry in the current stage. Sequential Order.
    local tempList = {} --  temporary list to filter unique entries.

    for i, entry in ipairs(QuickMenuVars.database) do
        if QuickMenuVars.level == 1 then
            if tempList[entry[2]] == nil then --  if entry does not already exist.
                tempList[entry[2]] = pos --  create entry at position pos.
                pos = pos + 1 --  increase position index by 1.
            end
        elseif QuickMenuVars.level == 2 then
            if tempList[entry[3]] == nil then --   if entry does not already exist.
                if Ext.StatGetAttribute(QuickMenuVars.selectedStat, entry[3]) ~= nil then
                    tempList[entry[3]] = pos --  create entry at position pos.
                    pos = pos + 1 --  increase position index by 1.
                end
            end
        elseif QuickMenuVars.level == 3 then
            if QuickMenuVars.selectedAttributeType == "Integer" then
                tempList = {
                    --  if level 3, use the following manual stage entries.
                    ["Increase"] = 1,
                    ["Decrease"] = 2,
                    ["Set"] = 3,
                    ["Confirm"] = 4,
                    ["Clear"] = 5
                }
            elseif QuickMenuVars.selectedAttributeType == "Enumeration" then
                tempList = {
                    --  if level 3, use the following manual stage entries.
                    ["Next"] = 1,
                    ["Previous"] = 2,
                    ["Set"] = 3,
                    ["Confirm"] = 4,
                    ["Clear"] = 5
                }
            end
        end
    end
    --  Interchange entry and pos
    for entry, pos in pairs(tempList) do
        QuickMenuVars.stageList[pos] = entry
    end

    --  DETERMINE MAXIMUM NUMBER OF PAGES
    --  =================================

    local count = 0 --  counts the total number of entries in the stage list.
    for pos, entry in ipairs(QuickMenuVars.stageList) do
        count = count + 1
    end
    QuickMenuVars.maxPage = math.floor((count - 1) / 5) + 1
    --  determines the maximum number of pages for the current level. Each page has 5 entries.
end

--  ####################################################################################################################################################

--  #######################
--      DYNAMIC ACTIONS
--  #######################

function DynamicAction(option, switch)
    BuildStagedList()
    local pos = (QuickMenuVars.page - 1) * 5 + option --  Retrieve absolute position of entry.

    if QuickMenuVars.level == 1 then
        QuickMenuVars.selectedStat = QuickMenuVars.stageList[pos]
        --  Initialize selectedStat in configData if it doesn't already exist.
        if QuickMenuVars.configData[QuickMenuVars.selectedStat] == nil then
            QuickMenuVars.configData[QuickMenuVars.selectedStat] = {}
        end
    elseif QuickMenuVars.level == 2 then
        QuickMenuVars.selectedAttribute = QuickMenuVars.stageList[pos]
        GetAttributeEnumType()
        QuickMenuVars.defaultVal = Ext.StatGetAttribute(QuickMenuVars.selectedStat, QuickMenuVars.selectedAttribute) --  get the current value for the attribute
        QuickMenuVars.configData[QuickMenuVars.selectedStat][QuickMenuVars.selectedAttribute] = QuickMenuVars.defaultVal -- initialize table with defaultValue
        QuickMenuVars.selectedVal = QuickMenuVars.selectedVal or QuickMenuVars.defaultVal
    elseif QuickMenuVars.level == 3 then
        GetAttributeEnumType()
        QuickMenuVars.selectedAction = QuickMenuVars.stageList[pos]
        QuickMenuVars.selectedVal = QuickMenuVars.selectedVal or QuickMenuVars.defaultVal
    end

    if QuickMenuVars.selectedAction == "Increase" or QuickMenuVars.selectedAction == "Next" then
        if QuickMenuVars.selectedAttributeType == "Integer" then
            QuickMenuVars.selectedVal = QuickMenuVars.selectedVal + 1
        else
            local enumIndex =
                EnumTransformer("Label2Index", QuickMenuVars.selectedAttributeEnumType, QuickMenuVars.selectedVal)
            QuickMenuVars.selectedVal =
                EnumTransformer("Index2Label", QuickMenuVars.selectedAttributeEnumType, enumIndex + 1)
        end
    elseif QuickMenuVars.selectedAction == "Decrease" or QuickMenuVars.selectedAction == "Previous" then
        if QuickMenuVars.selectedAttributeType == "Integer" then
            QuickMenuVars.selectedVal = QuickMenuVars.selectedVal - 1
        else
            local enumIndex =
                EnumTransformer("Label2Index", QuickMenuVars.selectedAttributeEnumType, QuickMenuVars.selectedVal)
            QuickMenuVars.selectedVal =
                EnumTransformer("Index2Label", QuickMenuVars.selectedAttributeEnumType, enumIndex - 1)
        end
    elseif QuickMenuVars.selectedAction == "Set" then
        QuickMenuVars.configData[QuickMenuVars.selectedStat][QuickMenuVars.selectedAttribute] =
            QuickMenuVars.selectedVal
    elseif QuickMenuVars.selectedAction == "Confirm" then
        --  Call Stats Configurator
        table.insert(Configurations, {[QuickMenuVars.modName] = Ext.JsonStringify(QuickMenuVars.configData)})
        StatsConfigurator()
        StatsSynchronize()
        Configurations = {}
        BuildConfigData(Ext.JsonStringify(QuickMenuVars.configData), QuickMenuVars.modUUID, QuickMenuVars.modName)
    elseif QuickMenuVars.selectedAction == "Clear" then
        QuickMenuVars.selectedVal = QuickMenuVars.defaultVal
    end
end

function GetAttributeEnumType()
    local Ref = Rematerialize(References.StatObjectDefinitions[HandleStatType(QuickMenuVars.selectedStat)])
    for _, content in pairs(Ref) do
        if content["@name"] == QuickMenuVars.selectedAttribute then
            QuickMenuVars.selectedAttributeType = content["@type"]
            if content["@type"] == "Enumeration" then
                QuickMenuVars.selectedAttributeEnumType = content["@enumeration_type_name"]
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

    if QuickMenuVars.page == 1 and QuickMenuVars.page ~= QuickMenuVars.maxPage then
        Osi.GlobalClearFlag("S7_Config_PrevPageAvailable")
        Osi.GlobalSetFlag("S7_Config_NextPageAvailable")
    elseif QuickMenuVars.page ~= 1 and QuickMenuVars.page == QuickMenuVars.maxPage then
        Osi.GlobalClearFlag("S7_Config_NextPageAvailable")
        Osi.GlobalSetFlag("S7_Config_PrevPageAvailable")
    elseif QuickMenuVars.page == 1 and QuickMenuVars.page == QuickMenuVars.maxPage then
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

        for pos, entry in ipairs(QuickMenuVars.stageList) do --  Iterate over stageList.
            --  MAP POS (ABSOLUTE POSITION) TO RELPOS (RELATIVE POSITION)
            --  =========================================================
            if (pos < (1 + 5 * QuickMenuVars.page)) and (pos > (5 * (QuickMenuVars.page - 1))) then
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

    local modInfo = Ext.GetModInfo(QuickMenuVars.modUUID)
    local displayMessage =
        "Configuring stats for: " ..
        tostring(modInfo.Name) ..
            " by " ..
                tostring(modInfo.Author) ..
                    " | Current Page: " ..
                        "(" .. tostring(QuickMenuVars.page) .. "/" .. tostring(QuickMenuVars.maxPage) .. ")\n"

    if QuickMenuVars.level > 1 and ValidString(QuickMenuVars.selectedStat) then
        displayMessage = displayMessage .. "Selected Stat: " .. tostring(QuickMenuVars.selectedStat) .. "\n"
    end
    if QuickMenuVars.level > 2 and ValidString(QuickMenuVars.selectedAttribute) then
        displayMessage = displayMessage .. "Selected Attribute: " .. tostring(QuickMenuVars.selectedAttribute) .. "\n"
    end
    if QuickMenuVars.level == 3 then
        if QuickMenuVars.selectedVal == nil then
            QuickMenuVars.selectedVal = QuickMenuVars.defaultVal
        end
        displayMessage =
            displayMessage ..
            "Selected Value: " ..
                tostring(QuickMenuVars.selectedVal) ..
                    " (Current Value: " .. tostring(QuickMenuVars.defaultVal) .. ")\n"
    end

    if QuickMenuVars.selectedAction == "Set" then
        displayMessage = displayMessage .. "Value Set."
    elseif QuickMenuVars.selectedAction == "Confirm" then
        displayMessage = displayMessage .. "Confirmed."
    elseif QuickMenuVars.selectedAction == "Clear" then
        displayMessage = displayMessage .. "Selected Value Reset."
    end

    Osi.DialogSetVariableFixedString(
        "S7_Config_QuickMenu",
        "S7_Config_DynamicQuickMenu_179ad34b-afc2-4d52-9c0d-3a925e8ee4f2",
        displayMessage
    )
end

--  ####################################################################################################################################################
