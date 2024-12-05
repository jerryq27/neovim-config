-- In-depth syntax parser for more accurate color schemes

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- opts = {
	-- 	ensure_installed = { "lua", "python" },
	-- 	highlight = { enable = true },
	-- 	indent = { enable = true },
	-- },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "lua", "python", "javascript", "css", "html" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
