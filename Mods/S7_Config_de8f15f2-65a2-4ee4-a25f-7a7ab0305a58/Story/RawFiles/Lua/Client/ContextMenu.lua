--  ============
--  CONTEXT MENU
--  ============

--  REGISTER LABELS
--  ===============

Ext.RegisterListener('SessionLoaded', function() -- UCL has been loaded by this point regardless of where it is in the load-order
    UCL = Mods['S7_UI_Components_Library'] -- Import UCL
    local GUID = ExtractGUID(ConfiguratorItem)

    -- Register Context-Menu label to Configurator Item
    UCL.ContextMenu:Register({
        ["RootTemplate::" .. GUID] = {
            {
                ['actionID'] = 27701,
                ['clickSound'] = true,
                ['text'] = Color:Blue('Apply Configuration'),
                ['isDisabled'] = false,
                ['isLegal'] = true
            },
            {
                ['actionID'] = 27702,
                ['clickSound'] = true,
                ['text'] = Color:Blue('Mod Information'),
                ['isDisabled'] = false,
                ['isLegal'] = true
            }
        }
    })
end)

--  MOD-MANUAL
--  ==========

Ext.RegisterNetListener('S7UCL::ContextMenu', function (channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload) -- Converts stringified numeric keys back into numbers

    if payload.actionID == 27702 then
        local manual = LoadFile('Mods/S7_Config_de8f15f2-65a2-4ee4-a25f-7a7ab0305a58/ModInformation.md', 'data')

        --  Replacers table
        local replacers = {
            {['?ModVersion'] = Version:Parse(MODINFO.Version):String()},
            {['?ModAuthor'] = MODINFO.Author},
            {['?ModDescription'] = MODINFO.Description},
            {['?SettingsConfigFiles'] = Ext.JsonStringify(Settings.ConfigFiles)},
            {['?SettingsSyncStatPersistence'] = Ext.JsonStringify(Settings.SyncStatPersistence)},
            {['?SettingsStatsLoader'] = Ext.JsonStringify(Settings.StatsLoader)},
        }

        local specs = UCL.Journalify(manual, replacers) -- Parse ModInformation.md into Journal Specification
        specs = Integrate(specs, {
            ['GMJournal'] = {
                ['Component'] = {['Name'] = 'S7_ConfigCtxMenu'},
                ['SubComponent'] = {['ToggleEditButton'] = {['Visible'] = false}}
            }
        })
        UCL.Render(specs) -- Render Journal on-screen
    end
end)