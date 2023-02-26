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
            { "catppuccin/nvim" },
            { "cuducos/yaml.nvim" }
        },
    },
}

return config
