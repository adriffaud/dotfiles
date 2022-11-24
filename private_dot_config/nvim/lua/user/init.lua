local config = {
  updater = { channel = "stable" },

  colorscheme = "gruvbox",

  highlights = {
    gruvbox = {
      StatusLine = { fg = "#ebdbb2", bg = "#504945" }
    }
  },

  lsp = {
    on_attach = function(_, bufnr)
      local diagnostics_active = true
      vim.keymap.set("n", "<leader>lt", function()
        diagnostics_active = not diagnostics_active
        if diagnostics_active then
          vim.diagnostic.show()
        else
          vim.diagnostic.hide()
        end
      end, { buffer = bufnr, desc = "Toggle diagnostics" })
    end,
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
