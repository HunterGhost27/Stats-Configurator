--  ###################################################################################################################################################
--                                                                      MOD INTERFACE
--  ===================================================================================================================================================
--  dialog file = "S7_Config_QuickMenu.lsj"
logSource = "Lua:S7_ModInterface"
--  ###################################################################################################################################################

--  ============================
--  REFRESH QUICK-MENU VARIABLES
--  ============================

function S7_RefreshQuickMenuVars() --  Resets quickMenuVars to initial (unset) conditions.
    quickMenuVars = {
        --  Global Table to hold data relevant to the current QuickMenu session.
        ["level"] = 1, --  level indicates how far the user is along the dialog session. level 1 - statIDs, level 2 - attributes, level 3 - action.
        ["modName"] = "", --  name of the mod set in DB_S7_Config_ModRegistry() by the mod author. Used to match entries in DB_S7_Config_ModInterface().
        ["modUUID"] = "", --  UUID of the mod corresponding to the modName.
        ["database"] = {}, --  fetched data from DB_S7_Config_ModInterface().
        ["stageList"] = {}, --  holds dialogVar data for the current session, level and page.
        ["page"] = 1, --  page number for the current level. (If a level has more than 5 entries, they are split into multiple pages.)
        ["maxPage"] = 1, --  The total number of pages for the current level. (If the level has more than 5 entries.)
        ["selectedStat"] = "", --  stat selected for modification.
        ["selectedAttribute"] = "", --  attribute selected for modification.
        ["selectedAction"] = "", --  selected action.
        ["selectedVal"] = nil, --  selected Value for modification.
        ["defaultVal"] = nil, -- current Value for the selected attribute.
        ["inDialog"] = false --  boolean. true if host-character is currently in dialog.
    }
    S7_ConfigLog("Dynamic Quick-Menu Refreshed.")
end

S7_RefreshQuickMenuVars() --  quickMenuVars initialization.

--  ####################################################################################################################################################

--  ================
--  QUICK MENU RELAY
--  ================

function S7_Config_QuickMenuRelay(signal) --  Recieves flag from Osiris (S7_Config_ModInterface.txt).
    S7_ConfigLog("QuickMenu Signal: " .. signal)

    if quickMenuVars.inDialog ~= true then --  if there is no dialog session active.
        --  =====================
        --  DIALOG NOT IN SESSION
        --  =====================

        local modRegistry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, signal) --  fetch ModRegistry data.
        if modRegistry ~= nil then --  if ModRegistry exists.
            quickMenuVars.level = 1 --  Set session level to 1. (start)
            quickMenuVars.modName = modRegistry[1][1] --  set modName
            quickMenuVars.modUUID = modRegistry[1][2] --  set modUUID
            quickMenuVars.database = Osi.DB_S7_Config_ModInterface:Get(quickMenuVars.modName, nil, nil, nil) --  fetch ModInterface data

            S7_ConfigLog("Start " .. quickMenuVars.modName .. "'s Dialog.")
            Osi.Proc_StartDialog(1, "S7_Config_QuickMenu", Osi.CharacterGetHostCharacter()) --  host-character starts dialog.
            quickMenuVars.inDialog = true --  Dynamic Quick-Menu dialog now in session.
        end
    else --  Dynamic Quick-Menu in session.
        --  =================
        --  DIALOG IN SESSION
        --  =================

        --  DYNAMIC ACTIONS
        --  ===============

        local switchCase = {
            --  Table of dynamic set-flags.
            "S7_Config_SetOpt1",
            "S7_Config_SetOpt2",
            "S7_Config_SetOpt3",
            "S7_Config_SetOpt4",
            "S7_Config_SetOpt5"
        }
        for i, switch in ipairs(switchCase) do
            if signal == switch then
                S7_DynamicAction(i, switch) --  if signal matches any dynamic set-options then relay it(again!) to S7_DynamicAction()
            end
        end

        --  CHANGE LEVEL
        --  ============

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
            end
        end

        --  CHANGE PAGE
        --  ===========

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
            S7_RefreshQuickMenuVars()
        end
    end

    --  UPDATE DYNAMIC MENU DIALOG
    --  ==========================

    if signal ~= "S7_Config_ExitCleanUp" then --  Prevents update when player has quit the dialog session.
        S7_UpdateDynamicMenu() --  Update Dynamic Quick-Menu.
    end
end

--  ================================================================================
Ext.NewCall(S7_Config_QuickMenuRelay, "S7_Config_QuickMenuRelay", "(STRING)_SIGNAL")
--  ================================================================================

--  ###############################################################################################################################################

function S7_BuildStagedList() --  Builds the list of options for the current session, level and page.
    quickMenuVars.stageList = {} --  reinitialize stageList.
    local tempList = {}

    for i, entry in ipairs(quickMenuVars.database) do
        if quickMenuVars.level == 1 then
            if tempList[entry[2]] == nil then
                tempList[entry[2]] = i
            end
        elseif quickMenuVars.level == 2 then
            if tempList[entry[3]] == nil then
                tempList[entry[3]] = i
            end
        elseif quickMenuVars.level == 3 then
            tempList = {
                ["Increase"] = 1,
                ["Decrease"] = 2,
                ["Set"] = 3,
                ["Clear"] = 4
            }
        end
    end
    for entry, pos in pairs(tempList) do
        quickMenuVars.stageList[pos] = entry
    end

    local count = 0 --  counts the total number of entries in stage list.
    for pos, entry in ipairs(quickMenuVars.stageList) do
        count = count + 1
    end
    quickMenuVars.maxPage = (math.floor(count / 5) + 1) or 1 --  determines the maximum number of pages for the current level. Each page has 5 entries.
end

function S7_DynamicAction(i, switch)
    S7_BuildStagedList()
    local pos = (quickMenuVars.page - 1) * 5 + i

    if quickMenuVars.level == 1 then
        quickMenuVars.selectedStat = quickMenuVars.stageList[pos]
    elseif quickMenuVars.level == 2 then
        quickMenuVars.selectedAttribute = quickMenuVars.stageList[pos]
        quickMenuVars.defaultVal = Ext.StatGetAttribute(quickMenuVars.selectedStat, quickMenuVars.selectedAttribute)
    elseif quickMenuVars.level == 3 then
        quickMenuVars.selectedAction = quickMenuVars.stageList[pos]
        quickMenuVars.selectedVal = quickMenuVars.selectedVal or quickMenuVars.defaultVal
    end

    if quickMenuVars.selectedAction == "Increase" then
        quickMenuVars.selectedVal = quickMenuVars.selectedVal + 1
    elseif quickMenuVars.selectedAction == "Decrease" then
        quickMenuVars.selectedVal = quickMenuVars.selectedVal - 1
    elseif quickMenuVars.selectedAction == "Set" then
        local SendConfig = {
            [quickMenuVars.selectedStat] = {[quickMenuVars.selectedAttribute] = quickMenuVars.selectedVal}
        }
        table.insert(toConfigure, {[quickMenuVars.modName] = Ext.JsonStringify(SendConfig)})
        S7_StatsConfigurator()
        S7_StatsSynchronize()
        toConfigure = {}
        S7_BuildConfigData(quickMenuVars.modName, Ext.JsonStringify(SendConfig))
    elseif quickMenuVars.selectedAction == "Clear" then
        quickMenuVars.selectedVal = quickMenuVars.defaultVal
    end
end

function S7_UpdateDynamicMenu()
    S7_BuildStagedList()

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

    local quickMenuDialogCase = {
        "S7_Config_Opt1_8523d721-fae5-4f64-81ee-749130f1c4eb",
        "S7_Config_Opt2_aa949336-d705-4a20-b8ff-564b381583f6",
        "S7_Config_Opt3_1c4f9b5f-907c-4b2f-b5bc-dd4f443dbf08",
        "S7_Config_Opt4_d07ece22-c225-4d76-b6e3-e94498ade0ba",
        "S7_Config_Opt5_19d98a3a-b117-4df4-b95d-9f937568ee35"
    }

    for i, case in ipairs(quickMenuDialogCase) do
        Osi.GlobalClearFlag("S7_Config_AvailableOpt" .. i)
        for pos, entry in ipairs(quickMenuVars.stageList) do
            if (pos < (1 + 5 * quickMenuVars.page)) and (pos > (5 * (quickMenuVars.page - 1))) then
                local relPos = pos % 5
                if relPos == 0 then
                    relPos = 5
                end
                if i == relPos then
                    Osi.DialogSetVariableFixedString("S7_Config_QuickMenu", case, entry)
                    Osi.GlobalSetFlag("S7_Config_AvailableOpt" .. i)
                end
            end
        end
    end

    local modInfo = Ext.GetModInfo(quickMenuVars.modUUID)
    local displayMessage =
        "Configuring stats for: " ..
        tostring(modInfo.Name) ..
            " by " ..
                tostring(modInfo.Author) ..
                    "\nCurrent Page: " ..
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
                tostring(quickMenuVars.selectedVal) .. "(Current Value: " .. tostring(quickMenuVars.defaultVal) .. ")"
    end

    Osi.DialogSetVariableFixedString(
        "S7_Config_QuickMenu",
        "S7_Config_DynamicQuickMenu_179ad34b-afc2-4d52-9c0d-3a925e8ee4f2",
        displayMessage
    )
end
