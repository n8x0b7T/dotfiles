return {
    "folke/noice.nvim",
    opts = {
        lsp = {
            signature = {
                enabled = false
            },
            hover = {
                enabled = false
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true,
        },
    },
}
