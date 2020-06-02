--  #############################
--      STATS CONFIG AND SYNC
--  #############################

--  STATS-CONFIGURATOR
--  ==================

toSync = {} --  will hold a list of stats that were modified. for Ext.SyncStat()

function S7_StatsConfigurator(JSONstring) --  Recieves stringified JSON from Ext.LoadFile(), Osiris or a mod.
    if (type(JSONstring) == "string") and (JSONstring ~= "") and (JSONstring ~= "{}") then --  if json file exists and is not empty.
        local JSONborne = Ext.JsonParse(JSONstring) --  Parsed JSONstring.
        Ext.Print("[S7:Config - BootstrapServer.lua] --- JSON loaded. Applying Configuration Profile.\n")

        Ext.Print("=============================================================")
        for name, content in pairs(JSONborne) do --  Iterate over JSONborne.
            Ext.Print(name)
            Ext.Print("-------------------------------------------------------------")

            local stat = Ext.GetStat(name) --  Gets original stat-entry.
            for key, value in pairs(content) do
                if S7_SafeToModify(key) then --  Checks if key is safe to modify
                    Ext.Print(key .. ": " .. value .. " (" .. stat[key] .. ")") --  e.g. - ActionPoints: 5(2)   |   StatName: NewValue(OriginalValue)
                    stat[key] = value --  Sets new value for Name[Attribute]
                end
            end

            Ext.Print("_____________________________________________________________")
            Ext.Print("\n")
            table.insert(toSync, name) --  Records stat-ids of the modified stats. To call Ext.SyncStat() on them later.
        end
        Ext.Print("=============================================================")
        Ext.Print("[S7:Config - BootstrapServer.lua] --- Configuration Profile Active.")
        S7_SetDialogVars("StatsConfigurator", "Configuration Profile Activated.")
    else
        Ext.PrintError("[S7:Config - BootstrapServer.lua] --- JSON file could not be loaded.")
    end
    S7_StatsSynchronize() --  Synchronize stats for all clients.
end

function S7_SafeToModify(key) --  Checks if key is safe to modify.
    local dontFwith = {
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

    if S7_ConfigSettings.BypassSafetyCheck == true then --  Manual-Override setting is true.
        return true --  S7_SafeToModify() returns true for everything.
    else -- Default Setting
        for i, avoid in ipairs(dontFwith) do --  Iterate over keys to avoid.
            if key == avoid then --  If key matches.
                return false --  Stop it right there.
            else
                return true --  else continue.
            end
        end
    end
end

--  STATS-SYNCHRONIZE
--  =================

function S7_StatsSynchronize()
    if type(next(toSync)) ~= "nil" then --  Stats were modified. toSync is not empty.
        Ext.Print(
            "[S7:Config - BootstrapServer.lua] --- Synchronizing Stats [Savegame-Persistence: " ..
                tostring(S7_ConfigSettings.SyncStatPersistence) .. "]"
        )
        Ext.Print("=============================================================")

        for i, name in ipairs(toSync) do
            Ext.SyncStat(name, S7_ConfigSettings.SyncStatPersistence) --  Sync
            Ext.Print("Synchronized Stat: " .. name)
            toSync[i] = nil --  Clears out toSync entry.
        end
        Ext.Print("=============================================================")
    elseif type(next(toSync)) == "nil" then
        Ext.PrintWarning("[S7:Config - BootstrapServer.lua] --- Nothing to Synchronize. toSync queue is empty.")
        S7_SetDialogVars(
            "SyncStat",
            "Nothing to Synchronize. toSync queue is empty. Use S7_ConfigSettings.json to specify stats."
        )
    end
end
