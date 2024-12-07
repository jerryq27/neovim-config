-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

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

-- Set colorscheme based on parent directory to determine the type of project.
vim.api.nvim_create_autocmd("DirChanged", {
    desc = "Sets colorscheme based on the type of project",
    group = vim.api.nvim_create_augroup("jconfig-colorscheme", { clear = true }),
    callback = function()
        -- local current_dir = vim.fn.getcwd()
        local workspace = require "workspaces"
        local project = workspace.name()
        local projectschemes = {
            nvim = "vscode",
            spacevibes = "tokyonight-night",
            carprofiles = "kanagawa-paper",
        }

        if projectschemes[project] ~= nil then
            vim.cmd.colorscheme(projectschemes[project])
        else
            vim.cmd.colorscheme "vscode"
        end
        vim.cmd.hi "Comment gui=none"
    end,
})
