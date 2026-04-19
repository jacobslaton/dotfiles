return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile", },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				cs = { "csharpier" },
				python = { "ruff_fix", "ruff_format", "isort", "black" },
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				async = false,
			})
		end, {})
	end,
}

