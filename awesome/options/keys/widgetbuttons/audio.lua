local gears = require("gears")
local awful = require("awful")

return function(v)
    return gears.table.join(
        awful.button({}, 1, function() -- left click
            awful.spawn("pavucontrol")
        end),
        awful.button({}, 2, function() -- middle click
            os.execute(string.format("pactl set-sink-volume %s 100%%", v.device))
            v.update()
        end),
        awful.button({}, 3, function() -- right click
            os.execute(string.format("pactl set-sink-mute %s toggle", v.device))
            v.update()
        end),
        awful.button({}, 4, function() -- scroll up
            os.execute(string.format("pactl set-sink-volume %s +1%%", v.device))
            v.update()
        end),
        awful.button({}, 5, function() -- scroll down
            os.execute(string.format("pactl set-sink-volume %s -1%%", v.device))
            v.update()
        end)
    )
end
