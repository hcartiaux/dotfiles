return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "shellcheck",
        "shfmt",
        "flake8",
        "systemd-language-server",
        "ansible-language-server",
        "ansible-lint",
        "yaml-language-server",
        "ast-grep",
        "python-lsp-server"
      },
    },
  },
}
