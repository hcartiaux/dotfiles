return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "systemd-language-server",
        "ansible-language-server",
        "yaml-language-server",
        "python-lsp-server",
      },
    },
  },
}
