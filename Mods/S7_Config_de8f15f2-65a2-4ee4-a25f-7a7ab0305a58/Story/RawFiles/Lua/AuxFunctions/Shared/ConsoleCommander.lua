--  =================
--  CONSOLE COMMANDER
--  =================

--  COMMAND OBJECT
--  ==============

---@class Command @Console-Command Template
---@field Name string Command Name
---@field Action function Command Action
---@field Context string Context: "Shared", "Server" or "Client"
---@field Description string Help-Messsage
---@field Params table<number, string> Parameters
Command = {
    ['Name'] = '',
    ['Action'] = '',
    ['Context'] = 'Shared',
    ['Description'] = '',
    ['Params'] = {}
}

---Instantiate new Command Object
---@param object Command
---@return Command
function Command:New(object)
    if not ValidInputTable(object, {'Name', 'Action'}) then return end
    local object = object or {}
    Integrate(self, object)
    return object
end

---CMD in Valid Context
---@param CMD Command
---@return boolean
local function isValidContext(CMD)
    if CMD.Context == 'Shared' or CMD.Context == Ext.IsServer() and 'Server' or 'Client' then return true
    else return false end
end

--  CONSOLE COMMANDER
--  =================

---@class ConsoleCommander
ConsoleCommander = {}

---Registers new Console-Command
---@param CMD Command
function ConsoleCommander:Register(CMD)
    if not ValidInputTable(CMD, {'Name', 'Action'}) then return end
    self[CMD.Name] = Command:New(CMD)
end

--  HELP MESSAGE
--  ============

---Help-Message Console-Command
---@param target string Command-Name or ""
local function ConsoleCommanderHelp(target)
    local target = target or ""
    local helpMsg = ""

    if ConsoleCommander[target] and isValidContext(ConsoleCommander[target]) then
        Write:SetHeader(target .. ": " .. ConsoleCommander[target].Description)
        if IsValid(ConsoleCommander[target].Params) then
            for key, value in ipairs(ConsoleCommander[target].Params) do
                Write:NewLine("\t" .. "Parameter" .. key .. ": " .. value)
            end
        end
        helpMsg = Write:Display()
    else
        local helpTable = {}
        for cmdName, value in pairs(Rematerialize(ConsoleCommander)) do helpTable[cmdName] = value.Description end

        Write:SetHeader('COMMAND\t\t\tDESCRIPTION')
        Write:Tabulate(helpTable)
        Write:NewLine("!" .. IDENTIFIER .." Help <CommandName> for more info")
        helpMsg = Write:Display()
    end
    Debug:FWarn(helpMsg)
end

ConsoleCommander:Register({
    ['Name'] = 'Help',
    ['Action'] = ConsoleCommanderHelp,
    ['Context'] = 'Shared',
    ['Description'] = 'Displays a list of all console-commands',
    ['Params'] = {[1] = 'Target Command-Name'}
})

--  REGISTER CONSOLE-COMMANDER
--  ==========================

Ext.RegisterConsoleCommand(IDENTIFIER, function (cmd, command, ...)
    if not ValidString(command) then Debug:FError('Invalid Command. Try !' .. IDENTIFIER .. ' Help') return end
    if not ConsoleCommander[command] then command = "Help" end
    ConsoleCommander[command].Action(...)
end)