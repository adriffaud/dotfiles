local colorscheme = "solarized8"
--local colorscheme = "tokyonight"

vim.g.solarized_italics = 0
vim.g.tokyonight_italic_comments = false

vim.api.nvim_set_option('background', 'light')

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
