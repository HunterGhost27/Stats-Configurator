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

--  #######################
--      DYNAMIC ACTIONS
--  #######################

function DynamicAction(option, switch)
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
