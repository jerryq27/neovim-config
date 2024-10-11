-- Comment the selected code
-- vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
-- vim.keymap.set("v", "<C-/>", "gc", { remap = true })

vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Comment in normal mode." })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Comment in visual mode." })
vim.keymap.set("n", "<leader>cc", "gcc", { remap = true, desc = "Comment in normal mode." })
vim.keymap.set("v", "<leader>cc", "gc", { remap = true, desc = "Comment in visual mode." })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
