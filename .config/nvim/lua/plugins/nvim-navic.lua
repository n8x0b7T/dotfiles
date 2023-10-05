return {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
        vim.g.navic_silence = true
        local navic = require("nvim-navic")

        require("lspconfig").clangd.setup {
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end
        }
    end,
    opts = function()
        return {
            separator = " ",
            highlight = true,
            depth_limit = 5,
        }
    end,
}
