local awful = require("awful")

return awful.util.table.join(
    awful.key({}, "XF86AudioRaiseVolume",
        function() awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +2%") end,
        { description = "Increase volume", group = "media" }),
    awful.key({}, "XF86AudioLowerVolume",
        function() awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -2%") end,
        { description = "Decrease volume", group = "media" }),
    awful.key({}, "XF86AudioMute",
        function() awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle") end,
        { description = "Mute volume", group = "media" }),

    awful.key({}, "XF86AudioPlay",
        function() awful.spawn.with_shell("playerctl play-pause") end,
        { description = "Play/Pause media", group = "media" }),
    awful.key({}, "XF86AudioStop",
        function() awful.spawn.with_shell("playerctl stop") end,
        { description = "Stop media", group = "media" }),
    awful.key({}, "XF86AudioNext",
        function() awful.spawn.with_shell("playerctl next") end,
        { description = "Next media", group = "media" }),
    awful.key({}, "XF86AudioPrev",
        function() awful.spawn.with_shell("playerctl previous") end,
        { description = "Previous media", group = "media" })
)
