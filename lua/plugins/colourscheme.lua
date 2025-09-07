return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			integrations = {
				aerial = false,
				alpha = false,
				cmp = false,
				dashboard = true,
				flash = true,
				fzf = true,
				grug_far = false,
				gitsigns = true,
				headlines = false,
				illuminate = false,
				indent_blankline = { enabled = false },
				leap = false,
				lsp_trouble = false,
				mason = true,
				markdown = true,
				mini = false,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = false,
				noice = false,
				notify = true,
				semantic_tokens = true,
				blink_cmp = true,
				telescope = false,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		})

		-- Set colorscheme
		vim.cmd.colorscheme("catppuccin")
	end,
}
