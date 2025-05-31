return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				indent = {
					char = "│", -- Set indent line character
				},
				scope = {
					enabled = true, -- Enable scope highlighting
					show_start = true,
					show_end = false,
				},
				exclude = {
					filetypes = { "help", "terminal", "dashboard" }, -- Exclude these filetypes
					buftypes = { "terminal", "nofile" },
				},
			})
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			-- Fold settings
			vim.o.foldcolumn = "0" -- Show fold column
			vim.o.foldlevel = 99 -- Set high foldlevel to open all folds
			vim.o.foldlevelstart = 99 -- Start with all folds open
			vim.o.foldenable = true -- Enable folding
			vim.o.foldmethod = "expr" -- Use expression-based folding
			vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Treesitter fold expr

			-- UFO setup
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})

			-- Key mappings for convenience
			vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
		end,
	},
}
