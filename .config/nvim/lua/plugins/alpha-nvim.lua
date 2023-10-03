return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    opts = function()
        local dashboard = require("alpha.themes.theta")
        return dashboard.config
    end,

    config = function(_, dashboard)
        require("alpha").setup(dashboard)
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                print("⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms")
            end,
        })
    end,
}
