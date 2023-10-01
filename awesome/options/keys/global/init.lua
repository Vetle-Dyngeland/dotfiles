local gears = require("gears")


local keys = {
    require("options.keys.global.tag"),
    require("options.keys.global.client"),
    require("options.keys.global.awesome"),
    require("options.keys.global.layout"),
    require("options.keys.global.media"),
    require("options.keys.global.misc"),
    require("options.keys.global.applications"),
}

local globalkeys = {}

for _, table in ipairs(keys) do
    globalkeys = gears.table.join(globalkeys, table)
end

return globalkeys
