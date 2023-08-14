local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local gears = require("gears")
local keybinds = require("keybinds")

local function promptbox_widget()
    return awful.widget.prompt()
end

local function taglist_widget(s)
    return awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = keybinds.widgetbuttons.taglist
    })
end

local function tasklist_widget(s)
    return awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = keybinds.widgetbuttons.tasklist,
        layout = {
            spacing = 4,
            spacing_widget = {
                widget = wibox.widget.seperator,
                forced_width = 5,
                shape = gears.shape.circle,
            },
            widget = wibox.container.place,
            layout = wibox.layout.flex.horizontal,
            valign = "center",
            halign = "center",
        },
        widget_template = {
            widget = wibox.container.background,
            id = "background_role",
            {
                widget = wibox.container.margin,
                margins = 5,
                {
                    layout = wibox.layout.fixed.horizontal,
                    {
                        widget = wibox.widget.imagebox,
                        id = "icon_role",
                    }
                },
            },
        }
    })
end

local function pulseaudio_widget()
    local v = lain.widget.pulse({
        settings = function()
            local display = volume_now.left .. "%"
            local icon
            if volume_now.muted == "yes" then
                icon = " 󰝟 "
            elseif tonumber(volume_now.left) > 65 then
                icon = " 󰕾 "
            elseif tonumber(volume_now.left) > 20 then
                icon = " 󰖀 "
            elseif tonumber(volume_now.left) > 0 then
                icon = " 󰕿 "
            else
                icon = " 󰸈 "
            end

            display = display .. icon
            widget:set_markup(lain.util.markup("#7493d2", display))
        end
    })

    v.widget:buttons(awful.util.table.join(
        awful.button({}, 1, function() -- left click
            awful.spawn("pavucontrol")
        end),
        awful.button({}, 2, function() -- middle click
            os.execute(string.format("pactl set-sink-volume %s 100%%", v.device))
            v.update()
        end),
        awful.button({}, 3, function() -- right click
            os.execute(string.format("pactl set-sink-mute %s toggle", v.device))
            v.update()
        end),
        awful.button({}, 4, function() -- scroll up
            os.execute(string.format("pactl set-sink-volume %s +1%%", v.device))
            v.update()
        end),
        awful.button({}, 5, function() -- scroll down
            os.execute(string.format("pactl set-sink-volume %s -1%%", v.device))
            v.update()
        end)
    ))

    return v
end

local function cpu_widget()
    return lain.widget.cpu({
        settings = function()
            local markup = "  " .. cpu_now.usage .. "%  "
            if tonumber(cpu_now.usage) > 70 then
                markup = lain.util.markup("#EE4B2B", markup)
            end
            widget:set_markup(markup)
        end
    })
end

local function top_wibar(s)
    return awful.wibar({
        screen = s,
        position = "top",
    })
end

return {
    setup = function(s)
        top_wibar(s):setup({
            layout = wibox.layout.align.horizontal,
            { -- Left
                layout = wibox.layout.fixed.horizontal,
                taglist_widget(s),
                promptbox_widget(),
            },
            expand = "none",
            tasklist_widget(s),
            { -- Right
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),

                cpu_widget(),
                pulseaudio_widget(),

                wibox.widget.textclock(),
            },
        })
    end
}
