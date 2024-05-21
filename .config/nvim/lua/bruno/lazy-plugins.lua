require('lazy').setup({

        require 'bruno.plugins.plenary',

        require 'bruno.plugins.quarto',

        require 'bruno.plugins.autopairs',

        require 'bruno.plugins.otter',

        require 'bruno.plugins.vimtex',

        require 'bruno.plugins.catppuccin',

        require 'bruno.plugins.iron',

        require 'bruno.plugins.treesitter',

        require 'bruno.plugins.lsp',

        require 'bruno.plugins.conform',

        require 'bruno.plugins.cmp',

        require 'bruno.plugins.telescope',

        require 'bruno.plugins.lint',
    },
    {
        ui = {
            icons = vim.g.have_nerd_font and {} or {
                cmd = '⌘',
                config = '🛠',
                event = '📅',
                ft = '📂',
                init = '⚙',
                keys = '🗝',
                plugin = '🔌',
                runtime = '💻',
                require = '🌙',
                source = '📄',
                start = '🚀',
                task = '📌',
                lazy = '💤 ',
            },
        },
    })
