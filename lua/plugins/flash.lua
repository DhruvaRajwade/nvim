return {

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-a>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
		config = function()
<<<<<<< HEAD
			require("flash").setup()
=======
			require("flash").setup({
				modes = {
					-- Enable enhanced search (`/`, `?`)
					search = {
						enabled = true,
						highlight = { backdrop = false },
						jump = { autojump = false },
					},
					-- Enable single-character motions (`f`, `F`, `t`, `T`)
					char = {
						enabled = true,
						highlight = { backdrop = true },
						jump = { autojump = true },
					},
					-- Jump between windows
					remote = {
						enabled = true,
						highlight = { backdrop = true },
						jump = { autojump = false },
					},
					-- Use Treesitter for structural navigation
					treesitter = {
						enabled = true,
						highlight = {
							label = {
								before = true,
								after = true,
								style = "inline",
							},
							backdrop = true,
						},
						jump = { autojump = false },
					},
					-- LSP integration (e.g., go to reference)
					lsp = {
						enabled = true,
						highlight = {
							label = {
								before = true,
								after = true,
								style = "eol",
							},
							backdrop = true,
						},
						jump = { autojump = false },
					},
				},
			})
>>>>>>> main
		end,
	},
}
