-- Project manager

vim.keymap.set("n", "<leader>wl", ":WorkspacesList<CR>")

return {
	"natecraddock/workspaces.nvim",
	opts = {
		hooks = {
			open = { ":Neotree" },
		},
	},
}
