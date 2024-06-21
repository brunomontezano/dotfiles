return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"query",
				"python",
				"r",
				"julia",
				"html",
                "javascript",
				"css",
				"bash",
				"dockerfile",
				"markdown",
				"latex",
				"gitignore",
			},
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				disable = { "latex" },
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
