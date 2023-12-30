local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {

    'quarto-dev/quarto-nvim',
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}
    },
    {
        'jmbuhr/otter.nvim',
        opts = {
            buffers = {
                set_filetype = true,
            },
        },
    },
    'lervag/vimtex',
    { 'catppuccin/nvim',                 name = 'catppuccin' },
    { 'Vigemus/iron.nvim' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Automatic LSP servers
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-path' }
        }
    },
}

require("lazy").setup(plugins, {})
