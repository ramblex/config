local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  use('tpope/vim-fugitive')
  use('mattn/emmet-vim')
  use('numToStr/Comment.nvim')
  use("mbbill/undotree")

  use('nvim-treesitter/nvim-treesitter')
  use('RRethy/nvim-treesitter-endwise')
  use('nvim-lua/popup.nvim')
  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope.nvim')

  use('neovim/nvim-lsp')
  use('neovim/nvim-lspconfig')
  use('L3MON4D3/LuaSnip')

  use 'mfussenegger/nvim-dap'
  use({
    'nvim-neotest/neotest',
    requires = {
      'olimorris/neotest-rspec',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-rspec'),
        }
      })
    end
  })

  -- Colourschemes
  use('folke/tokyonight.nvim')
  use({ "catppuccin/nvim", as = "catppuccin" })
  use('gruvbox-community/gruvbox')
end)
