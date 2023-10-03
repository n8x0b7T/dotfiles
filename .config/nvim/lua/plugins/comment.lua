return {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {
        mappings = {
            ---operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---extra mapping; `gco`, `gcO`, `gcA`
            extra = true,
        },
    },
}
