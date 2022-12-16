local config = {
  updater = { channel = "stable" },

  colorscheme = "tokyonight-storm",

  highlights = {},

  options = {
    opt = {
      background = "dark"
    }
  },

  lsp = {
    yamlls = {
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}"
          }
        }
      }
    }
  },

  plugins = {
    init = {
      ["akinsho/bufferline.nvim"] = { disable = true },
      ["stevearc/aerial.nvim"] = { disable = true },
      { "folke/tokyonight.nvim" },
      { "p00f/alabaster.nvim" }
    },
  },
}

return config
