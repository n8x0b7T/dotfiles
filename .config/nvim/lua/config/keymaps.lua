vim.g.mapleader = " "

-- center cursor for pg up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<C-c>", "<Esc>")
-- clear search highlights
vim.keymap.set("n", "<C-c>", "<cmd>noh<cr>")

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("n", "<C-L>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>")
vim.keymap.set("n", "<leader>n", "<cmd>enew<cr>")
