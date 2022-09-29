require('ramblex.packer')
require('ramblex.comment')
require('ramblex.treesitter')
require('ramblex.telescope')
require('ramblex.lsp')
require('ramblex.neotest')
require('ramblex.options')

vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]
