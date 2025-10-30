-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set jk to <escjjI>
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Terminal setup
-- Open terminal rightbelow
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>t", function()
  vim.cmd("rightbelow 15split | terminal")
end, { desc = "Open Terminal" })

-- Optional: Exit terminal mode with ESC
vim.keymap.set("t", "<Esc>", "<C-j><C-k>", { desc = "Exit terminal mode" })

-- Optional: Easy navigation between windows from terminal mode
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to top window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window" })

-- Send python code to terminal.
