local Config = require(script.Parent.Config)
local Util = require(script.Parent.Util)
local Notify = require(script.Parent.Notify)
local Commands = script.Parent.Commands

local Handler = {}

function Handler:GetRank(player)
    for rank, ids in pairs(Config.Ranks) do
        for _, id in ipairs(ids) do
            if player.UserId == id then
                return rank
            end
        end
    end
    return nil
end

function Handler:CanRun(player, commandName)
    local rank = self:GetRank(player)
    if not rank then return false end

    local allowedRanks = Config.Permissions[commandName]
    if not allowedRanks then return false end

    for _, r in ipairs(allowedRanks) do
        if r == rank then return true end
    end
    return false
end

function Handler:Process(player, message)
    if not message:match("^/") then return end

    local args = message:split(" ")
    local cmdName = args[1]:sub(2):lower()
    local commandModule = Commands:FindFirstChild(cmdName)

    if commandModule and commandModule:IsA("ModuleScript") then
        if self:CanRun(player, cmdName) then
            require(commandModule).run(player, args)
        else
            Notify:Send(player, "You don't have permission to run /" .. cmdName)
        end
    end
end

return Handler
