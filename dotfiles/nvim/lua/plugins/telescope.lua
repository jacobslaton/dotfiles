return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope.builtin")
		-- Keybinds
		vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
		vim.keymap.set("n", "<leader>gf", telescope.git_files, {})
		vim.keymap.set("n", "<leader>lg", telescope.live_grep, {})
		vim.keymap.set("n", "<leader>lg", function()
			telescope.live_grep({
				additional_args = function()
					return { "--no-ignore" }
				end,
			})
		end, {})
		-- Background
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
	end
}

