-- local colorscheme = "solarized8"
-- local colorscheme = "tokyonight"
local colorscheme = "gruvbox"

vim.g.solarized_italics = 0
vim.g.tokyonight_italic_comments = false

-- vim.o.background = "light"
vim.o.background = "dark"

require("gruvbox").setup({
  italic = false
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
