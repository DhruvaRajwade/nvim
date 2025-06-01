return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin", --'nightfox'
				},
			})
		end,
	},

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
}
