return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- Auto-update parsers after install
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"bash",
					"json",
					"yaml",
					"vim",
					"markdown",
					"html",
					"css",
					"javascript",
					"typescript",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},

	{

		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "python", "javascript", "markdown", "bash" }, -- your choice
				highlight = { enable = true },
				indent = { enable = true },

				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj

						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["ap"] = "@parameter.outer",
							["ip"] = "@parameter.inner",
						},
					},

					move = {
						enable = true,
						set_jumps = true, -- Whether to set jumps in the jumplist

						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},

					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},
}
