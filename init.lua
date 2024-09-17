-- Starting point for Neovim config
local options = {
	number = true,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
    softtabstop = 4,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=stable",
      lazyrepo,
      lazypath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "navarasu/onedark.nvim", name = "onedark", priority = 1000 },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

require("nvim-treesitter.configs").setup({
    ensure_installed = {"lua"},
    highlight = { enable = true },
    indent = { enable = true },
})

require("onedark").setup()
vim.cmd.colorscheme "onedark"
