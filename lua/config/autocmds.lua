-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local function determineColorScheme()
    local workspaces = require "workspaces"
    local project = workspaces.name()
    local colorschemes = {
        nvim = "vscode",
        spacevibes = "tokyonight-night",
        carprofiles = "kanagawa-paper",
    }

    local projectscheme = colorschemes[project]
    if projectscheme ~= nil then
        return projectscheme
    else
        return "vscode"
    end
end

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Project based colorschemes
--  Set colorscheme when switching projects.
vim.api.nvim_create_autocmd("DirChanged", {
    desc = "Sets colorscheme when switching projects",
    group = vim.api.nvim_create_augroup("jconfig-dirchanged-colorscheme", { clear = true }),
    callback = function()
        vim.cmd.colorscheme(determineColorScheme())
        vim.cmd.hi "Comment gui=none"
    end,
})
--  Set colorscheme when opening Neovim.
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Sets colorscheme when opening Neovim",
    group = vim.api.nvim_create_augroup("jconfig-vimenter-colorscheme", { clear = true }),
    callback = function()
        vim.cmd.colorscheme(determineColorScheme())
        vim.cmd.hi "Comment gui=none"
    end,
})
