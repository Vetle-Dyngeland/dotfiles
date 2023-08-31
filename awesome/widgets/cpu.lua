local lain = require("lain")

return lain.widget.cpu({
    settings = function()
        local markup = "  " .. cpu_now.usage .. "%  "
        if tonumber(cpu_now.usage) > 70 then
            markup = lain.util.markup("#EE4B2B", markup)
        end
        widget:set_markup(markup)
    end
})
