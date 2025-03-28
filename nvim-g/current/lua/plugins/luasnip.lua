return {
  "L3MON4D3/LuaSnip",

  keys = {
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
