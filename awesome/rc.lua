pcall(require, "luarocks.loader")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("awful").spawn.with_shell("~/.config/awesome/autostart.sh")

require("beautiful").init("~/.config/awesome/themes/catppuccin/themes/catppuccin/theme.lua")

require("modules.focus")
require("ui")

require("options.init")
require("options.client")
require("options.tags")
root.keys(require("options.keys.global"))

require("signals")
require("errors")
