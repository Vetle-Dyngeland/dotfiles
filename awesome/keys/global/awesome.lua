local awful = require("awful")
local modkey = require("keys.mod").modkey

return awful.util.table.join(
    awful.key({ modkey, }, "s", require("awful.hotkeys_popup").show_help,
        { description = "show help", group = "awesome" }),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" })
)
