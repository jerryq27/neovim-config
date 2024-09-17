-- In-depth syntax parser for more accurate color schemes

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua" },
        highlight = { enable = true },
        indent = { enable = true },
    }
}

