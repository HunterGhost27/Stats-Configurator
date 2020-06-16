--  ###################################################################################################################################################
--                                                                      MOD INTERFACE
--  ===================================================================================================================================================
logSource = "Lua:S7_ModInterface"
--  ###################################################################################################################################################

local level = 1

function S7_Config_QuickMenuRelay(signal)
    if signal == "S7_Config_MoveToNextLevel" then
        if level < 3 then
            level = level + 1
            S7_UpdateDynamicMenu(level, modName)
        end
    else
        local modRegistry = Osi.DB_S7_Config_ModRegistry:Get(nil, nil, signal)
        if modRegistry ~= nil then
            local modName = ""
            for i, entry in ipairs(modRegistry) do
                modName = entry[1]
            end
            level = 1
            local character = Osi.CharacterGetHostCharacter()
            S7_UpdateDynamicMenu(level, modName)
            Osi.Proc_StartDialog(1, "S7_Config_QuickMenu", character)
        end
    end
end

--  ================================================================================
Ext.NewCall(S7_Config_QuickMenuRelay, "S7_Config_QuickMenuRelay", "(STRING)_SIGNAL")
--  ================================================================================

function S7_UpdateDynamicMenu(level, modName)
    local tempList, stageList = {}, {}
    local database = Osi.DB_S7_Config_ModInterface:Get(modName, nil, nil, nil)
    for i, entry in ipairs(database) do
        if level == 1 then
            if tempList[entry[2]] == nil then
                tempList[entry[2]] = i
            end
        elseif level == 2 then
            if tempList[entry[3]] == nil then
                tempList[entry[3]] = i
            end
        elseif level == 3 then
            tempList = {
                ["Increase"] = 1,
                ["Decrease"] = 2,
                ["Set"] = 3,
                ["Clear"] = 4
            }
        end
    end
    for entry, pos in pairs(tempList) do
        stageList[pos] = entry
    end

    local quickMenuDialogCase = {
        "S7_Config_Opt1_8523d721-fae5-4f64-81ee-749130f1c4eb",
        "S7_Config_Opt2_aa949336-d705-4a20-b8ff-564b381583f6",
        "S7_Config_Opt3_1c4f9b5f-907c-4b2f-b5bc-dd4f443dbf08",
        "S7_Config_Opt4_d07ece22-c225-4d76-b6e3-e94498ade0ba",
        "S7_Config_Opt5_19d98a3a-b117-4df4-b95d-9f937568ee35"
    }

    for i, case in ipairs(quickMenuDialogCase) do
        for pos, entry in ipairs(stageList) do
            if i == pos then
                Osi.DialogSetVariableFixedString("S7_Config_QuickMenu", case, entry)
                Osi.GlobalSetFlag("S7_Config_AvailableOpt" .. i)
            else
                Osi.GlobalClearFlag("S7_ConfigAvailableOpt" .. i)
            end
        end
    end
end
