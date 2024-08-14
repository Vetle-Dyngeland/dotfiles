local keys = {
    require("keys.client.client"),
}

local clientkeys = {}
for _, table in ipairs(keys) do
    clientkeys = require("awful").util.table.join(clientkeys, table)
end

return clientkeys
