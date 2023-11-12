pcall(require, "luarocks.loader")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("awful").spawn.with_shell("~/.config/awesome/autostart.sh")

require("beautiful").init("~/.config/awesome/themes/catppuccin/theme.lua")

require("errors")

require("focus")
require("top-panel")
require("signals")
require("notifs")

require("rules")
require("tags")
require("apps")

root.keys(require("keys.global"))
