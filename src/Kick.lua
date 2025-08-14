local Util = require(script.Parent.Parent.Util)
local Notify = require(script.Parent.Parent.Notify)

return {
    run = function(player, args)
        local target = Util:GetPlayerByName(args[2])
        if target then
            target:Kick("Kicked by " .. player.Name)
            Notify:Send(player, "Kicked " .. target.Name)
        else
            Notify:Send(player, "Player not found")
        end
    end
}
