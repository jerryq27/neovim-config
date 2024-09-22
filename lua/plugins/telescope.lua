-- Project-wide search
--  telescope-ui-select - provides telescope-like select menus

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fw", ":Telescope workspaces<CR>")
			return {}
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		opts = function()
			require("telescope").load_extension("ui-select")

			return {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			}
		end,
	},
}
