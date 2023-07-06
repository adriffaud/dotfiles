local config = {
  updater = { channel = "stable" },
  colorscheme = "rose-pine",

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
              kubernetes = "*.yaml",
              ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
              ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
              ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
              ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
              ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
              ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
              ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
              ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
            }
          }
        }
      }
    }
  },
}

return config
