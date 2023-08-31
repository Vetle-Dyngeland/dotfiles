local gears = require("gears")

local keys = {
    require("options.keys.client.client"),
}

local clientkeys = {}
for _, table in ipairs(keys) do
    clientkeys = gears.table.join(clientkeys, table)
end

return clientkeys
