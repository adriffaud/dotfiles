return {
  -- Disable default plugins
  { "folke/noice.nvim", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "vrischmann/tree-sitter-templ",
      config = function()
        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config["templ"] = {
          filetype = "templ",
          maintainers = { "@vrischmann" },
          install_info = {
            url = "https://github.com/vrischmann/tree-sitter-templ.git",
            files = { "src/parser.c", "src/scanner.c" },
            branch = "master",
          },
        }
        vim.treesitter.language.register("templ", "templ")
      end,
    },
    opts = { ensure_installed = { "templ" } },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "towolf/vim-helm" },
    opts = {
      servers = {
        helm_ls = {},
      },
    },
  },
}
