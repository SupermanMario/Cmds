local Util = require(script.Parent.Parent.Util)

return {
    run = function(player, args)
        local target = Util:GetPlayerByName(args[2]) or player
        local char = target.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Velocity = Vector3.new(0, 50, 0)
            end
        end
    end
}
