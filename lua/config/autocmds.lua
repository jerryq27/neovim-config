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
        return "onedark"
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
        vim.schedule(function()
            vim.cmd.colorscheme(determineColorScheme())
            vim.cmd.hi "Comment gui=none"
        end)
    end,
})

--  Set colorscheme when opening Neovim.
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Sets colorscheme when opening Neovim",
    group = vim.api.nvim_create_augroup("jconfig-vimenter-colorscheme", { clear = true }),
    callback = function()
        vim.schedule(function()
            vim.cmd.colorscheme(determineColorScheme())
            vim.cmd.hi "Comment gui=none"
        end)
    end,
})

-- Refresh Neotree on file save.
vim.api.nvim_create_autocmd("FileWritePost", {
    desc = "Refreshes Neotree when saving a file",
    group = vim.api.nvim_create_augroup("jconfig-filewritepost-neotree", { clear = true }),
    callback = function()
        vim.schedule(function()
            vim.cmd ":Neotree focus"
            vim.api.nvim_feedkeys("<S-r><C-l>", "n", true)
        end)
    end,
})

-- Set indentation based on file type.
vim.api.nvim_create_autocmd("FileType", {
    desc = "Sets indentation based on the file type",
    group = vim.api.nvim_create_augroup("jconfig-filetype-indentation", { clear = true }),
    callback = function()
        vim.schedule(function()
            local fileType = vim.bo.filetype
            local web_langs = { "html", "css", "scss", "javascript", "js", "typescript", "ts", "jsx", "tsx", "json", "xml", "yaml", "yml" }
            local spaces = 4

            for _, lang in ipairs(web_langs) do
                if fileType == lang then
                    spaces = 2
                end
            end

            vim.opt.expandtab = true
            vim.opt.shiftwidth = spaces
            vim.opt.tabstop = spaces
            vim.opt.softtabstop = spaces
        end)
    end,
})
