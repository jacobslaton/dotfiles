-- Generic Bindings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)
-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true
-- Invisible Characters
vim.opt.list = true
vim.opt.listchars = { eol = "\\u00ac", tab = "-->", space = "\\u00b7" }
-- Tabs
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 0
vim.g.python_recommended_style = 0
-- Start lazy.nvim
require("jslaton.lazy")
-- Background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

