return {

	{

		"zaldih/themery.nvim",
		cmd = { "Themery" },
		config = function()
			require("themery").setup({

				themes = {
					-- Tokyonight (dark variants)
					{
						name = "tokyonight-night",
						colorscheme = "tokyonight",
						before = 'require("tokyonight").setup({ style = "night" })',
					},
					{
						name = "tokyonight-moon",
						colorscheme = "tokyonight",
						before = 'require("tokyonight").setup({ style = "moon" })',
					},
					{
						name = "tokyonight-storm",
						colorscheme = "tokyonight",
						before = 'require("tokyonight").setup({ style = "storm" })',
					},

					-- Nord
					"nord",

					-- Nightfox (dark variants)
					"nightfox",
					"duskfox",
					"nordfox",
					"terafox",
					"carbonfox",

					-- Kanagawa (dark variants)
					"kanagawa-wave",
					"kanagawa-dragon",

					-- Catppuccin (dark variants)
					{
						name = "catppuccin-frappe",
						colorscheme = "catppuccin",
						before = 'require("catppuccin").setup({ flavour = "frappe" })',
					},
					{
						name = "catppuccin-macchiato",
						colorscheme = "catppuccin",
						before = 'require("catppuccin").setup({ flavour = "macchiato" })',
					},
					{
						name = "catppuccin-mocha",
						colorscheme = "catppuccin",
						before = 'require("catppuccin").setup({ flavour = "mocha" })',
					},

					-- Onedark (dark variants)
					{
						name = "onedark-darker",
						colorscheme = "onedark",
						before = 'require("onedark").setup({ style = "darker" }); require("onedark").load()',
					},
					{
						name = "onedark-cool",
						colorscheme = "onedark",
						before = 'require("onedark").setup({ style = "cool" }); require("onedark").load()',
					},
					{
						name = "onedark-deep",
						colorscheme = "onedark",
						before = 'require("onedark").setup({ style = "deep" }); require("onedark").load()',
					},
					{
						name = "onedark-warm",
						colorscheme = "onedark",
						before = 'require("onedark").setup({ style = "warm" }); require("onedark").load()',
					},

					-- Additional beautiful dark themes
					{ name = "gruvbox", colorscheme = "gruvbox" },
					{
						name = "everforest-dark",
						colorscheme = "everforest",
						before = 'vim.g.everforest_background = "medium"',
					},
					{
						name = "rose-pine",
						colorscheme = "rose-pine",
						before = 'require("rose-pine").setup({ variant = "main" })',
					},
					{ name = "dracula", colorscheme = "dracula" },
					{ name = "moonfly", colorscheme = "moonfly" },

					-- ---------------------------
					-- Light Themes (added below)
					-- ---------------------------

					-- Tokyonight (light)
					{
						name = "tokyonight-day",
						colorscheme = "tokyonight",
						before = 'require("tokyonight").setup({ style = "day" })',
					},

					-- Catppuccin (light)
					{
						name = "catppuccin-latte",
						colorscheme = "catppuccin",
						before = 'require("catppuccin").setup({ flavour = "latte" })',
					},

					-- Everforest (light)
					{
						name = "everforest-light",
						colorscheme = "everforest",
						before = 'vim.g.everforest_background = "light"',
					},

					-- Rose Pine (light)
					{
						name = "rose-pine-dawn",
						colorscheme = "rose-pine",
						before = 'require("rose-pine").setup({ variant = "dawn" })',
					},

					-- OneDark (light)
					{
						name = "onedark-light",
						colorscheme = "onedark",
						before = 'require("onedark").setup({ style = "light" }); require("onedark").load()',
					},

					-- Kanagawa (light)
					{
						name = "kanagawa-lotus",
						colorscheme = "kanagawa",
						before = 'require("kanagawa").setup({ theme = "lotus" })',
					},

					-- Nightfox (light)
					"dawnfox",
				},
				livePreview = true,
			})
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			terminal_colors = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				telescope = true,
				treesitter = true,
				which_key = true,
				indent_blankline = true,
				native_lsp = true,
			},
		},
	},

	{
		"sainnhe/everforest",
		lazy = true,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "medium"
			vim.g.everforest_enable_italic = 1
			vim.cmd("colorscheme everforest")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		priority = 1000,
		opts = {
			variant = "main",
			styles = {
				transparency = false,
			},
			enable = {
				aerial = true,
				alpha = true,
				cmp = true,
				diagnostic = true,
				flash = true,
				gitsigns = true,
				indent_blankline = true,
				mason = true,
				markdown = true,
				lsp = true,
				noice = true,
				notify = true,
				neotree = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
	},

	{
		"Mofiqul/dracula.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			italic_comment = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				lsp = true,
				treesitter = true,
				telescope = true,
				which_key = true,
			},
		},
	},

	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme moonfly")
		end,
	},

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "moon",
			transparent = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
			},
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				fzf = true,
				gitsigns = true,
				indent_blankline = true,
				mason = true,
				markdown = true,
				lsp_trouble = true,
				noice = true,
				notify = true,
				neotree = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
	},

	-- onedark
	{
		"navarasu/onedark.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "darker",
				plugins = {
					aerial = true,
					alpha = true,
					cmp = true,
					dashboard = true,
					flash = true,
					fzf = true,
					gitsigns = true,
					indent_blankline = true,
					mason = true,
					markdown = true,
					lsp = true,
					noice = true,
					notify = true,
					neotree = true,
					telescope = true,
					treesitter = true,
					which_key = true,
				},
			})
			require("onedark").load()
		end,
	},

	-- nord (does not support Lua-based integration options natively)
	{
		"shaunsingh/nord.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme nord")
		end,
	},

	-- nightfox
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			options = {
				transparent = false,
				styles = {
					comments = "italic",
					keywords = "bold",
				},
			},
			groups = {
				all = {
					CmpItemKind = { link = "Function" },
				},
			},
			inverse = {
				match_paren = true,
			},
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				fzf = true,
				gitsigns = true,
				indent_blanklines = true,
				mason = true,
				neotree = true,
				telescope = true,
				treesitter = true,
				lsp_trouble = true,
				noice = true,
				notify = true,
				which_key = true,
			},
		},
	},

	-- kanagawa
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			theme = "wave",
			compile = true,
			transparent = false,
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				fzf = true,
				gitsigns = true,
				indent_blankline = true,
				mason = true,
				markdown = true,
				lsp_trouble = true,
				noice = true,
				notify = true,
				neotree = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
	},

	-- catppuccin
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			--transparent_background = true,
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				fzf = true,
				grug_far = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
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
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				blink_cmp = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		},
		specs = {
			{
				"akinsho/bufferline.nvim",
				optional = true,
				opts = function(_, opts)
					if (vim.g.colors_name or ""):find("catppuccin") then
						opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
					end
				end,
			},
		},
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
