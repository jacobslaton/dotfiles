return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{
				"mason-org/mason.nvim",
				config = function()
					require("mason").setup({
						registries = {
							"github:mason-org/mason-registry",
							"github:Crashdummyy/mason-registry",
						},
					})
				end,
			},
			{
				"neovim/nvim-lspconfig",
				config = function()
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					vim.lsp.config("pylsp", {
						capabilities = capabilities,
						settings = {
							pylsp = {
								plugins = {
									pycodestyle = { enabled = false },
									pyflakes = { enabled = false },
									mccabe = { enabled = false },
									ruff = {
										enabled = true,
										format = { "I" },
										extendSelect = { "E", "W", "F", "I", "B", "UP" },
										lineLength = 128,
									},
									black = {
										enabled = true,
										lineLength = 128,
									},
								}
							}
						}
					})
					vim.lsp.config("roslyn", {
						capabilities = capabilities,
					})
					vim.lsp.enable({
						"pylsp",
						"roslyn",
					})
				end,
			},
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pylsp",
				}
			})
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			local registry = require("mason-registry")
			registry.update(function()
				local pkg = registry.get_package("roslyn")
				if not pkg:is_installed() then
					pkg:install()
				end
			end)
		end,
	},
}

