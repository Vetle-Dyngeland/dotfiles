local awful = require("awful")
local helpers = require "vicious.helpers"
local naughty = require("naughty")

local function get_tag(text, tag)
    local idx = text:find(":" .. tag)
    local end_idx = text:find("\n", idx)
    if not idx or not end_idx then return "nil" end

    local sub_string = text:sub(idx + tag:len() + 1, end_idx - 1)
    if sub_string == nil then return "nil" end

    while sub_string:sub(1, 1) == " " do
        sub_string = sub_string:sub(2, end_idx - 1)
        if sub_string == nil or sub_string:len() < 2 then return "nil" end
    end

    return sub_string
end

local track_data
local playing
local function get_media_info()
    awful.spawn.easy_async("playerctl metadata", function(out)
        track_data = {
            get_tag(out, "title"),
            get_tag(out, "artist"),
            get_tag(out, "album"),
            get_tag(out, "albumArtist"),
            get_tag(out, "trackNumber"),
            get_tag(out, "track_id"),
            get_tag(out, "url")
        }
    end)

    awful.spawn.easy_async("playerctl status", function(stdout)
        playing = stdout:find("Playing") ~= nil
    end)
end

local data = {}
for i = 1, 9, 1 do
    data[i] = "nil"
end

get_media_info()

return helpers.setcall(function()
    if playing == nil then goto ret end
    data[1] = tostring(playing)

    if track_data == nil then goto ret end
    for i, v in ipairs(track_data) do
        data[i + 1] = v
    end
    ::ret::
    get_media_info()

    return data
end)
