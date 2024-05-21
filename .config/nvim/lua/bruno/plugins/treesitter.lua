return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"query",
					"python",
					"r",
					"julia",
					"html",
					"css",
					"bash",
					"dockerfile",
					"markdown",
					"latex",
					"gitignore",
				},
				sync_install = false,
				auto_install = true,
				ignore_install = { "javascript" },
				highlight = {
					enable = true,
					disable = { "latex" },
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
