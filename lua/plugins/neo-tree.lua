return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "right",
				width = 30,
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignore = false,
				},
				--hide_by_pattern = {
				--	"*/node_modules/*",
				--},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree toggle <CR>", {})
	end,
}
