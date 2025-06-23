-- return {
--
-- 	{ "L3MON4D3/LuaSnip", keys = {} },
--
-- 	{
-- 		"saghen/blink.cmp",
-- 		dependencies = { "rafamadriz/friendly-snippets" },
-- 		version = "1.*",
--
-- 		opts = {
-- 			keymap = { preset = "default" },
--
-- 			appearance = {
-- 				nerd_font_variant = "mono",
-- 			},
--
-- 			completion = {
-- 				documentation = { auto_show = true, auto_show_delay_ms = 500, update_delay_ms = 50 },
-- 			},
--
-- 			sources = {
-- 				default = { "lsp", "path", "snippets", "buffer" },
-- 			},
-- 			cmdline = {
-- 				keymap = { preset = "inherit" },
-- 				completion = { menu = { auto_show = true } },
-- 			},
--
-- 			fuzzy = { implementation = "prefer_rust_with_warning" },
-- 		},
--
-- 		opts_extend = { "sources.default" },
-- 	},
-- }
--
return {

	{ "L3MON4D3/LuaSnip", keys = {} },

	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		lazy = true,
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },
				appearance = {
					-- use_nvim_cmp_as_default= false,
					nerd_font_variant = "mono",
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
					providers = {
						cmdline = {
							min_keyword_length = 2,
						},
					},
				},
				keymap = {
					["<C-f>"] = {},
				},
				cmdline = {
					enabled = true,
					completion = { menu = { auto_show = true } },
					keymap = {
						preset = "inherit",
					},
				},
				completion = {
					accept = { auto_brackets = { enabled = true } },
					menu = {
						border = nil,
						scrolloff = 1,
						scrollbar = false,
						winblend = 15,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "kind" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						window = {
							border = nil,
							winblend = 15,
							scrollbar = false,
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						},
						auto_show = true,
						auto_show_delay_ms = 500,
					},

					-- signature = {
					-- 	enabled = true,
					-- 	window = {
					-- 		border = "rounded",
					-- 		winblend = 15,
					-- 	},
					-- },
				},
			})

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
