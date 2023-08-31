local awful = require("awful")

return awful.widget.button({
    image = require("beautiful").awesome_icon,
    buttons = {
        awful.button({}, 1, nil, function() awesome.restart() end)
    }
})
