-- Vim options

local options = {
    number = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    cursorline = true,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
