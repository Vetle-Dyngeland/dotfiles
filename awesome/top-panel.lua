local awful = require("awful")
local wibox = require("wibox")

local theme = require("themes.catppuccin.theme")
local widgets = require("widgets")

local vicious = require("vicious")
local net_widgets = require("net_widgets")
--local lain = require("lain")

local function new_top_panel(s)
    return awful.wibar({
        position = "top",
        height = theme.toppanel_height,
        opacity = 0,
        screen = s
    })
end

local function top_panel(s)
    local uptime = wibox.widget.textbox()
    vicious.register(uptime, vicious.widgets.uptime, "up: $3m ", 10)

    local separator = wibox.widget.textbox();
    separator.text = " ";
    local pacman = require("awesome-wm-widgets.pacman-widget.pacman")()

    new_top_panel(s):setup({
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.align.horizontal,
            widgets.taglist(s),
            widgets.tray,
            widgets.promptbox
        },
        expand = "none",
        widgets.tasklist(s),
        {
            layout = wibox.layout.fixed.horizontal,
            --widgets.media(s),
            pacman,
            separator,
            uptime,
            net_widgets.wireless(),
            widgets.textclock,
            require("awesome-wm-widgets.logout-menu-widget.logout-menu")({
                font = "Hack Nerd Font Regular",
                onlock = function() awful.spawn.with_shell("i3lock") end
            }),
        }
    })
end

awful.screen.connect_for_each_screen(function(s)
    s.top_panel = top_panel(s)
end)
