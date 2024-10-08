-- Provides and LSP-like communication between Neovim and formatters/linters

return {
	"nvimtools/none-ls.nvim",
	opts = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
	end,
}
