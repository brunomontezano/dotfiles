return {
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]or[m]at buffer",
			},
		},
		opts = {
			notify_on_error = false,
			-- format_on_save = function(bufnr)
			-- 	local disable_filetypes = { c = true, cpp = true }
			-- 	return {
			-- 		timeout_ms = 500,
			-- 		lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			-- 	}
			-- end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				c = { "clang-format" },
				tex = { "latexindent" },
				sh = { "beautysh" },
				html = { "prettierd" },
				htmldjango = { "djlint" },
				css = { "prettierd" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
			},
		},
	},
}
