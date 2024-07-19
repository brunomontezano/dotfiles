return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			{
				"jmbuhr/otter.nvim",
				opts = {
					buffers = {
						write_to_disk = true,
					},
				},
			},
		},
		ft = "quarto",
		config = function()
			local quarto = require("quarto")
			local config = require("quarto.config").config

			vim.keymap.set(
				"n",
				"<leader>qp",
				quarto.quartoPreview,
				{ silent = true, noremap = true, desc = "[Q]uarto [P]review" }
			)
			vim.keymap.set(
				"n",
				"<leader>qc",
				quarto.quartoClosePreview,
				{ silent = true, noremap = true, desc = "[Q]uarto [C]lose Preview" }
			)

			if config.lspFeatures.enabled then
				quarto.activate()
			end

			vim.diagnostic.config({ virtual_text = false })
		end,
		opts = {
			debug = false,
			closePreviewOnExit = true,
			lspFeatures = {
				enabled = true,
				chunks = "curly",
				languages = { "r", "python", "julia", "bash", "html" },
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
				ft_runners = {},
				never_run = { "yaml" },
			},
		},
	},
}
