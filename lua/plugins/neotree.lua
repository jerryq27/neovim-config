-- File explorer

vim.keymap.set("n", "<leader>ex", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>")

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
}
