local CommandHandler = require(script.CommandHandler)

game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        CommandHandler:Process(player, message)
    end)
end)
