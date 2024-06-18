local theme                    = {}
local dpi                      = require("beautiful.xresources").apply_dpi

theme.fg_normal                = "#cdd6f4"
theme.fg_focus                 = "#cba6f7"
theme.fg_urgent                = "#cdd6f4"
theme.bg_normal                = "#1E1E2E"
theme.bg_focus                 = "#1E1E2E"
theme.bg_urgent                = "#f38ba8"
theme.border_normal            = "#1E1E2E"
theme.border_focus             = "#cba6f7"
theme.border_marked            = "#cba6f7"
theme.tasklist_bg_focus        = "#1E1E2E"
theme.titlebar_bg_focus        = theme.bg_focus
theme.titlebar_bg_normal       = theme.bg_normal
theme.titlebar_fg_focus        = theme.fg_focus

theme.font                     = "Hack Nerd Font"
theme.border_width             = dpi(1)
theme.menu_height              = dpi(16)
theme.menu_width               = dpi(140)
theme.useless_gap              = dpi(0)

theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon    = true

return theme
