return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            {
                "mason-org/mason.nvim",
                config = function()
                    require("mason").setup()
                end,
            },
            {
                "neovim/nvim-lspconfig",
                config = function()
                    vim.lsp.enable({
                    })
                end,
            },
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                }
            })
        end,
    },
}

