local awful = require("awful")

awful.layout.layouts = {
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating
}

awful.tag({ "code", "game", "steam", }, 1, awful.layout.layouts[1])
awful.tag({ "main", "other", "spotify", "discord", }, 2, awful.layout.layouts[1])

--awful.screen.connect_for_each_screen(function(s)
--    awful.tag({ "1", "2", "3", "4", "5", }, s, awful.layout.layouts[1])
--end)
