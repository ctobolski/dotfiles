local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

--custom loaders applied to all files
require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = './snippets/luasnippets/all' })

local map = vim.keymap.set

-- source snippet configuration
map("n", ",s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>", {silent = true, desc = "Source luasnip config"})
-- source snippet configuration
map("n", "<leader>es", require("luasnip.loaders").edit_snippet_files, {silent = true, desc = "Edit snippets"})


ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

map({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

map({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

map("i", "<c-e>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })


ls.add_snippets("lua", {
  s(
    "req",
    fmt(
      [[local {} = require('{}')]],
      { f(function(import_name)
        local parts = vim.split(import_name[1][1], ".")
        return parts[#parts] or ""
      end, { 1 }), i(1) }
    )
  ),
})

