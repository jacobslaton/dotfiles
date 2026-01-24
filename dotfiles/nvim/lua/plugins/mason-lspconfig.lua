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
									pycodestyle = {
										ignore = {
											"E302",
											"E305",
											"W191",
											"W391",
										}
									}
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

