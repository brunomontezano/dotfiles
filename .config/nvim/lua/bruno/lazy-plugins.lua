require("lazy").setup({
	spec = {
		{ import = "bruno.plugins" },
	},
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "📜",
			config = "🛠️",
			event = "📅",
			ft = "📂",
			init = "⚙️",
			keys = "🔑",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
