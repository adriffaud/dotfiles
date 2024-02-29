return {
  { "folke/noice.nvim", enabled = false },

  { "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 10 } },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "towolf/vim-helm" },
    opts = { servers = { helm_ls = {} } },
  },
}
