local M = {}

local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local gears = require("gears")

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)
local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end)
)

local function setup_widgets(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    })
end

local function volume()
    local v = lain.widget.pulse({
        settings = function()
            local display = volume_now.left .. "%"
            local icon
            if volume_now.muted == "yes" then
                icon = " 󰝟 "
            elseif tonumber(volume_now.left) > 80 then
                icon = " 󰕾 "
            elseif tonumber(volume_now.left) > 40 then
                icon = " 󰖀 "
            elseif tonumber(volume_now.left) > 0 then
                icon = " 󰕿 "
            else
                icon = " 󰸈 "
            end

            display = display .. icon
            widget:set_markup(lain.util.markup("#7493d2", display))
        end,
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

local function cpu()
    return lain.widget.cpu({
        settings = function()
            local markup = " " .. cpu_now.usage .. "%"
            if tonumber(cpu_now.usage) > 70 then
                markup = lain.util.markup("#EE4B2B", markup)
            end
            widget:set_markup(markup)
        end
    })
end

local function menu()
    require("awful.hotkeys_popup.keys")
    return awful.menu({
        items = {
            { "hotkeys",     function() require("awful.hotkeys_popup").show_help(nil, awful.screen.focused()) end },
            { "manual",      terminal .. " -e man awesome" },
            { "edit config", editor_cmd .. " " .. awesome.conffile },
            { "restart",     awesome.restart },
            { "quit",        function() awesome.quit() end },
        }
    })
end

local function left(s)
    local launcher = awful.widget.launcher({
        image = require("beautiful").awesome_icon,
        menu = menu(),
    })
    return {
        layout = wibox.layout.fixed.horizontal,
        launcher,
        s.mytaglist,
        s.mypromptbox
    }
end

local function middle(s)
    return s.mytasklist
end

local function right(s)
    return {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),

        cpu(),
        volume(),

        awful.widget.keyboardlayout(),
        wibox.widget.textclock(),
        s.mylayoutbox
    }
end


function M.setup(s, b)
    setup_widgets(s, b)
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    s.mywibox:setup({
        layout = wibox.layout.align.horizontal,
        left(s),
        middle(s),
        right(s)
    })
end

return M
