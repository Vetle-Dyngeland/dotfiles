local awful = require("awful")
local gears = require("gears")

local globalkeys
local clientkeys
local clientbuttons
local widgetbuttons

-- Remove "undefined global" warning
Modkey = Modkey

-- Globalkeys
local function g_tag_keys()
    globalkeys = gears.table.join(globalkeys,
        awful.key({ Modkey, }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
        awful.key({ Modkey, }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
        awful.key({ Modkey, }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" })
    )
end

local function g_tag_number_keys()
    for i = 1, 9 do
        globalkeys = gears.table.join(globalkeys,
            -- View tag only.
            awful.key({ Modkey }, "#" .. i + 9,
                function()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        tag:view_only()
                    end
                end,
                { description = "viei tag #" .. i, group = "tag" }),
            -- Toggle tag display.
            awful.key({ Modkey, "Control" }, "#" .. i + 9,
                function()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        awful.tag.viewtoggle(tag)
                    end
                end,
                { description = "toggle tag #" .. i, group = "tag" }),
            -- Move client to tag.
            awful.key({ Modkey, "Shift" }, "#" .. i + 9,
                function()
                    if client.focus then
                        local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:move_to_tag(tag)
                        end
                    end
                end,
                { description = "move focused client to tag #" .. i, group = "tag" }),
            -- Toggle tag on focused client.
            awful.key({ Modkey, "Control", "Shift" }, "#" .. i + 9,
                function()
                    if client.focus then
                        local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:toggle_tag(tag)
                        end
                    end
                end,
                { description = "toggle focused client on tag #" .. i, group = "tag" })
        )
    end
end

local function g_client_keys()
    globalkeys = gears.table.join(globalkeys,
        awful.key({ Modkey, }, "j", function() awful.client.focus.byidx(1) end,
            { description = "focus next by index", group = "client" }),
        awful.key({ Modkey, }, "k", function() awful.client.focus.byidx(-1) end,
            { description = "focus previous by index", group = "client" }),
        awful.key({ Modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
            { description = "swap with next client by index", group = "client" }),
        awful.key({ Modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
            { description = "swap with previous client by index", group = "client" }),
        awful.key({ Modkey, }, "u", awful.client.urgent.jumpto,
            { description = "jump to urgent client", group = "client" }),
        awful.key({ Modkey, }, "Tab",
            function()
                awful.client.focus.history.previous()
                if g_client_keys().focus then
                    g_client_keys().focus:raise()
                end
            end,
            { description = "go back", group = "client" }),
        awful.key({ Modkey, "Control" }, "n",
            function()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", { raise = true }
                    )
                end
            end,
            { description = "restore minimized", group = "client" })
    )
end

local function g_awesome_keys()
    globalkeys = gears.table.join(globalkeys,
        awful.key({ Modkey, }, "s", require("awful.hotkeys_popup").show_help,
            { description = "show help", group = "awesome" }),
        awful.key({ Modkey, "Control" }, "r", awesome.restart,
            { description = "reload awesome", group = "awesome" }),
        awful.key({ Modkey, "Shift" }, "q", awesome.quit,
            { description = "quit awesome", group = "awesome" })
    )
end

local function g_layout_keys()
    globalkeys = gears.table.join(globalkeys,
        awful.key({ Modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
            { description = "increase master width factor", group = "layout" }),
        awful.key({ Modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
            { description = "decrease master width factor", group = "layout" }),
        awful.key({ Modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
            { description = "increase the number of master clients", group = "layout" }),
        awful.key({ Modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
            { description = "decrease the number of master clients", group = "layout" }),
        awful.key({ Modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
            { description = "increase the number of columns", group = "layout" }),
        awful.key({ Modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
            { description = "decrease the number of columns", group = "layout" }),
        awful.key({ Modkey, }, "space", function() awful.layout.inc(1) end,
            { description = "select next", group = "layout" }),
        awful.key({ Modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
            { description = "select previous", group = "layout" })
    )
end

local function g_misc_keys()
    globalkeys = gears.table.join(globalkeys,
        awful.key({ Modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
            { description = "focus the next screen", group = "screen" }),
        awful.key({ Modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
            { description = "focus the previous screen", group = "screen" }),
        awful.key({ Modkey }, "r", function() awful.util.spawn("dmenu_run") end,
            { description = "run dmenu", group = "launcher" }),
        awful.key({ Modkey }, "p", function() require("menubar").show() end,
            { description = "show the menubar", group = "launcher" }),
        awful.key({ Modkey, }, "Return", function() awful.spawn(terminal) end,
            { description = "open a terminal", group = "launcher" })
    )
end

local function g_application_keys()
    globalkeys = gears.table.join(globalkeys,
        awful.key({ Modkey }, "b", function() awful.util.spawn("firefox") end,
            { description = "firefox", group = "applications" }),
        awful.key({ Modkey }, "i", function() awful.util.spawn("nemo") end,
            { description = "nemo", group = "applications" })
    )
end

local function c_client_keys()
    clientkeys = gears.table.join(
        awful.key({ Modkey, }, "f",
            function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            { description = "toggle fullscreen", group = "client" }),
        awful.key({ Modkey, "Shift" }, "c", function(c) c:kill() end,
            { description = "close", group = "client" }),
        awful.key({ Modkey, "Control" }, "space", awful.client.floating.toggle,
            { description = "toggle floating", group = "client" }),
        awful.key({ Modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
            { description = "move to master", group = "client" }),
        awful.key({ Modkey, }, "o", function(c) c:move_to_screen() end,
            { description = "move to screen", group = "client" }),
        awful.key({ Modkey, }, "t", function(c) c.ontop = not c.ontop end,
            { description = "toggle keep on top", group = "client" }),
        awful.key({ Modkey, }, "n",
            function(c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end,
            { description = "minimize", group = "client" }),
        awful.key({ Modkey, }, "m",
            function(c)
                c.maximized = not c.maximized
                c:raise()
            end,
            { description = "(un)maximize", group = "client" }),
        awful.key({ Modkey, "Control" }, "m",
            function(c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end,
            { description = "(un)maximize vertically", group = "client" }),
        awful.key({ Modkey, "Shift" }, "m",
            function(c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end,
            { description = "(un)maximize horizontally", group = "client" })
    )
end

local function c_clientbuttons()
    clientbuttons = gears.table.join(
        awful.button({}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end),
        awful.button({ Modkey }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({ Modkey }, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )
end

local function w_taglist()
    widgetbuttons.taglist = gears.table.join(
        awful.button({}, 1, function(t) t:view_only() end),
        awful.button({ Modkey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({ Modkey }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end),
        awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
        awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end))
end

local function w_tasklist()
    widgetbuttons.tasklist = gears.table.join(
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
end

local function init_globalkeys()
    globalkeys = {}
    g_tag_keys()
    g_tag_number_keys()
    g_client_keys()
    g_awesome_keys()
    g_layout_keys()
    g_misc_keys()
    g_application_keys()
end

local function init_clientkeys()
    clientkeys = {}
    c_client_keys()
end

local function init_widgetbuttons()
    widgetbuttons = {}
    w_taglist()
    w_tasklist()
end

local function init_clientbuttons()
    clientbuttons = {}
    c_clientbuttons()
end

init_globalkeys()
init_clientkeys()
init_clientbuttons()
init_widgetbuttons()

return {
    globalkeys = globalkeys,
    clientkeys = clientkeys,
    clientbuttons = clientbuttons,
    widgetbuttons = widgetbuttons
}
