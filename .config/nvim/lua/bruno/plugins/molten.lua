return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		build = ":UpdateRemotePlugins",
		keys = {
			{
				"<leader>mi",
				":MoltenInit<cr>",
				desc = "[M]olten [i]nit",
			},

			{
				"<leader>mv",
				":<C-u>MoltenEvaluateVisual<cr>",
				mode = "v",
				desc = "[M]olten evaluate [v]isual selection",
			},

			{
				"<leader>mr",
				":MoltenReevaluateCell<cr>",
				desc = "[M]olten [r]e-evaluate cell",
			},

			{
				"<leader>ml",
				":MoltenEvaluateLine<cr>",
				desc = "[M]olten evaluate [l]ine",
			},
		},
	},
}
