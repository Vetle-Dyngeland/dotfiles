local awful = require("awful")

return function(s)
    return awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = require("options.keys.widgetbuttons.taglist")
    })
end
