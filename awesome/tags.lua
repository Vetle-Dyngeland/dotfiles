local awful = require("awful")

awful.layout.layouts = {
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating
}

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "1", "2", "3", "4", "5", }, s, awful.layout.layouts[1])
end)
