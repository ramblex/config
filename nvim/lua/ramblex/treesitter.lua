-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true
  },
  ensure_installed = {'ruby'}, -- Or run :TSUpdate org
  endwise = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
  }
}
