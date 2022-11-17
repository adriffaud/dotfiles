local config = {
  updater = { channel = "stable" },

  colorscheme = "gruvbox",

  highlights = {
    gruvbox = {
      StatusLine = { fg = "#ebdbb2", bg = "#504945" }
    }
  },

  plugins = {
    init = {
      ["akinsho/bufferline.nvim"] = { disable = true },
      ["goolord/alpha-nvim"] = { disable = true },
      ["stevearc/aerial.nvim"] = { disable = true },
      ["ellisonleao/gruvbox.nvim"] = {
        config = function()
          require("gruvbox").setup {
            italic = false
          }
        end
      },
    },
  },
}

return config
