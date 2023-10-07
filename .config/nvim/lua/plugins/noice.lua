return {
    "folke/noice.nvim",
    opts = {
        routes = {
            {
                filter = {
                    event = "msg_show",
                    find = "nil",
                },
                opts = { skip = true },
            },
        },
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
