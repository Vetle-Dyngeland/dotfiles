local awful = require("awful")

local modkey = require("keys.mod").modkey

local tag_keys = awful.util.table.join(
    awful.key({ modkey, }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
    awful.key({ modkey, }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
    awful.key({ modkey, }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" })
)

local function tag_number_keys()
    local keys = {}
    for i = 1, 9 do
        keys = awful.util.table.join(keys,
            -- View tag only.
            awful.key({ modkey }, "#" .. i + 9,
                function()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        tag:view_only()
                    end
                end,
                { description = "view tag #" .. i, group = "tag" }),
            -- Toggle tag display.
            awful.key({ modkey, "Control" }, "#" .. i + 9,
                function()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        awful.tag.viewtoggle(tag)
                    end
                end,
                { description = "toggle tag #" .. i, group = "tag" }),
            -- Move client to tag.
            awful.key({ modkey, "Shift" }, "#" .. i + 9,
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
            awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
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
    return keys
end

return awful.util.table.join(tag_keys, tag_number_keys())
