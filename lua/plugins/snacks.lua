return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = function()
		local colors = {
			scope = "#61afef", -- bright blue
			indent = "#555555", -- grey
		}

		vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = colors.scope, nocombine = true })
		-- reapply after any colorscheme change
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = colors.scope, nocombine = true })
			end,
		})

		return {
			image = { enabled = true },
			bigfile = { enabled = true },
			lazygit = { enabled = true },
			zen = {
				win = {
					backdrop = { transparent = false },
				},
				toggles = { dim = false },
			},
			scroll = { enabled = true },
			terminal = { enabled = true },
			notifier = { enabled = true },
			notify = { enabled = true },
			toggle = { enabled = false },
			indent = { enabled = true },
			scope = { enabled = true, only_current = false, hl = "SnacksIndentScope" },
			words = {
				enabled = true,
				hl = "LspReferenceText", -- reuse LSP highlight
				current_word_hl = "Visual", -- highlight under-cursor word differently
			},
			picker = {},
		}
	end,
	keys = function()
		local snacks = require("snacks")
		local Terminal = require("snacks.terminal")

		return {
			-- Lazygit
			{
				"<leader>lg",
				function()
					snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			-- Zen mode
			{
				"<leader>zz",
				function()
					snacks.zen()
				end,
				desc = "Zen Mode",
			},
			-- Terminal keymaps (ToggleTerm-like)
			{
				"<leader>tt",
				function()
					Terminal.toggle()
				end,
				desc = "Toggle Terminal",
			},
			{
				"<leader>tf",
				function()
					Terminal.toggle(vim.o.shell, { win = { position = "float" } })
				end,
				desc = "Toggle Floating Terminal",
			},
			{
				"<leader>th",
				function()
					Terminal.toggle(nil, { win = { position = "bottom", height = 0.3 } })
				end,
				desc = "Toggle Horizontal Terminal",
			},
			{
				"<leader>tv",
				function()
					Terminal.toggle(nil, { win = { position = "right", width = 0.4 } })
				end,
				desc = "Toggle Vertical Terminal",
			},
			-- {
			-- 	"<leader>ns",
			-- 	function()
			-- 		local gpu = Terminal.get("nvidia-smi", {
			-- 			cmd = { "nvidia-smi", "-l", "1" }, -- -l 1 refreshes every second
			-- 			win = { position = "float" }, -- open as floating window
			-- 		})
			-- 		gpu:toggle()
			-- 	end,
			-- 	desc = "Toggle NVIDIA-SMI Monitor",
			-- },
			-- Words navigation (safe numeric form)
			{
				"]r",
				function()
					snacks.words.jump(1)
				end,
				desc = "Next Reference",
			},
			{
				"[r",
				function()
					snacks.words.jump(-1)
				end,
				desc = "Previous Reference",
			},
			-- File pickers
			{
				"<leader> ",
				function()
					require("snacks.picker").files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>f",
				function()
					require("snacks.picker").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<C-f>",
				function()
					require("snacks.picker").grep_current()
				end,
				desc = "Find in Current Buffer",
			},

			-- (Optional) extras for parity with telescope defaults
			{
				"<leader><leader>",
				function()
					require("snacks.picker").files()
				end,
				desc = "Find Files (Alt)",
			},
			{
				"<leader>fg",
				function()
					require("snacks.picker").grep()
				end,
				desc = "Live Grep (Alt)",
			},
			{
				"<leader>m",
				function()
					require("snacks.picker").marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>un",
				function()
					require("snacks.picker").notifications()
				end,
				desc = "Notifications",
			},
			{
				"<leader>gs",
				function()
					require("snacks.picker").git_status()
				end,
				desc = "Git Status",
			},

			{
				"<leader>gB",
				function()
					require("snacks.picker").git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>gl",
				function()
					require("snacks.picker").git_log()
				end,
				desc = "Git Log (Current File)",
			},

			vim.api.nvim_create_user_command("Theme", function(opts)
				snacks.picker.colorschemes(opts)
			end, { nargs = "?" }),
			vim.api.nvim_create_user_command("Todos", function()
				require("snacks.picker").grep({
					search = [[TODO:|todo!\(.*\)]],
					no_esc = true,
				})
			end, { desc = "Grep TODOs", nargs = 0 }),
		}
	end,
}

-- return {
-- 	"folke/snacks.nvim",
-- 	priority = 1000,
-- 	lazy = false,
-- 	opts = function()
-- 		local colors = {
-- 			scope = "#61afef", -- bright blue
-- 			indent = "#555555", -- grey
-- 		}
--
-- 		vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = colors.scope, nocombine = true })
-- 		-- vim.api.nvim_set_hl(0, "SnacksIndent", { fg = colors.indent, nocombine = true })
--
-- 		return {
-- 			image = {},
-- 			lazygit = { enabled = true },
-- 			zen = {
-- 				win = {
-- 					backdrop = { transparent = false },
-- 				},
-- 				toggles = { dim = false },
-- 			},
-- 			scroll = { enabled = true },
-- 			terminal = { enabled = false },
-- 			notifier = { enabled = true },
-- 			notify = { enabled = true },
-- 			toggle = { enabled = false },
-- 			indent = { enabled = true },
-- 			scope = { enabled = true, only_current = false, hl = "SnacksIndentScope" },
-- 		}
-- 	end,
-- 	keys = function()
-- 		local snacks = require("snacks")
-- 		return {
-- 			{
-- 				"<leader>lg",
-- 				function()
-- 					snacks.lazygit()
-- 				end,
-- 				desc = "Lazygit",
-- 			},
-- 			{
-- 				"<leader>zz",
-- 				function()
-- 					snacks.zen()
-- 				end,
-- 				desc = "Zen Mode",
-- 			},
-- 		}
-- 	end,
-- }
