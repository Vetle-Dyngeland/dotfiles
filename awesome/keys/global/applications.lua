local awful = require("awful")
local modkey = require("keys.mod").modkey

return require("gears").table.join(
    awful.key({ modkey }, "b", function() awful.util.spawn("firefox") end,
        { description = "firefox", group = "applications" }),
    awful.key({ modkey }, "i", function() awful.util.spawn("nemo") end,
        { description = "nemo", group = "applications" })
)
