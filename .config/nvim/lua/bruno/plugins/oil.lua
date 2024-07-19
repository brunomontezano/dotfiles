return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"-",
				"<Cmd>Oil<CR>",
				mode = "n",
				desc = "Open parent directory",
			},
		},
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
		},
	},
}
