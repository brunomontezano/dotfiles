return {
	{
		"mistricky/codesnap.nvim",
		build = "make build_generator",
		keys = {
			{
				"<leader>cc",
				"<Esc><cmd>CodeSnap<cr>",
				mode = "x",
				desc = "Save selected [c]ode snapshot into [c]lipboard",
			},
			{
				"<leader>cs",
				"<Esc><cmd>CodeSnapSave<cr>",
				mode = "x",
				desc = "Save selected [c]ode [s]napshot in Screenshots directory",
			},
		},
		opts = {
			save_path = "/media/data/img/Screenshots",
			has_breadcrumbs = true,
			bg_theme = "bamboo",
			has_line_number = true,
			bg_color = "#535c68",
			watermark = "",
            mac_window_bar = false
		},
	},
}
