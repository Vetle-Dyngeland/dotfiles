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

for _, t in ipairs(keys) do
    globalkeys = require("awful").util.table.join(globalkeys, t)
end

return globalkeys
