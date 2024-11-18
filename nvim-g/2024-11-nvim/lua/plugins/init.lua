return {
  {
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    {
      "LazyVim",
      opts = {
        colorscheme = "gruvbox",
      },
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "json5",
        "jsonc",
      },
    },
  },
}
