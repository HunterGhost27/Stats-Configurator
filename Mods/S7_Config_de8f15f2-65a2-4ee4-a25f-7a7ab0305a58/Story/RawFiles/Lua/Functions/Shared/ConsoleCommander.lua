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
---@field New function Creates new instance
Command = {
    ['Name'] = "",
    ['Action'] = function() end,
    ['Context'] = "Shared",
    ['Description'] = "",
    -- ['Params'] = {}
}

---Instantiate new Command Object
---@param object Command
---@return Command
function Command:New(object)
    local object = object or {}
    Integrate(self, object)
    return object
end

---CMD in Valid Context
---@param CMD Command
---@return boolean
local function isValidContext(CMD)
    if CMD.Context == "Shared" or CMD.Context == Ext.IsServer() and "Server" or "Client" then return true
    else return false end
end

--  CONSOLE COMMANDER
--  =================

ConsoleCommander = {}

---Registers new Console-Command
---@param CMD Command
function ConsoleCommander:Register(CMD)
    if not ValidString(CMD.Name) then Debug:Error('Cannot register console-command. Invalid commandName'); return end
    self[CMD.Name] = Command:New(CMD)
end

--  HELP MESSAGE
--  ============

---Help-Message Console-Command
---@param target string Command-Name or ""
function ConsoleCommanderHelp(target)
    local target = target or ""
    local helpMsg = ""

    if ConsoleCommander[target] and isValidContext(ConsoleCommander[target]) then
        Stringer:SetHeader(target .. ": " .. ConsoleCommander[target].Description)
        if ConsoleCommander[target].Params then
            for key, value in ipairs(ConsoleCommander[target].Params) do
                Stringer:Add("\t" .. "Parameter" .. key .. ": " .. value)
            end
        end
        helpMsg = Stringer:Build()
    else
        for name, CMD in pairs(ConsoleCommander) do
            if type(CMD) == 'table' and isValidContext(CMD) then
                Stringer:Add("COMMAND: ".. name)
                Stringer:Add("DESCRIPTION: " .. CMD.Description)
                Stringer:LineBreak("-")
            end
        end
        Stringer:Add("!S7_Forgetinator Help <CommandName> for more info")
        helpMsg = Stringer:Build()
    end
    Debug:FWarn(helpMsg)
end

ConsoleCommander:Register({
    ['Name'] = "Help",
    ['Action'] = ConsoleCommanderHelp,
    ['Context'] = "Shared",
    ['Description'] = "Displays a list of all console-commands",
    ['Params'] = {[1] = "Target Command-Name"}
})

--  REGISTER CONSOLE-COMMANDER
--  ==========================

Ext.RegisterConsoleCommand(IDENTIFIER, function (cmd, command, ...)
    if not ValidString(command) then Debug:FError('Invalid Command. Try !' .. IDENTIFIER .. ' Help'); return end
    if not ConsoleCommander[command] then command = "Help" end
    ConsoleCommander[command].Action(...)
end)