local lain = require("lain")

local v = lain.widget.pulse({
    settings = function()
        if tonumber(volume_now.left) == nil then
            return
        end

        local icon = " 󰸈 "
        if volume_now.muted == "yes" then
            icon = " 󰝟 "
        elseif tonumber(volume_now.left) > 65 then
            icon = " 󰕾 "
        elseif tonumber(volume_now.left) > 20 then
            icon = " 󰖀 "
        elseif tonumber(volume_now.left) > 0 then
            icon = " 󰕿 "
        end

        local display = volume_now.left .. "%"
        display = display .. icon

        widget:set_markup(lain.util.markup("#7493d2", display))
    end,
})

v.widget:buttons(require("options.keys.widgetbuttons.audio")(v))

return v
