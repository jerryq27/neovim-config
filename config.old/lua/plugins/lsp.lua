-- LSP configuration plugins
--  mason - LSP/Linter/Formatter manager
--  mason-lspconfig - provides a way to ensure/auto install LSPs
--  nvim-lspconfig - Sets up the connection between Neovim and the LSP

return {
	{ "williamboman/mason.nvim", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.definition, {})
		end,
	},
}
