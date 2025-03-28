-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

-- Search and replace word under cursor with register content
map("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r>a/g<Left><Left>", { desc = "Replace All with Register 'a'" })

-- Visual selection search and replace
map("v", "<leader>r", 'y:%s/<C-r>"/<C-r>a/g<Left><Left>', { desc = "Replace Selected with Register 'a'" })
