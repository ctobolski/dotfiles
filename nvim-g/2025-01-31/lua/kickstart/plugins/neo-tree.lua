-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>fe", ":Neotree reveal<CR>", desc = "NeoTree [F]ile [e]xplorer", silent = true },
		{
			"<leader>fb",
			function()
				require("neo-tree.command").execute({ source = "buffers", desc = "[F]ile [b]uffers", toggle = true })
			end,
			desc = "Buffer Explorer",
		},
	},
	opts = {
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
