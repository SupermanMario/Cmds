local Util = require(script.Parent.Parent.Util)

return {
    run = function(player, args)
        local target = Util:GetPlayerByName(args[2])
        if target then
            target:Kick("Kicked by " .. player.Name)
        end
    end
}
