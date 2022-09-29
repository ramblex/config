local Remap = require("ramblex.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<Leader>f", function()
  require('telescope.builtin').find_files()
end)
