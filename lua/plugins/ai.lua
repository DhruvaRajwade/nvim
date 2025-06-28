return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false, -- Disabled by default
					auto_trigger = true, -- Auto-trigger ready when enabled
				},
				panel = { enabled = false },
			})
		end,
	},

	{
		"giuxtaposition/blink-cmp-copilot",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		lazy = true,
		event = "BufEnter",
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatReset",
			"CopilotChatSave",
			"CopilotChatLoad",
			"CopilotChatDebugInfo",
			"CopilotChatExplain",
			"CopilotChatTests",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatFixDiagnostic",
			"CopilotChatCommit",
			"CopilotChatCommitStaged",
			"CopilotChatReview",
			"CopilotChatModels",
			"CopilotChatAgents",
			"CopilotChatPrompts",
		},
		opts = {},
		config = function()
			require("CopilotChat").setup({

				system_prompt = "COPILOT_INSTRUCTIONS", -- System prompt to use (can be specified manually in prompt via /).

				model = "gpt-4.1", -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
				agent = "copilot", -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
				context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).
				sticky = nil, -- Default sticky prompt or array of sticky prompts to use at start of every new chat.

				temperature = 0.1, -- GPT result temperature
				headless = false, -- Do not write to chat buffer and use history (useful for using custom processing)
				stream = nil, -- Function called when receiving stream updates (returned string is appended to the chat buffer)
				callback = nil, -- Function called when full response is received (retuned string is stored to history)
				remember_as_sticky = true, -- Remember model/agent/context as sticky prompts when asking questions

				-- default selection
				-- see select.lua for implementation

				-- default window options
				window = {
					layout = "vertical", -- makes the window appear beside the current one
					width = 0.2, -- adjust width: 0.4 = 40% of total editor width
					height = 0.95, -- optional: almost full height
					position = "right", -- set to right side
				},

				show_help = true, -- Shows help message as virtual lines when waiting for user input
				highlight_selection = true, -- Highlight selection
				highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
				references_display = "virtual", -- 'virtual', 'write', Display references in chat as virtual text or write to buffer
				auto_follow_cursor = true, -- Auto-follow cursor in chat
				auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
				insert_at_end = false, -- Move cursor to end of buffer when inserting text
				clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

				-- Static config starts here (can be configured only via setup function)

				debug = false, -- Enable debug logging (same as 'log_level = 'debug')
				log_level = "info", -- Log level to use, 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
				proxy = nil, -- [protocol://]host[:port] Use this proxy
				allow_insecure = false, -- Allow insecure server connections

				chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)

				log_path = vim.fn.stdpath("state") .. "/CopilotChat.log", -- Default path to log file
				history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history

				question_header = "# User ", -- Header to use for user questions
				answer_header = "# Copilot ", -- Header to use for AI answers
				error_header = "# Error ", -- Header to use for errors
				separator = "───", -- Separator to use in chat

				-- default providers
				-- see config/providers.lua for implementation
				providers = {
					copilot = {},
					github_models = {},
					copilot_embeddings = {},
				},

				-- default contexts
				-- see config/contexts.lua for implementation
				contexts = {
					buffer = {},
					buffers = {},
					file = {},
					files = {},
					git = {},
					url = {},
					register = {},
					quickfix = {},
					system = {},
				},

				-- default prompts
				-- see config/prompts.lua for implementation
				prompts = {
					Explain = {
						prompt = "Write an explanation for the selected code as paragraphs of text.",
						system_prompt = "COPILOT_EXPLAIN",
						mapping = "<Leader>ze",
					},
					Review = {
						prompt = "Review the selected code.",
						system_prompt = "COPILOT_REVIEW",
						mapping = "<Leader>zr",
					},
					Fix = {
						prompt = "There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.",
						mapping = "<Leader>zf",
					},
					Optimize = {
						prompt = "Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.",
						mapping = "<Leader>zo",
					},
					Docs = {
						prompt = "Please add documentation comments to the selected code.",
						mapping = "<Leader>zd",
					},
					Tests = {
						prompt = "Please generate tests for my code.",
					},
					Commit = {
						prompt = "Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.",
						context = "git:staged",
						mapping = "<Leader>zc",
					},
				},

				-- default mappings
				-- see config/mappings.lua for implementation
				mappings = {
					complete = {
						insert = "<Tab>",
					},
					close = {
						normal = "q",
						insert = "<C-c>",
					},
					reset = {
						normal = "<C-l>",
						insert = "<C-l>",
					},
					submit_prompt = {
						normal = "<CR>",
						insert = "<C-s>",
					},
					toggle_sticky = {
						normal = "grr",
					},
					clear_stickies = {
						normal = "grx",
					},
					accept_diff = {
						normal = "<C-y>",
						insert = "<C-y>",
					},
					jump_to_diff = {
						normal = "gj",
					},
					quickfix_answers = {
						normal = "gqa",
					},
					quickfix_diffs = {
						normal = "gqd",
					},
					yank_diff = {
						normal = "gy",
						register = '"', -- Default register to use for yanking
					},
					show_diff = {
						normal = "gd",
						full_diff = false, -- Show full diff instead of unified diff when showing diff window
					},
					show_info = {
						normal = "gi",
					},
					show_context = {
						normal = "gc",
					},
					show_help = {
						normal = "gh",
					},
				},
			})
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					-- Set buffer-local options
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
					vim.opt_local.conceallevel = 0
				end,
			})
		end,
		-- See Commands section for default commands if you want to lazy load on them
	},
}
-- return {
--
-- 	{
-- 		"zbirenbaum/copilot.lua",
-- 		cmd = "Copilot",
-- 		event = "InsertEnter",
-- 		config = function()
-- 			require("copilot").setup({
-- 				panel = {
-- 					enabled = true,
-- 					auto_refresh = false,
-- 					keymap = {
-- 						jump_prev = "[[",
-- 						jump_next = "]]",
-- 						accept = "<CR>",
-- 						refresh = "gr",
-- 						open = "<M-CR>",
-- 					},
-- 					layout = {
-- 						position = "bottom", -- | top | left | right | horizontal | vertical
-- 						ratio = 0.4,
-- 					},
-- 				},
-- 				suggestion = {
-- 					enabled = true,
-- 					auto_trigger = true,
-- 					hide_during_completion = true,
-- 					debounce = 75,
-- 					trigger_on_accept = true,
-- 					keymap = {
-- 						accept = "<Tab>",
-- 						accept_word = false,
-- 						accept_line = false,
-- 						next = "<M-]>",
-- 						prev = "<M-[>",
-- 						dismiss = "<C-]>",
-- 					},
-- 				},
-- 				filetypes = {
-- 					yaml = false,
-- 					markdown = false,
-- 					help = false,
-- 					gitcommit = false,
-- 					gitrebase = false,
-- 					hgcommit = false,
-- 					svn = false,
-- 					cvs = false,
-- 					["."] = false,
-- 				},
-- 				auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
-- 				copilot_node_command = "node", -- Node.js version must be > 20
-- 				workspace_folders = {},
-- 				copilot_model = "",
-- 				root_dir = function()
-- 					return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
-- 				end,
-- 				server = {
-- 					type = "nodejs", -- "nodejs" | "binary"
-- 					custom_server_filepath = nil,
-- 				},
-- 				server_opts_overrides = {},
-- 			})
-- 		end,
-- 	},
-- }
