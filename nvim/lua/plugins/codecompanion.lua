return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd:echo -n $GEMINI_API_KEY",
          },
        })
      end,
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd:echo -n $ANTHROPIC_API_KEY",
          },
        })
      end,
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
