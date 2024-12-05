return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
        -- keys = {
        --     {
        --         "<leader>gd",
        --         "<CMD>Gitsigns diffthis<CR>",
        --         desc = "Show diff of current file"
        --     },
        -- }
    },
	{
		"akinsho/git-conflict.nvim",
		opts = {
			default_mappings = true, -- disable buffer local mapping created by this plugin
			default_commands = true, -- disable commands created by this plugin
			disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
			list_opener = "copen", -- command or function to open the conflicts list
			highlights = { -- They must have background color, otherwise the default color will be used
				incoming = "DiffAdd",
				current = "DiffText",
			},
		},
	},
}
