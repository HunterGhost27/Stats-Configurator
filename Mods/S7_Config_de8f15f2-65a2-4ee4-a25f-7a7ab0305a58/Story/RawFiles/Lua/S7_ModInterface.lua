--  ###################################################################################################################################################
--                                                                      MOD INTERFACE
--  ===================================================================================================================================================
logSource = "Lua:S7_ModInterface"
--  ###################################################################################################################################################

function S7_RefreshQuickMenuVars()
    quickMenuVars = {
        ["level"] = 1,
        ["modName"] = "",
        ["modUUID"] = "",
        ["database"] = {},
        ["stageList"] = {},
        ["page"] = 1,
        ["maxPage"] = 1,
        ["selectedStat"] = "",
        ["selectedAttribute"] = "",
        ["selectedAction"] = "",
        ["selectedInt"] = 1,
        ["inDialog"] = false
    }
    S7_ConfigLog("Dynamic Quick-Menu Refreshed.")
end

function S7_PrintAll()
    Ext.Print(Ext.JsonStringify(quickMenuVars))
end

S7_RefreshQuickMenuVars()

function S7_Config_QuickMenuRelay(signal)
    S7_ConfigLog("Dynamic Quick-Menu: " .. signal .. "[inDialog: " .. tostring(quickMenuVars.inDialog) .. "]")
    if quickMenuVars.inDialog ~= true then
        local modRegistry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, signal)
        if modRegistry ~= nil then
            quickMenuVars.level = 1
            quickMenuVars.modName = modRegistry[1][1]
            quickMenuVars.modUUID = modRegistry[1][2]
            quickMenuVars.database = Osi.DB_S7_Config_ModInterface:Get(quickMenuVars.modName, nil, nil, nil)
            S7_ConfigLog("Start " .. quickMenuVars.modName .. " Dialog.")
            local character = Osi.CharacterGetHostCharacter()
            Osi.Proc_StartDialog(1, "S7_Config_QuickMenu", character)
            quickMenuVars.inDialog = true
        end
    else
        local switchCase = {
            "S7_Config_SetOpt1",
            "S7_Config_SetOpt2",
            "S7_Config_SetOpt3",
            "S7_Config_SetOpt4",
            "S7_Config_SetOpt5"
        }
        for i, switch in ipairs(switchCase) do
            if signal == switch then
                S7_DynamicAction(i, switch)
            end
        end

        if signal == "S7_Config_MoveToNextLevel" then
            if quickMenuVars.level < 3 then
                quickMenuVars.level = quickMenuVars.level + 1
                quickMenuVars.page = 1
            end
        end

        if signal == "S7_Config_NextPage" then
            if quickMenuVars.page < quickMenuVars.maxPage then
                quickMenuVars.page = quickMenuVars.page + 1
                Osi.GlobalSetFlag("S7_Config_PrevPageAvailable")
            end
        end

        if signal == "S7_Config_PrevPage" then
            if quickMenuVars.page > 1 then
                quickMenuVars.page = quickMenuVars.page - 1
                Osi.GlobalSetFlag("S7_Config_NextPageAvailable")
            end
        end

        if signal == "S7_Config_GoBack" then
            if quickMenuVars.level > 1 then
                quickMenuVars.level = quickMenuVars.level - 1
                quickMenuVars.page = 1
            end
        end

        if signal == "S7_Config_ExitCleanUp" then
            S7_RefreshQuickMenuVars()
        end
    end
    S7_UpdateDynamicMenu()
    S7_PrintAll()
end

--  ================================================================================
Ext.NewCall(S7_Config_QuickMenuRelay, "S7_Config_QuickMenuRelay", "(STRING)_SIGNAL")
--  ================================================================================

function S7_BuildStagedList()
    local tempList = {}
    for pos, entry in ipairs(quickMenuVars.stageList) do
        quickMenuVars.stageList[pos] = nil
    end

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

    local count = 0
    for pos, entry in ipairs(quickMenuVars.stageList) do
        count = count + 1
    end
    quickMenuVars.maxPage = (math.floor(count / 5) + 1) or 0
end

function S7_DynamicAction(i, switch)
    S7_BuildStagedList()
    quickMenuVars.selectedInt = Ext.StatGetAttribute(quickMenuVars.selectedStat, quickMenuVars.selectedAttribute)
    if quickMenuVars.level == 1 then
        quickMenuVars.selectedStat = quickMenuVars.stageList[i]
    elseif quickMenuVars.level == 2 then
        quickMenuVars.selectedAttribute = quickMenuVars.stageList[i]
    elseif quickMenuVars.level == 3 then
        quickMenuVars.selectedAction = quickMenuVars.stageList[i]
    end

    if quickMenuVars.selectedAction == "Increase" then
        quickMenuVars.selectedInt = quickMenuVars.selectedInt + 1
    elseif quickMenuVars.selectedAction == "Decrease" then
        quickMenuVars.selectedInt = quickMenuVars.selectedInt - 1
    elseif quickMenuVars.selectedAction == "Set" then
        local SendConfig = {
            [quickMenuVars.selectedStat] = {[quickMenuVars.selectedAttribute] = quickMenuVars.selectedInt}
        }
        table.insert(toConfigure, {[quickMenuVars.modName] = Ext.JsonStringify(SendConfig)})
        S7_StatsConfigurator()
        S7_StatsSynchronize()
        toConfigure = {}
        S7_BuildConfigData(quickMenuVars.modName, SendConfig)
    elseif quickMenuVars.selectedAction == "Clear" then
        quickMenuVars.selectedInt = Ext.StatGetAttribute(quickMenuVars.selectedStat, quickMenuVars.selectedAttribute)
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
    else
        Osi.GlobalClearFlag("S7_Config_NextPageAvailable")
        Osi.GlobalClearFlag("S7_Config_PrevPageAvailable")
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
end
