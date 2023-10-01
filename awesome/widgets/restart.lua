local awful = require("awful")

return awful.widget.button({
    image = require("beautiful").awesome_icon,
    shape = require("gears").shape.circle,
    widget = require("wibox").widget.textbox(),
    buttons = {
        awful.button({}, 1, nil, function() awesome.restart() end),
        awful.button({}, 2, nil, function() awesome.quit(1) end)
    }
})
