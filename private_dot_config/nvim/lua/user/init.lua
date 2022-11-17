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
      ["nvim-neorg/neorg"] = {
        config = function()
          require("neorg").setup {
            load = {
              ["core.defaults"] = {},
              ["core.norg.concealer"] = {},
              ["core.norg.completion"] = {
                config = {
                  engine = "nvim-cmp",
                },
              },
              ["core.norg.dirman"] = {
                config = {
                  workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                    brain = "~/notes/brain",
                    gtd = "~/notes/brain/gtd",
                  },
                },
              },
              ["core.gtd.base"] = {
                config = {
                  workspace = "gtd",
                },
              },
            },
          }
        end,
        requires = {
          { "nvim-lua/plenary.nvim" },
        },
      },
    },
  },
}

return config
