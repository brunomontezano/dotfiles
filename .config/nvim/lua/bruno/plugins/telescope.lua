return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [f]iles"})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind using [g]rep"})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [b]uffers"})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [h]elp tags"})
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [k]eymaps"})
		vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "[F]ind [c]olorschemes"})
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "[F]ind [r]eferences"})
		vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "[F]ind [d]efinitions"})
	end,
}
