return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          on_attach = function(client, bufnr)
            local filename = vim.api.nvim_buf_get_name(bufnr)
            if filename:match("PKGBUILD$") then
              client.config.settings.bashIde.shellcheckArguments = "--shell=bash --exclude=SC2034,SC2154,SC2164"
            else
              client.config.settings.bashIde.shellcheckArguments = ""
            end
          end,
        },
      },
    },
  },
}
