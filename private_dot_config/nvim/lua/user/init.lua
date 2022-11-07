local config = {
  updater = { channel = "nightly" },

  colorscheme = "gruvbox",

  highlights = {
    gruvbox = {
      StatusLine = { fg = "#ebdbb2", bg = "#504945" }
    }
  },

  plugins = {
    init = {
      { "ellisonleao/gruvbox.nvim" }
    },
  },
}

return config
