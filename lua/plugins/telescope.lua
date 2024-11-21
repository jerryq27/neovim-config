-- Project-wide search
--  telescope-ui-select - provides telescope-like select menus

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "Search files in project"
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Search all using grep"
            },
            {
                "<leader>fw",
                "<CMD>Telescope workspaces<CR>",
                desc = "Search all workspaces"
            },
        }
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
