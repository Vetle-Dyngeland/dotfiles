return {
    taglist = function(s) return require("widgets.taglist")(s) end,
    textclock = require("widgets.textclock"),
    promptbox = require("widgets.promptbox"),
    tasklist = function(s) return require("widgets.tasklist")(s) end,
    tray = require("widgets.tray"),
    cpu = require("widgets.cpu"),
    audio = require("widgets.audio"),
    restart = require("widgets.restart"),
    media_vicious = require("widgets.media_vicious")
}
