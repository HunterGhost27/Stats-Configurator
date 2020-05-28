--  ################################################################################################################
--  ########                                       STATS CONFIGURATOR                                       ########
--  ################################################################################################################

--  ##################
--       MOD-MENU
--  ##################

local function S7_Config_ModMenuRelay(Signal) --  Signal recieved from Osiris
    --  =====   STATS-CONFIGURATOR  =====
    if Signal == "S7_StatsConfigurator" then --  Load JSON and Configure Stats
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Loading S7_Config.json")
        local JSONstring = Ext.LoadFile("S7_Config.json") --  Loads Configuration File
        S7_StatsConfigurator(JSONstring) --  Call StatsConfigurator
    end
    --  =====   STATS-SYNCHRONIZE   =====
    if Signal == "S7_StatsSynchronize" then --  Synchronize stats between all clients
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Synchronizing at Player's request.")
        S7_StatsSynchronize() --  Call StatsSynchronize
    end
    --  =====   EXPORT STATS TO TSV   =====
    if Signal == "S7_StatsExportTSV" then --  Export stat-types and stat-names to a tsv
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Exporting all StatIDs to S7_Config_AllTheStats.tsv")
        S7_StatsExportTSV() --  Logs statIDs in an external TSV file for reference
    end
end

--  ============================================================================
Ext.NewCall(S7_Config_ModMenuRelay, "S7_Config_ModMenuRelay", "(STRING)_Signal")
--  ============================================================================

--  #####################
--  STATS CONFIG AND SYNC
--  #####################

toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

function S7_StatsConfigurator(JSONstring) --  Recieves stringified JSON from Ext.LoadFile(), Osiris or a mod.
    local JSONborne = Ext.JsonParse(JSONstring) --  Parse JSONstring.

    if JSONborne ~= nil then --  JSONborne is not empty.
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON loaded. Applying Configuration Profile.\n\n")

        Ext.Print("=============================================================")
        for name, content in pairs(JSONborne) do --  Iterate over JSONborne
            Ext.Print(name)
            Ext.Print("-------------------------------------------------------------")

            local stat = Ext.GetStat(name) --  Gets original stat-entry
            for key, value in pairs(content) do
                if S7_SafeToModify(key) then --  Checks if key is safe to modify
                    Ext.Print(key .. ": " .. value .. "\t(" .. stat[key] .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                    stat[key] = value --  Sets new value for Name[Attribute]
                end
            end
            Ext.Print("_____________________________________________________________")
            Ext.Print("\n")
            table.insert(toSync, name) --  Records stat-ids of the modified stats. To call Ext.SyncStat() on them later.
        end
        Ext.Print("=============================================================")
    else
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON file could not be loaded.")
    end
    Ext.Print("[S7:Config - BootstrapServer.lua] --- Configuration Profile Active.")
    S7_StatsSynchronize() --  Synchronize stats for all clients.
end

--  =========================================================
Ext.NewCall(S7_StatsConfigurator, "S7_StatsConfigurator", "")
--  =========================================================

function S7_StatsSynchronize()
    if type(next(toSync)) ~= "nil" then --  Stats were modified.
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Synchronizing Stat-edit")
        Ext.Print("=============================================================")

        for i, name in ipairs(toSync) do
            Ext.SyncStat(name) --  Sync
            Ext.Print("Synchronized Stat: " .. name)
            toSync[i] = nil --  Clears out toSync entry.
        end
        Ext.Print("=============================================================")
    elseif type(next(toSync)) == "nil" then
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Nothing to Synchronize. toSync queue is empty.")
    end
end

--  =========================================================
Ext.NewCall(S7_StatsSynchronize, "S7_StatsSynchronize", "")
--  =========================================================

--  ################################
--      EXPORT STAT-NAMES TO TSV
--  ################################

function S7_StatsExportTSV() --  Fetches literally every stat and exports to TSV
    Ext.SaveFile("S7_Config_AllTheStats.tsv", "") --  Creates an empty TSV or Overwrites the existing one.
    local SaveAllStatsToFile = "S.No\tType\tStatID\n" --  Header Column
    local allStat = Ext.GetStatEntries() --  Get All Stat Entries
    for key, value in ipairs(allStat) do
        local type = NRD_StatGetType(value)
        SaveAllStatsToFile = SaveAllStatsToFile .. key .. "\t" .. type .. "\t" .. value .. "\n"
    end
    Ext.SaveFile("S7_Config_AllTheStats.tsv", SaveAllStatsToFile) --  Save TSV file.
end

--  ###########################
--      INSPECT STATS SKILL
--  ###########################

local function S7_InspectStats(StatsID, StatType) --  Recieves StatsID and StatType from Osiris
    local allstat = Ext.GetStatEntries(StatType) --  Retrieves all stat entries of corresponding stat-type for comparison.
    for name, content in pairs(allstat) do --  Iterate over allstat
        if content == StatsID then
            Ext.Print("[S7:Config - BootstrapServer.lua] --- (" .. StatType .. "): " .. StatsID)
        end
    end
end

--  ==================================================================================
Ext.NewCall(S7_InspectStats, "S7_InspectStats", "(STRING)_StatsID, (STRING)_StatType")
--  ==================================================================================

--  ############################
--      FUNCTION DEFINITIONS
--  ############################

dontFwith = {
    --  Don't mess with these keys.
    "MemorizationRequirements",
    "Requirements",
    "AoEConditions",
    "TargetConditions",
    "ForkingConditions",
    "CycleConditions",
    "SkillProperties",
    "WinBoost",
    "LoseBoost"
}

function S7_SafeToModify(key) --  Checks if key is safe to modify.
    for i, avoid in ipairs(dontFwith) do
        if key == avoid then
            return false
        else
            return true
        end
    end
end

--  ####################
--      ISSUE-TRACKER
--  ####################

--  Memorization-Requirements bugged in tooltips. Shows up multiple times.

--[[    KEY NAMES FOR REFERENCE
        #######################
        
    Armor
    Character
    Crime
    Object      -   RootTemplate, UseAPCost, Value, Unique
    Potion
    Shield
    SkillData   -   SkillType, ActionPoints, Cooldown, TargetRadius, CanTargetCharacters, CanTargetItems, CanTargetTerrain,     \\
                    MemoryCost, MagicCost, Icon, DisplayName, DisplayNameRef, Description, DescriptionRef, StatsDescription,    \\
                    StatsDescriptionRef, IgnoreVisionBlock, Stealth
    StatusData
    Weapon
]]
