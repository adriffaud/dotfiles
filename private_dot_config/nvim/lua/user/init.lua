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
        -- add to the global LSP on_attach function
        on_attach = function(client, bufnr)
            if client.name == "yamlls" then
                local ns = vim.lsp.diagnostic.get_namespace(client.id)
                vim.diagnostic.disable(nil, ns)
            end
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
            { "catppuccin/nvim" },
            { "cuducos/yaml.nvim" }
        },
    },
}

return config
