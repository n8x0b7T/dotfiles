return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
        { "<leader>fs", "<cmd>Telescope grep_string<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    },
    opts = {
        pickers = {
            find_files = {
                hidden = true
            }
        },
        defaults = {
            vimgrep_arguments =
            {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden"
            },
            file_ignore_patterns = {
                "node_modules/",
                ".git/",
                "%.lock",
            }
        },
    }
}
