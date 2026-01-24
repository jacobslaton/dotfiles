return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()
	end,
	keys = function()
		return {
			{
				"<leader>H",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon File",
			},
			{
				"<leader>H",
				function()
					require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
				end,
				desc = "Harpoon Quick Menu",
			},
			{
				"<C-a>",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon to File 1",
			},
			{
				"<C-s>",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon to File 2",
			},
			{
				"<C-d>",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon to File 3",
			},
			{
				"<C-f>",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon to File 4",
			},
		}
	end,
}

