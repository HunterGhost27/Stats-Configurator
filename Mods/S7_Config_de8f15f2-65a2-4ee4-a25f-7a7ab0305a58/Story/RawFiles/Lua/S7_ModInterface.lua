--  ###################################################################################################################################################
--  ####                                                                MOD INTERFACE                                                              ####
--  ===================================================================================================================================================
--  dialog file = "S7_Config_QuickMenu.lsj"
logSource = "Lua:ModInterface"
--  ###################################################################################################################################################

--  ============================
--  REFRESH QUICK-MENU VARIABLES
--  ============================

function RefreshQuickMenuVars() --  Resets quickMenuVars to initial (unset) conditions.
    quickMenuVars = {
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
        ["selectedAction"] = "", --  selected action.
        ["selectedVal"] = nil, --  selected Value for modification.
        ["defaultVal"] = nil, -- current Value for the selected attribute.
        ["configData"] = {}, -- Table temporarily holds the user's configuration during the session.
        ["inDialog"] = false --  boolean. true if host-character is currently in dialog.
    }
    S7_ConfigLog("Dynamic Quick-Menu Refreshed.")
end

RefreshQuickMenuVars() --  quickMenuVars initialization.

--  ####################################################################################################################################################

--  ########################
--      QUICK MENU RELAY
--  ########################

function S7_Config_QuickMenuRelay(signal) --  Recieves flag from Osiris (S7_Config_ModInterface.txt).
    if quickMenuVars.inDialog ~= true then --  if there is no dialog session active.
        --  =====================
        --  DIALOG NOT IN SESSION
        --  =====================

        --  READ MOD-REGISTRY
        --  -----------------

        local modRegistry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, signal) --  fetch ModRegistry data corresponding to the signal.
        if modRegistry ~= nil then --  if ModRegistry exists.
            quickMenuVars.level = 1 --  Set session level to 1. (start dialog session)
            quickMenuVars.modName = modRegistry[1][1] --  set modName
            quickMenuVars.modUUID = modRegistry[1][2] --  set modUUID

            --  LOAD PRE-EXISTING CONFIGURATION
            --  -------------------------------

            for modName, content in pairs(Ext.JsonParse(Ext.LoadFile("S7_ConfigData.json") or {})) do
                if modName == quickMenuVars.modName then --  if configuration already exists.
                    quickMenuVars.configData = Ext.JsonParse(content) --  Pre-load configData with existing configuration.
                end
            end

            --  START DIALOG
            --  ------------

            S7_ConfigLog("Start " .. quickMenuVars.modName .. "'s Dynamic Quick-Configuration Dialog.")
            Osi.Proc_StartDialog(1, "S7_Config_QuickMenu", Osi.CharacterGetHostCharacter()) --  host-character starts dialog.
            quickMenuVars.inDialog = true --  Dynamic Quick-Menu dialog now in session.
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
            if quickMenuVars.level < 3 then
                quickMenuVars.level = quickMenuVars.level + 1
                quickMenuVars.page = 1 --  Resets page index to 1.
            end
        end

        if signal == "S7_Config_GoBack" then --  moves back one level in the current dialog session.
            if quickMenuVars.level > 1 then
                quickMenuVars.level = quickMenuVars.level - 1
                quickMenuVars.page = 1 --  Resets page index to 1.
                quickMenuVars.selectedAction = nil
            end
        end

        --  CHANGE PAGE
        --  -----------

        if signal == "S7_Config_NextPage" then --  moves to the next page in the current level. Available if current level has more than 5 entries.
            if quickMenuVars.page < quickMenuVars.maxPage then
                quickMenuVars.page = quickMenuVars.page + 1
            end
        end

        if signal == "S7_Config_PrevPage" then --  moves back to the previous page in the current level.
            if quickMenuVars.page > 1 then
                quickMenuVars.page = quickMenuVars.page - 1
            end
        end

        --  EXIT SESSION CLEANUP
        --  ====================

        if signal == "S7_Config_ExitCleanUp" then --  Called upon dialog exit. Cleans up quickMenuVars for the next session.
            S7_ConfigLog(quickMenuVars.modName .. " dialog ends.")
            RefreshQuickMenuVars() --  Resets quickMenuVars.
        end
    end

    --  UPDATE DYNAMIC MENU DIALOG
    --  ==========================

    if signal ~= "S7_Config_ExitCleanUp" then --  Prevents update when player has quit the dialog session.
        UpdateDynamicMenu() --  Updates Dynamic Quick-Menu.
    end

    ExportLog() -- Exports ConfigLogs if they're enabled.
end

--  ================================================================================
Ext.NewCall(S7_Config_QuickMenuRelay, "S7_Config_QuickMenuRelay", "(STRING)_SIGNAL")
--  ================================================================================

--  ####################################################################################################################################################

--  ###################
--      STAGED LIST
--  ###################

function BuildStagedList() --  Builds the list of options for the current session, level and page.
    quickMenuVars.stageList = {} --  reinitialize stageList.

    --  FILTER MOD-INTERFACE DATABASE
    --  =============================

    if quickMenuVars.level == 1 then
        quickMenuVars.database = Osi.DB_S7_Config_ModInterface:Get(quickMenuVars.modName, nil, nil)
    elseif quickMenuVars.level == 2 then
        quickMenuVars.database =
            Osi.DB_S7_Config_ModInterface:Get(quickMenuVars.modName, quickMenuVars.selectedStat, nil)
    end

    --  FILTER UNIQUE ENTRIES AND BUILD STAGE LIST
    --  ==========================================

    local pos = 1 --  Marks the position of the entry in the current stage. Sequential Order.
    local tempList = {} --  temporary list to filter unique entries.

    for i, entry in ipairs(quickMenuVars.database) do
        if quickMenuVars.level == 1 then
            if tempList[entry[2]] == nil then --  if entry does not already exist.
                tempList[entry[2]] = pos --  create entry at position pos.
                pos = pos + 1 --  increase position index by 1.
            end
        elseif quickMenuVars.level == 2 then
            if tempList[entry[3]] == nil then --   if entry does not already exist.
                if type(Ext.StatGetAttribute(quickMenuVars.selectedStat, entry[3])) == "number" then
                    tempList[entry[3]] = pos --  create entry at position pos.
                    pos = pos + 1 --  increase position index by 1.
                end
            end
        elseif quickMenuVars.level == 3 then
            tempList = {
                --  if level 3, use the following manual stage entries.
                ["Increase"] = 1,
                ["Decrease"] = 2,
                ["Set"] = 3,
                ["Confirm"] = 4,
                ["Clear"] = 5
            }
        end
    end
    --  Interchange entry and pos
    for entry, pos in pairs(tempList) do
        quickMenuVars.stageList[pos] = entry
    end

    --  DETERMINE MAXIMUM NUMBER OF PAGES
    --  =================================

    local count = 0 --  counts the total number of entries in the stage list.
    for pos, entry in ipairs(quickMenuVars.stageList) do
        count = count + 1
    end
    quickMenuVars.maxPage = math.floor((count - 1) / 5) + 1
    --  determines the maximum number of pages for the current level. Each page has 5 entries.
end

--  ####################################################################################################################################################

--  #######################
--      DYNAMIC ACTIONS
--  #######################

function DynamicAction(option, switch)
    BuildStagedList()
    local pos = (quickMenuVars.page - 1) * 5 + option --  Retrieve absolute position of entry.

    if quickMenuVars.level == 1 then
        quickMenuVars.selectedStat = quickMenuVars.stageList[pos]
        --  Initialize selectedStat in configData if it doesn't already exist.
        if quickMenuVars.configData[quickMenuVars.selectedStat] == nil then
            quickMenuVars.configData[quickMenuVars.selectedStat] = {}
        end
    elseif quickMenuVars.level == 2 then
        quickMenuVars.selectedAttribute = quickMenuVars.stageList[pos]
        quickMenuVars.defaultVal = Ext.StatGetAttribute(quickMenuVars.selectedStat, quickMenuVars.selectedAttribute) --  get the current value for the attribute
        quickMenuVars.configData[quickMenuVars.selectedStat][quickMenuVars.selectedAttribute] = quickMenuVars.defaultVal -- initialize table with defaultValue
    elseif quickMenuVars.level == 3 then
        quickMenuVars.selectedAction = quickMenuVars.stageList[pos]
        quickMenuVars.selectedVal = quickMenuVars.selectedVal or quickMenuVars.defaultVal
    end

    if quickMenuVars.selectedAction == "Increase" then
        quickMenuVars.selectedVal = quickMenuVars.selectedVal + 1
    elseif quickMenuVars.selectedAction == "Decrease" then
        quickMenuVars.selectedVal = quickMenuVars.selectedVal - 1
    elseif quickMenuVars.selectedAction == "Set" then
        quickMenuVars.configData[quickMenuVars.selectedStat][quickMenuVars.selectedAttribute] =
            quickMenuVars.selectedVal
    elseif quickMenuVars.selectedAction == "Confirm" then
        --  Call Stats Configurator
        table.insert(toConfigure, {[quickMenuVars.modName] = Ext.JsonStringify(quickMenuVars.configData)})
        StatsConfigurator()
        StatsSynchronize()
        toConfigure = {}
        BuildConfigData(Ext.JsonStringify(quickMenuVars.configData), quickMenuVars.modUUID, quickMenuVars.modName)
    elseif quickMenuVars.selectedAction == "Clear" then
        quickMenuVars.selectedVal = quickMenuVars.defaultVal
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

    if quickMenuVars.page == 1 and quickMenuVars.page ~= quickMenuVars.maxPage then
        Osi.GlobalClearFlag("S7_Config_PrevPageAvailable")
        Osi.GlobalSetFlag("S7_Config_NextPageAvailable")
    elseif quickMenuVars.page ~= 1 and quickMenuVars.page == quickMenuVars.maxPage then
        Osi.GlobalClearFlag("S7_Config_NextPageAvailable")
        Osi.GlobalSetFlag("S7_Config_PrevPageAvailable")
    elseif quickMenuVars.page == 1 and quickMenuVars.page == quickMenuVars.maxPage then
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

        for pos, entry in ipairs(quickMenuVars.stageList) do --  Iterate over stageList.
            --  MAP POS (ABSOLUTE POSITION) TO RELPOS (RELATIVE POSITION)
            --  =========================================================
            if (pos < (1 + 5 * quickMenuVars.page)) and (pos > (5 * (quickMenuVars.page - 1))) then
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

    local modInfo = Ext.GetModInfo(quickMenuVars.modUUID)
    local displayMessage =
        "Configuring stats for: " ..
        tostring(modInfo.Name) ..
            " by " ..
                tostring(modInfo.Author) ..
                    " | Current Page: " ..
                        "(" .. tostring(quickMenuVars.page) .. "/" .. tostring(quickMenuVars.maxPage) .. ")\n"

    if quickMenuVars.level > 1 and quickMenuVars.selectedStat ~= nil and quickMenuVars.selectedStat ~= "" then
        displayMessage = displayMessage .. "Selected Stat: " .. tostring(quickMenuVars.selectedStat) .. "\n"
    end
    if quickMenuVars.level > 2 and quickMenuVars.selectedAttribute ~= nil and quickMenuVars.selectedAttribute ~= "" then
        displayMessage = displayMessage .. "Selected Attribute: " .. tostring(quickMenuVars.selectedAttribute) .. "\n"
    end
    if quickMenuVars.level == 3 then
        if quickMenuVars.selectedVal == nil then
            quickMenuVars.selectedVal = quickMenuVars.defaultVal
        end
        displayMessage =
            displayMessage ..
            "Selected Value: " ..
                tostring(quickMenuVars.selectedVal) ..
                    " (Current Value: " .. tostring(quickMenuVars.defaultVal) .. ")\n"
    end

    if quickMenuVars.selectedAction == "Set" then
        displayMessage = displayMessage .. "Value Set."
    elseif quickMenuVars.selectedAction == "Confirm" then
        displayMessage = displayMessage .. "Confirmed."
    elseif quickMenuVars.selectedAction == "Clear" then
        displayMessage = displayMessage .. "Selected Value Reset."
    end

    Osi.DialogSetVariableFixedString(
        "S7_Config_QuickMenu",
        "S7_Config_DynamicQuickMenu_179ad34b-afc2-4d52-9c0d-3a925e8ee4f2",
        displayMessage
    )
end

--  ####################################################################################################################################################
