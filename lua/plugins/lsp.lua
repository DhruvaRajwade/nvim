return {
	-- 1. Mason.nvim setup
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- 2. Mason-LSPConfig.nvim setup - This is the core of your LSP server configuration
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig", -- lspconfig is a direct dependency
			"williamboman/mason.nvim",
			-- No need for blink.cmp as a direct dependency here if you're not configuring it.
			-- No need for lspkind.nvim here if you're not using it for LSP completion icons in this file.
			-- No need for ray-x/lsp_signature.nvim here if you're not configuring it in this file.
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			-- We no longer call blink.cmp.get_lsp_capabilities() here,
			-- as blink.cmp will handle its own capabilities.
			-- Use nvim-lspconfig's default capabilities which are suitable for most scenarios.
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- Default on_attach function with common LSP keymaps
			local on_attach_default = function(client, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			end

			mason_lspconfig.setup({
				ensure_installed = { "lua_ls", "vimls", "pylsp", "ruff", "marksman" },

				handlers = {
					-- Default handler for any server not explicitly listed below
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach_default,
						})
					end,

					-- Specific configuration for lua_ls
					lua_ls = function()
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							on_attach = on_attach_default,
							settings = {
								Lua = {
									workspace = {
										checkThirdParty = false,
										library = {
											[vim.fn.expand("$VIMRUNTIME/lua")] = true,
											[vim.fn.stdpath("config") .. "/lua"] = true, -- For your Neovim config files
										},
									},
									telemetry = {
										enable = false,
									},
									diagnostics = {
										globals = { "vim" }, -- Fix "undefined global 'vim'"
									},
								},
							},
						})
					end,

					-- Specific configuration for pylsp (no formatting/linting)
					pylsp = function()
						lspconfig.pylsp.setup({
							capabilities = capabilities,
							on_attach = on_attach_default, -- No custom on_attach needed just to disable formatting
							settings = {
								pylsp = {
									plugins = {
										-- Disable all linting/formatting plugins to avoid conflicts with Ruff/conform
										autopep8 = { enabled = false },
										black = { enabled = false },
										yapf = { enabled = false },
										flake8 = { enabled = false },
										pylint = { enabled = false },
										pycodestyle = { enabled = false },
										mypy = { enabled = false },
										pyflakes = { enabled = false },
										mccabe = { enabled = false },
										rope_autoimport = { enabled = false },
										isort = { enabled = false },
										pydocstyle = { enabled = false },
										preload = { enabled = false }, -- optional
										ruff = { enabled = false }, -- Ensure pylsp's ruff integration is off
									},
								},
							},
							-- Explicitly tell the server not to provide formatting capabilities
							flags = {
								allow_incremental_sync = true,
								debounce_text_changes = 150,
							},
							handlers = {
								["textDocument/formatting"] = function() end,
								["textDocument/rangeFormatting"] = function() end,
							},
						})
					end,

					ruff = function()
						lspconfig.ruff.setup({
							capabilities = capabilities,
							on_attach = on_attach_default,
						})
					end,
				},
			})

			vim.diagnostic.config({
				virtual_text = {
					end_col = true,
				},
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
	},
}
