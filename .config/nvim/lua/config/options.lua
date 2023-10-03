vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
-- vim.opt.termguicolors = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- incremental search
-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

-- just in case
vim.cmd('command W  write')

-- hide mouse warning
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-1-]]

-- see you never
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.opt.termguicolors = true
