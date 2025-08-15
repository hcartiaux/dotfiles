return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        puppet = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "puppet" },
    }
  },
}
