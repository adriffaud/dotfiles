local config = {
  updater = { channel = "stable" },

  colorscheme = "catppuccin-frappe",

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
      { "catppuccin/nvim" }
    },
  },
}

return config
