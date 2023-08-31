local awful = require("awful")
local top_panel = require("ui.top-panel")

require("beautiful").useless_gap = 5

awful.screen.connect_for_each_screen(
    function(s)
        s.top_panel = top_panel(s)
    end
)

local function update_bars_visibility()
    for s in screen do
        if s.top_panel == nil then
            return
        end

        if s.selected_tag then
            local fullscreen = s.selected_tag.fullscreenMode

            s.top_panel.visible = not fullscreen
        end
    end
end

tag.connect_signal(
    'property::selected',
    function(t)
        update_bars_visibility()
    end
)

client.connect_signal(
    'property::fullscreen',
    function(c)
        c.screen.selected_tag.fullscreenMode = c.fullscreen
        update_bars_visibility()
    end
)

client.connect_signal(
    'unmanage',
    function(c)
        if c.fullscreen then
            c.screen.selected_tag.fullscreenMode = false
            update_bars_visibility()
        end
    end
)
