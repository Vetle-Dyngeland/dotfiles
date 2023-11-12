local gears = require("gears")
local awful = require("awful")

return function(s)
    return awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = require("keys.widgetbuttons.tasklist"),
        style = {
            border_width = 3,
            border_color = "#777777",
            shape = gears.shape.rounded_bar,
        },
    })
end
