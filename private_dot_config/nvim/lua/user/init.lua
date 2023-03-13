local config = {
  updater = { channel = "stable" },
  colorscheme = "catppuccin-frappe",
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true
      }
    },
    -- add to the global LSP on_attach function
    on_attach = function(client, _)
      if client.name == "yamlls" then
        local ns = vim.lsp.diagnostic.get_namespace(client.id)
        vim.diagnostic.disable(nil, ns)
      end
    end,
    config = {
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}"
            }
          }
        }
      }
    }
  },
}

return config
