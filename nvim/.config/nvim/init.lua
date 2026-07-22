vim.g.mapleader = " "
require("config.lazy")
vim.o.termguicolors = true
vim.cmd.colorscheme("tokyonight")
vim.opt.number = true
vim.o.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.relativenumber = true
vim.opt.foldlevel = 99
vim.opt.foldenable = true
