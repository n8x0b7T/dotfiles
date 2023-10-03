return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.bufremove"},
    keys = {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
        { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
        options = {
            close_command = function(n) require("mini.bufremove").delete(n, false) end,
            right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
            diagnostics = "nvim_lsp",
            numbers = "ordinal",
            always_show_bufferline = false,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Files",
                    highlight = "Directory",
                    separator = true,
                    text_align = "left",
                },
            },
        },
    },
}
