local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname)
    or util.root_pattern("tsconfig.base.json", "package.json", "tsconfig.json")(fname)
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        root_dir = get_root_dir,
      },
      tsserver = {
        root_dir = get_root_dir,
      },
    },
  },
}
