return {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
        config = function()
            require("nvim-autopairs").setup({})
        end,
}
