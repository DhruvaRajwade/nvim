return {
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

	{
		"nvim-lsp-setup",
		dir = vim.fn.stdpath("config"),
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local config_path = vim.fn.stdpath("config") .. "/lsp"

			local function load_lsp_config(server_name)
				local config_file = config_path .. "/" .. server_name .. ".lua"
				local ok, config = pcall(dofile, config_file)
				if ok and config then
					return config
				end
				return nil
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()

			local on_attach_default = function(client, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			end

			local servers = { "html", "marksman", "lua_ls", "vim_ls", "pylsp", "ruff", "yamlls", "bashls", "texlab" }

			for _, server_name in ipairs(servers) do
				local config = load_lsp_config(server_name)
				if config then
					-- Merge with capabilities and on_attach
					config.capabilities = config.capabilities or capabilities
					config.on_attach = config.on_attach or on_attach_default

					vim.lsp.enable(server_name, config)
					-- else
					-- 	vim.lsp.enable(server_name, {
					-- 		capabilities = capabilities,
					-- 		on_attach = on_attach_default,
					-- 	})
				end
			end

			vim.diagnostic.config({
				virtual_lines = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = true,
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.WARN] = "WarningMsg",
					},
				},
			})
		end,
	},
}
