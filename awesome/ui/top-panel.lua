local wibox = require("wibox")
local awful = require("awful")

local config = require("options.config")
local widgets = require("widgets")
--local vicious = require("vicious")

--local function vicious_widgets()
--    local uptime = wibox.widget.textbox()
--    vicious.register(uptime, vicious.widgets.uptime, "up: $3m ", 10)
--
--    local date_widget = wibox.widget.textbox()
--    vicious.register(date_widget, vicious.widgets.date, "%b %d", 0.5)
--
--
--    return {
--        date = date_widget,
--        uptime = uptime
--    }
--end

local function shape(cr, width, height)
    return require("gears").shape.rounded_rect(cr, width, height, 7)
end

local function toppanel(s)
    return awful.wibar({
        position = "top",
        height = config.toppanel_height,
        opacity = 0,
        screen = s,
        shape = shape
    })
end

return function(s)
--    local v = vicious_widgets()

    toppanel(s):setup({
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.align.horizontal,
            widgets.restart,
            widgets.taglist(s),
            widgets.tray,
            widgets.promptbox
        },
        expand = "none",
        widgets.tasklist(s),
        {
            layout = wibox.layout.fixed.horizontal,
 --           v.uptime,
            widgets.cpu,
            widgets.audio,
            widgets.textclock
        }
    })
end
