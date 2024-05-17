return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require("null-ls").setup({
                        sources = {}
                    })
                end
            },
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "black", "clang-format" },
                automatic_installation = false,
                handlers = {},
            })
        end
    },
}
