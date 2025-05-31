return {

	{

		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			},
			config = function()
				local wk = require("which-key")
				wk.add({
					{ "<leader>f", group = "file" },
					{ "<leader>h", group = "Harpoon" },
					{ "<leader>c", group = "Code Actions" },
					{ "<leader><F5>", group = "DAP Start" },
					{ "<leader>g", group = "Gitsigns" },
					{ "<leader>l", group = "Line number toggler" },
					{ "<leader>t", group = "Terminal" },
					{ "<leader>d", group = "Deleter Overlord" },
					{ "<leader>z", group = "Zenmode" },
				})

				require("which-key").setup({

					plugins = {

						marks = true,
						registers = true,
					},
					triggers = { "<leader>" },
				})
				-- dofile(vim.g.base46_cache .. "whichkey")
			end,
		},
	},
}
