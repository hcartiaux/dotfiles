-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("BufWritePre", {
  -- Remove all trailing white spaces on save
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")

    local exclude_filetypes = { "diff" }
    if vim.tbl_contains(exclude_filetypes, vim.bo.filetype) then
      return                        -- Excluded filetype
    elseif vim.bo.filetype == "markdown" then
      vim.cmd([[%s/\s\s\s\+$//e]])  -- Remove 3+ trailing spaces
      vim.cmd([[%s/\s$//e]])        -- Remove single trailing space
    else
      vim.cmd([[%s/\s\+$//e]])      -- Remove all trailing spaces
    end

    vim.fn.setpos(".", save_cursor)
  end,
})
