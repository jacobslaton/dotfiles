return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		-- Keybinds
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
		vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>lgi", function()
			builtin.live_grep({
				additional_args = function()
					return { "--no-ignore" }
				end,
			})
		end, {})
		vim.keymap.set("n", "<leader>D", builtin.diagnostics, {})
		-- Background
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
		-- Line Numbers
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopePreviewerLoaded",
			command = "setlocal number",
		})
	end
}

