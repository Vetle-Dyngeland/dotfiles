local function load_files(path)
    local t = {}

    for file in io.popen("ls -pa " .. path):lines() do
        -- If the file is a directory, and is not ./ or ../,
        -- source all files in that directory
        if file:sub(-1) == "/" then
            if not file:match("%./") then
                for _, plugin in ipairs(load_files(path .. file)) do
                    table.insert(t, plugin)
                end
            end
            goto continue
        end
        -- If it is not a lua file, ignore it
        if not file:match(".lua") then
            goto continue
        end

        -- Fix the string
        local fixed = (path .. file)         -- The full path
            :gsub("~/.config/nvim/lua/", "") -- Without the start
            :gsub("/", "%.")                 -- Changing all / to .
            :sub(0, -5)                      -- Without the .lua on the end
        table.insert(t, require(fixed))
        ::continue::
    end

    return t
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = load_files("~/.config/nvim/lua/plugins/")

require("lazy").setup(plugins)

print("Loaded "..#plugins.." plugin files!")
