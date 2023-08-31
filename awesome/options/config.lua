local dpi = require("beautiful.xresources").apply_dpi
local awful = require("awful")

awful.screen.connect_for_each_screen(function(s)
    function Vw(width)
        return (s.geometry.width / 100) * width
    end

    function Vh(height)
        return (s.geometry.height / 100) * height
    end
end)
return {
    toppanel_height = dpi(20),
}
