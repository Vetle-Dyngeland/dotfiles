local gears = require("gears")


local keys = {
    require("keys.global.tag"),
    require("keys.global.client"),
    require("keys.global.awesome"),
    require("keys.global.layout"),
    require("keys.global.media"),
    require("keys.global.misc"),
    require("keys.global.applications"),
}

local globalkeys = {}

for _, table in ipairs(keys) do
    globalkeys = gears.table.join(globalkeys, table)
end

return globalkeys
