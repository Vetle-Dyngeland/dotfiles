local beautiful = require("beautiful")

if not beautiful.border_focus or not beautiful.border_normal then
    return
end

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
