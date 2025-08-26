return {

	{ "L3MON4D3/LuaSnip", keys = {} },

	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },
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
					default = { "lsp", "path", "snippets", "buffer", "copilot" },
					providers = {
						cmdline = {
							min_keyword_length = 2,
						},
						copilot = {
							name = "copilot",
							module = "blink-cmp-copilot",
							score_offset = 100,
							async = true,
							transform_items = function(_, items)
								for _, item in ipairs(items) do
									item.kind_icon = ""
									item.kind_name = "Copilot"
								end
								return items
							end,
						},
					},
				},
				keymap = {
					-- ["<CR>"] = { "accept", "fallback" },
					["<C-\\>"] = { "hide", "fallback" },
					["<C-n>"] = { "select_next", "show" },
					["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
					["<C-p>"] = { "select_prev" },
					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },
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
