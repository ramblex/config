local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,
  updatevents = "TextChanged,TextChangedI"
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  print("hello!")
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    print("no snippet :(")
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node

ls.add_snippets("eruby", {
  s("cfr", fmt("<% content_for {} do %>\n  {}\n<% end %>", { i(1), i(0) }))
})
