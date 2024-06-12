return {
	"Vigemus/iron.nvim",
	keys = {
		{
			"<leader>rs",
			function()
				vim.api.nvim_command("IronRepl")
			end,
			mode = "n",
			desc = "[R]EPL [S]tart",
		},
		{
			"<leader>rr",
			function()
				vim.api.nvim_command("IronRestart")
			end,
			mode = "n",
			desc = "[R]EPL [R]estart",
		},
		{
			"<leader>rf",
			function()
				vim.api.nvim_command("IronFocus")
			end,
			mode = "n",
			desc = "[R]EPL [F]ocus",
		},
		{
			"<leader>rh",
			function()
				vim.api.nvim_command("IronHide")
			end,
			mode = "n",
			desc = "[R]EPL [H]ide",
		},
	},
	config = function()
		local iron = require("iron.core")

		iron.setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					sh = {
						command = { "bash" },
					},
					r = {
						command = { "R" },
					},
					python = {
						command = { "ipython" },
					},
					julia = {
						command = { "julia" },
					},
					sql = {
						command = { "sqlite3" },
					},
				},
				repl_open_cmd = require("iron.view").split.vertical.botright(0.5),
			},
			keymaps = {
				send_motion = "<space>sc",
				visual_send = "<space>sc",
				send_file = "<space>sf",
				send_line = "<space>sl",
				send_until_cursor = "<space>su",
				send_mark = "<space>sm",
				mark_motion = "<space>mc",
				mark_visual = "<space>mc",
				remove_mark = "<space>md",
				cr = "<space>s<cr>",
				interrupt = "<space>s<space>",
				exit = "<space>sq",
				clear = "<space>cl",
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true,
		})
	end,
}
