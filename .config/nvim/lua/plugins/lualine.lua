return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                disabled_filetypes = { statusline = { "alpha" } },
                section_separators = '',
                component_separators = '',
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    {
                        "diagnostics",
                    },
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1, symbols = { modified = "•", readonly = "", unnamed = "" } },
                },
                lualine_x = {
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function()
                            return package.loaded["noice"] and
                                require("noice").api.status.command.has()
                        end,
                    },
                    { require("lazy.status").updates, cond = require("lazy.status").has_updates, },
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            extensions = { "neo-tree", "lazy" },
        }
    }
}
