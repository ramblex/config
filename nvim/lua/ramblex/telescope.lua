require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "^./.git/", "^./node_modules/", "^./tmp/cache", "^./doc", "^./vendor/bundle"}
  }
})
