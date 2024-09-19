-- LSP configuration plugins
--  mason - LSP/Linter/Formatter manager
--  mason-lspconfig - provides a way to ensure/auto install LSPs
--  nvim-lspconfig - Sets up the connection between Neovim and the LSP

return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls" }
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})

            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gt", vim.lsp.buf.definition, {})
        end
    },
}
