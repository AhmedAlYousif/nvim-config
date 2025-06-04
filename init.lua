vim.g.loaded_netrw = 1
vim.g.loaded_newtrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.wo.number = true


require("config.lazy")
require("config.keybindings")
