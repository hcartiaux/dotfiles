-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Do not autoformat on save
vim.g.autoformat = false

-- Enable Neovim undo, backup, and swap files in custom directories
local data_path = vim.fn.stdpath("data")
local swap_dir = data_path .. "/swap/"
local backup_dir = data_path .. "/backup/"
local undo_dir = data_path .. "/undo/"

local function ensure_dirs(...)
  for _, dir in ipairs({ ... }) do
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p", "0o700")
    end
  end
end
ensure_dirs(swap_dir, backup_dir, undo_dir)

vim.opt.directory = swap_dir
vim.opt.backupdir = backup_dir
vim.opt.undodir = undo_dir
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true
