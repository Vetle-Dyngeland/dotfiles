local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local awful = require("awful")
local wibox = require("wibox")

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
        layout = {
            spacing = 5,
            max_widget_size = awful.screen.focused().workarea.width * 0.2,
            layout = wibox.layout.flex.horizontal()
        }
    })
end
