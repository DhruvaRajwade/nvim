return {

	-- {
	-- 		"kdheepak/lazygit.nvim",
	-- 		lazy = true,
	-- 		cmd = {
	-- 			"LazyGit",
	-- 			"LazyGitConfig",
	-- 			"LazyGitCurrentFile",
	-- 			"LazyGitFilter",
	-- 			"LazyGitFilterCurrentFile",
	-- 		},
	-- 		-- optional for floating window border decoration
	-- 		dependencies = {
	-- 			"nvim-lua/plenary.nvim",
	-- 		},
	-- 		-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- 		-- order to load the plugin when the command is run for the first time
	-- 		keys = {
	-- 			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	-- 		},
	-- 	},
	{

		"lewis6991/gitsigns.nvim",

		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged_enable = true,
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},
	{
		"esmuellert/codediff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
		opts = {
			-- Highlight configuration
			highlights = {
				-- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
				line_insert = "DiffAdd", -- Line-level insertions
				line_delete = "DiffDelete", -- Line-level deletions

				-- Character-level: accepts highlight group names or hex colors
				-- If specified, these override char_brightness calculation
				char_insert = nil, -- Character-level insertions (nil = auto-derive)
				char_delete = nil, -- Character-level deletions (nil = auto-derive)

				-- Brightness multiplier (only used when char_insert/char_delete are nil)
				-- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
				char_brightness = nil, -- Auto-adjust based on your colorscheme

				-- Conflict sign highlights (for merge conflict views)
				-- Accepts highlight group names or hex colors (e.g., "#f0883e")
				-- nil = use default fallback chain
				conflict_sign = nil, -- Unresolved: DiagnosticSignWarn -> #f0883e
				conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
				conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
				conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149
			},

			-- Diff view behavior
			diff = {
				disable_inlay_hints = true, -- Disable inlay hints in diff windows for cleaner view
				max_computation_time_ms = 5000, -- Maximum time for diff computation (VSCode default)
				ignore_trim_whitespace = false, -- Ignore leading/trailing whitespace changes (like diffopt+=iwhite)
				hide_merge_artifacts = false, -- Hide merge tool temp files (*.orig, *.BACKUP.*, *.BASE.*, *.LOCAL.*, *.REMOTE.*)
				original_position = "left", -- Position of original (old) content: "left" or "right"
				conflict_ours_position = "right", -- Position of ours (:2) in conflict view: "left" or "right"
				cycle_next_hunk = true, -- Wrap around when navigating hunks (]c/[c): false to stop at first/last
				cycle_next_file = true, -- Wrap around when navigating files (]f/[f): false to stop at first/last
			},

			-- Explorer panel configuration
			explorer = {
				position = "left", -- "left" or "bottom"
				width = 40, -- Width when position is "left" (columns)
				height = 15, -- Height when position is "bottom" (lines)
				indent_markers = true, -- Show indent markers in tree view (│, ├, └)
				initial_focus = "explorer", -- Initial focus: "explorer", "original", or "modified"
				icons = {
					folder_closed = "", -- Nerd Font folder icon (customize as needed)
					folder_open = "", -- Nerd Font folder-open icon
				},
				view_mode = "list", -- "list" or "tree"
				file_filter = {
					ignore = {}, -- Glob patterns to hide (e.g., {"*.lock", "dist/*"})
				},
				focus_on_select = false, -- Jump to modified pane after selecting a file (default: stay in explorer)
			},

			-- History panel configuration (for :CodeDiff history)
			history = {
				position = "bottom", -- "left" or "bottom" (default: bottom)
				width = 40, -- Width when position is "left" (columns)
				height = 15, -- Height when position is "bottom" (lines)
				initial_focus = "history", -- Initial focus: "history", "original", or "modified"
				view_mode = "list", -- "list" or "tree" for files under commits
			},

			-- Keymaps in diff view
			keymaps = {
				view = {
					quit = "q", -- Close diff tab
					toggle_explorer = "<leader>b", -- Toggle explorer visibility (explorer mode only)
					next_hunk = "]c", -- Jump to next change
					prev_hunk = "[c", -- Jump to previous change
					next_file = "]f", -- Next file in explorer/history mode
					prev_file = "[f", -- Previous file in explorer/history mode
					diff_get = "do", -- Get change from other buffer (like vimdiff)
					diff_put = "dp", -- Put change to other buffer (like vimdiff)
					open_in_prev_tab = "gf", -- Open current buffer in previous tab (or create one before)
					toggle_stage = "-", -- Stage/unstage current file (works in explorer and diff buffers)
					stage_hunk = "<leader>hs", -- Stage hunk under cursor to git index
					unstage_hunk = "<leader>hu", -- Unstage hunk under cursor from git index
					discard_hunk = "<leader>hr", -- Discard hunk under cursor (working tree only)
					show_help = "g?", -- Show floating window with available keymaps
				},
				explorer = {
					select = "<CR>", -- Open diff for selected file
					hover = "K", -- Show file diff preview
					refresh = "R", -- Refresh git status
					toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
					stage_all = "S", -- Stage all files
					unstage_all = "U", -- Unstage all files
					restore = "X", -- Discard changes (restore file)
				},
				history = {
					select = "<CR>", -- Select commit/file or toggle expand
					toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
				},
				conflict = {
					accept_incoming = "<leader>ct", -- Accept incoming (theirs/left) change
					accept_current = "<leader>co", -- Accept current (ours/right) change
					accept_both = "<leader>cb", -- Accept both changes (incoming first)
					discard = "<leader>cx", -- Discard both, keep base
					next_conflict = "]x", -- Jump to next conflict
					prev_conflict = "[x", -- Jump to previous conflict
					diffget_incoming = "2do", -- Get hunk from incoming (left/theirs) buffer
					diffget_current = "3do", -- Get hunk from current (right/ours) buffer
				},
			},
		},
	},
}
