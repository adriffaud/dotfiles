-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "catppuccin-frappe"
lvim.transparent_window = true

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "eex",
  "elixir",
  "go",
  "hcl",
  "json",
  "lua",
  "python",
  "yaml"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
  "elixirls"
}

-- Additional Plugins
lvim.plugins = {
  { "catppuccin/nvim" }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "autopep8" },
  { name = "prettier" }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { name = "flake8" },
  { name = "shellcheck" },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint"
  },
}
