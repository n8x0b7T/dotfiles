
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.sidescrolloff = 8
-- opt.termguicolors = true

-- tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- incremental search
-- opt.hlsearch = false
-- opt.incsearch = true

opt.confirm = true
opt.wrap = false

opt.spell = true

-- just in case
vim.cmd('command W  write')

-- hide mouse warning
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-1-]]

-- see you never
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

opt.termguicolors = true
