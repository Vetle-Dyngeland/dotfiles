local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local function player_widget(s)
    return wibox.widget({
        screen = s,
        widget = wibox.widget.textbox,
        markup = "",
        layout = wibox.layout.align.horizontal,
        {
            {
                widget = wibox.widget.imagebox,
                resize = true,
                visible = true,
                image = beautiful.awesome_icon,
                layout = wibox.layout.marigin,
            },
            {
                widget = wibox.widget.textbox,
                markup = "Song - Artist ",
                layout = wibox.layout.marigin,
            },
            layout = wibox.layout.align.horizontal,
            widget = wibox.container.marigin,
            left = 1,
            right = 1,
        },
    })
end


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
            title = get_tag(out, "title"),
            artist = get_tag(out, "artist"),
            album = get_tag(out, "album"),
            album_artist = get_tag(out, "albumArtist"),
            track_number = get_tag(out, "trackNumber"),
            track_id = get_tag(out, "track_id"),
            url = get_tag(out, "url"),
        }
    end)

    awful.spawn.easy_async("playerctl status", function(stdout)
        playing = stdout:find("Playing") ~= nil
    end)
end
get_media_info()

local data = {
    title = nil,
    artist = nil,
    album = nil,
    album_artist = nil,
    playing = nil,
    track_number = nil,
    track_id = nil,
    url = nil,
}

local function update()
    if playing == nil then goto ret end
    data[playing] = tostring(playing)

    if track_data == nil then goto ret end
    for i, v in ipairs(track_data) do
        data[i] = track_data[i]
    end

    ::ret::
    get_media_infO()
end

return player_widget
