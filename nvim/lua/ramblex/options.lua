vim.opt.guicursor = ""
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.laststatus = 2

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ruler = true

vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

vim.g.colorscheme = "catpuccin"

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.listchars = {
  trail = '·',
  tab = '»-'
}
