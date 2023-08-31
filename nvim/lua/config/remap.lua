local map = vim.keymap.set

local function opts(description)
    return { silent = true, noremap = true, desc = description }
end

-- Movement
map("n", "<A-j>", "<cmd>m .+1<cr>==", opts("Move down"))
map("n", "<A-k>", "<cmd>m .-2<cr>==", opts("Move up"))
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", opts("Move down"))
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", opts("Move up"))
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts("Move down"))
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts("Move up"))

map("n", "<A-l>", "xp", opts("Move right"))
map("n", "<A-h>", "xhP", opts("Move left"))
map("i", "<A-l>", "<esc>lxpga", opts("Move right"))
map("i", "<A-h>", "<esc>xhPa", opts("Move left"))

map("n", "<A-O>", "O<esc>")
map("n", "<A-o>", "o<esc>")

-- Windows
map("n", "<leader>ww", function()
    local width = vim.fn.input("Width > ")

    vim.cmd("vert res " .. width .. "<cr>")
end, opts("Change window width"))
map("n", "<leader>wh", function()
    local height = vim.fn.input("Height > ")

    vim.cmd("res " .. height .. "<cr>")
end, opts("Change window height"))

-- Other
map("t", "<leader>qq", "<C-\\><C-n>")
map("n", "<leader>rm", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts("Search and replace"))
