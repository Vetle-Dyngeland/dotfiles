local naughty = require("naughty")
local dpi = require("beautiful").xresources.apply_dpi

naughty.config.padding = 8
naughty.config.spacing = 8
naughty.config.defaults.margin = dpi(5)
naughty.config.defaults.ontop = true
naughty.config.defaults.position = "top_middle"
naughty.config.defaults.font = "Hack Nerd Font"
naughty.config.defaults.icon = nil
naughty.config.defaults.icon_size = dpi(60)
naughty.config.defaults.border_width = 2
naughty.config.defaults.shape = function(cr, w, h)
    require("gears").shape.rounded_rect(cr, w, h, dpi(10))
end
naughty.config.defaults.hover_timeout = nil
