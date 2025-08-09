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
      qwen3 = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "qwen3-coder",
          schema = {
            model = {
              default = "qwen3-coder:latest",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "qwen3",
      },
      inline = {
        adapter = "qwen3",
      },
      cmd = {
        adapter = "qwen3",
      }
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
