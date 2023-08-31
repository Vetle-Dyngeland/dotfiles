local opt = vim.opt
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.markdown_recommended_style = 0

opt.termguicolors = true
opt.colorcolumn = "80"
opt.signcolumn = "yes"

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 10
opt.isfname:append("@-@")

opt.updatetime = 50

opt.undofile = true
opt.undolevels = 10000
opt.winminwidth = 4

if vim.fn.has("nvim-0.9.0") == 1 then
    opt.splitkeep = "screen"
    opt.shortmess:append({ C = true })
end
