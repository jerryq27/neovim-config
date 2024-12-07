-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

local options = {
    -- Make line numbers default
    number = true,
    -- You can also add relative line numbers, to help with jumping.
    --  Experiment for yourself to see if you like it!
    -- vim.opt.relativenumber = true

    -- Enable mouse mode, can be useful for resizing splits for example!
    mouse = "a",

    -- Don't show the mode, since it's already in the status line
    showmode = false,

    -- Enable break indent
    breakindent = true,

    -- Save undo history
    undofile = true,

    -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
    ignorecase = true,
    smartcase = true,

    -- Keep signcolumn on by default
    signcolumn = "yes",

    -- Decrease update time
    updatetime = 250,

    -- Decrease mapped sequence wait time
    -- Displays which-key popup sooner
    timeoutlen = 300,

    -- Configure how new splits should be opened
    splitright = true,
    splitbelow = true,

    -- Sets how neovim will display certain whitespace characters in the editor.
    --  See `:help 'list'`
    --  and `:help 'listchars'`
    list = true,
    listchars = { tab = "» ", trail = "·", nbsp = "␣" },

    -- Preview substitutions live, as you type!
    inccommand = "split",

    -- Show which line your cursor is on
    cursorline = true,

    -- Minimal number of screen lines to keep above and below the cursor.
    scrolloff = 10,
}

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

for key, value in pairs(options) do
    vim.opt[key] = value
end
