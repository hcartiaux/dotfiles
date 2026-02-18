return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      mistral = function()
        return require("codecompanion.adapters").extend("mistral", {
          env = {
            api_key = "cmd:echo -n $MISTRAL_API_KEY",
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "mistral",
      },
      inline = {
        adapter = "mistral",
      },
      cmd = {
        adapter = "mistral",
      }
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
