return {
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto" },
		dev = false,
		opts = {
			lspFeatures = {
				enabled = true,
				languages = {
					"r",
					"python",
					"julia",
				},
			},
		},
		codeRunner = {
			enabled = true,
			default_method = "molten",
			ft_runners = {
				python = "python",
				r = "R",
				julia = "julia",
			},
			never_run = { "yaml" },
		},
	},
	{
		"benlubas/molten-nvim",
		build = ":UpdateRemotePlugins",
		keys = {
			{
				"<leader>mi",
				":MoltenInit<cr>",
				desc = "[m]olten [i]nit",
			},
			{
				"<leader>ml",
				":MoltenEvaluateLine<cr>",
				desc = "[m]olten eval [l]ine",
			},
			{
				"<leader>mv",
				":<C-u>MoltenEvaluateVisual<cr>",
				mode = "v",
				desc = "[m]olten eval [v]isual",
			},
			{
				"<leader>mr",
				":MoltenReevaluateCell<cr>",
				desc = "[m]olten [r]e-eval cell",
			},
		},
	},
}
