return {
  -- Disable default plugins
  { "folke/noice.nvim", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },

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
