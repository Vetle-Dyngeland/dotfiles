local wibox = require("wibox")
local awful = require("awful")

local config = require("options.config")
local widgets = require("widgets")

local function shape(cr, width, height)
    return require("gears").shape.rounded_rect(cr, width, height, 7)
end

local function container()
    return wibox({
        ontop = true,
        opacity = 1,
    })
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
    toppanel(s):setup({
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.align.horizontal,
            widgets.restart,
             widgets.taglist(s),
            widgets.promptbox
        },
        expand = "none",
        widgets.tasklist(s),
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.tray,
            widgets.cpu,
            widgets.audio,
            widgets.textclock
        }
    })
end
