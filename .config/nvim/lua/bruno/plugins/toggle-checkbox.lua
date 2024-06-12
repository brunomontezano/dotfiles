return {
	{
		"opdavies/toggle-checkbox.nvim",
		keys = {
			{
				"<leader>tt",
				function()
					require("toggle-checkbox").toggle()
				end,
				mode = "n",
				desc = "[Tt]oggle Markdown checkbox",
			},
		},
	},
}
