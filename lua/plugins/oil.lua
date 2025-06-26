return {
	{
		"stevearc/oil.nvim",
		-- lazy = true,
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
					natural_order = true,
					is_always_hidden = function(name, _)
						return name == ".." or name == ".git"
					end,
				},
				win_options = {
					wrap = false,
					signcolumn = "yes:2",
				},
				float = {
					padding = 1,
					max_width = 60,
					max_height = 16,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
					override = function(conf)
						return conf
					end,
				},

				preview_win = {
					preview_split = "below",
					-- Whether the preview window is automatically updated when the cursor is moved
					update_on_cursor_moved = true,
					-- How to open the preview window "load"|"scratch"|"fast_scratch"
					preview_method = "fast_scratch",
					-- A function that returns true to disable preview on a file e.g. to avoid lag
					disable_preview = function(filename)
						return false
					end,
					-- Window-local options to use for preview window buffers
					win_options = {},
				},
			})
		end,
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
		vim.keymap.set("n", "<Tab>", function()
			vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil --float")
		end),
	},

	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
}
