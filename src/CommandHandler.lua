local Permissions = require(script.Parent.Permissions)
local Util = require(script.Parent.Util)
local Commands = script.Parent.Commands

local CommandHandler = {}

function CommandHandler:Process(player, message)
    if not message:match("^/") then return end

    local args = message:split(" ")
    local cmdName = args[1]:sub(2):lower()
    local commandModule = Commands:FindFirstChild(cmdName)

    if commandModule and commandModule:IsA("ModuleScript") then
        local command = require(commandModule)
        if command.canRun(player) then
            command.run(player, args)
        else
            player:Kick("Insufficient permissions.")
        end
    end
end

return CommandHandler
