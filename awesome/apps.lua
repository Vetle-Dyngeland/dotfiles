local menubar = require("menubar")

local apps = {
    terminal = "kitty",
    editor = "nvim",
    explorer = "nemo"
}

apps.editor_cmd = apps.terminal .. " -e " .. apps.editor
apps.explorer_cmd = apps.terminal .. " -e " .. apps.explorer
menubar.utils.terminal = apps.terminal

return apps
