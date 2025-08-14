local Config = require(script.Parent.Config)

local Notify = {}

function Notify:Send(player, text)
    player:SendNotification({
        Title = Config.NotifyStyle.Title,
        Text = text,
        Duration = Config.NotifyStyle.Duration
    })
end

return Notify
