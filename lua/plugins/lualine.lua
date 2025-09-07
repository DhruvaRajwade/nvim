return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		-- Custom Lualine component to show attached language server
		local clients_lsp = function()
			local bufnr = vim.api.nvim_get_current_buf()

			local clients = vim.lsp.get_clients()
			if next(clients) == nil then
				return ""
			end

			local c = {}
			for _, client in pairs(clients) do
				table.insert(c, client.name)
			end
			return " " .. table.concat(c, "|")
		end

		local custom_catppuccin = require("lualine.themes.catppuccin")

		-- Custom colours
		custom_catppuccin.normal.b.fg = "#cad3f5"
		custom_catppuccin.insert.b.fg = "#cad3f5"
		custom_catppuccin.visual.b.fg = "#cad3f5"
		custom_catppuccin.replace.b.fg = "#cad3f5"
		custom_catppuccin.command.b.fg = "#cad3f5"
		custom_catppuccin.inactive.b.fg = "#cad3f5"

		custom_catppuccin.normal.c.fg = "#6e738d"
		custom_catppuccin.normal.c.bg = "#1e2030"

		require("lualine").setup({
			options = {
				theme = custom_catppuccin,
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "Outline" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = " ", right = "" }, icon = "" },
				},
				lualine_b = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
					},
					"filename",
				},
				lualine_c = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						colored = false,
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
				},
				lualine_y = { clients_lsp },
				lualine_z = {
					{ "location", separator = { left = "", right = " " }, icon = "" },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			extensions = { "trouble" },
		})
	end,
}

-- {
-- 	"akinsho/bufferline.nvim",
-- 	version = "*",
-- 	dependencies = "nvim-tree/nvim-web-devicons",
-- 	config = function()
-- 		require("bufferline").setup({
-- 			options = {
-- 				-- Show diagnostics from LSP
-- 				diagnostics = "nvim_lsp",
--
-- 				-- Configure how diagnostics are displayed on the tabs
-- 				diagnostics_indicator = function(count, level, diagnostics_dict, context)
-- 					local icon = (level:match("error") and " ") or (level:match("warning") and " ") or " "
-- 					return " " .. icon .. count
-- 				end,
--
-- 				-- Disable close icon on the bufferline tabs
-- 				show_close_icon = false,
-- 				show_buffer_close_icons = false,
-- 			},
-- 		})
--
-- 		-- Keybindings for bufferline navigation and management
-- 		local opts = { noremap = true, silent = true }
--
-- 		-- Navigate buffers
-- 		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- 		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
--
-- 		-- Move buffers (reorder them)
-- 		vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineMovePrev<CR>", opts)
-- 		vim.keymap.set("n", "<leader>bn", "<Cmd>BufferLineMoveNext<CR>", opts)
--
-- 		-- Pick buffer to go to (buffer picker mode)
-- 		vim.keymap.set("n", "<leader>bb", "<Cmd>BufferLinePick<CR>", opts)
--
-- 		-- Pick buffer to close (with buffer picker)
-- 		vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", opts)
--
-- 		-- Close current buffer
-- 		vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", opts)
-- 	end,
-- },
--}
