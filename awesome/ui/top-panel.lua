local wibox = require("wibox")
local awful = require("awful")

local config = require("options.config")
local widgets = require("widgets")
local vicious = require("vicious")

local function vicious_widgets()
    local uptime = wibox.widget.textbox()
    vicious.register(uptime, vicious.widgets.uptime, "up: $3m ", 10)

    local media_widget = wibox.widget.textbox()
    vicious.register(media_widget, widgets.media_vicious, "$2 - $3  ", 0.5)

    return {
        uptime = uptime,
        media_self_created = media_widget
    }
end

local function toppanel(s)
    return awful.wibar({
        position = "top",
        height = config.toppanel_height,
        opacity = 0,
        screen = s,
    })
end

return function(s)
    local vicious = vicious_widgets()

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
            --vicious.media_self_created,
            vicious.uptime,
            widgets.cpu,
            widgets.audio,
            widgets.textclock
        }
    })
end
