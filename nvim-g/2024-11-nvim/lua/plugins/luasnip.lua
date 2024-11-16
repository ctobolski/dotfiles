return {
  "L3MON4D3/LuaSnip",

  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets/luasnippets/all" } })
  end,
  keys = {
    {
      "<C-l>",
      mode = {
        "i",
      },
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
    },
    {
      "<C-h>",
      mode = {
        "i",
      },
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end,
    },
    {
      ",es",
      mode = {
        "n",
      },
      function()
        require("luasnip.loaders").edit_snippet_files()
      end,
    },
    {
      ",s",
      mode = {
        "n",
      },
      "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>",
    },
  },
}
