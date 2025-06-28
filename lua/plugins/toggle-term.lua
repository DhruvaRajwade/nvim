return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	cmd = { "ToggleTerm" },
	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
	},
	config = function()
		require("toggleterm").setup({
			-- Optional settings
			size = 20,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "float", -- options: 'horizontal', 'vertical', 'tab', 'float'
			float_opts = {
				border = "curved",
			},
		})
	end,
}
