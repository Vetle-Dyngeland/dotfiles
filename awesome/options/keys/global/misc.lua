local awful = require("awful")
local modkey = require("options.keys.mod").modkey

return require("gears").table.join(
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey }, "r", function() awful.util.spawn("dmenu_run") end,
        { description = "run dmenu", group = "launcher" }),
    awful.key({ modkey }, "p", function() require("menubar").show() end,
        { description = "show the menubar", group = "launcher" }),
    awful.key({ modkey, }, "Return", function() awful.spawn(require("menubar").utils.terminal) end,
        { description = "open a terminal", group = "launcher" })
)
