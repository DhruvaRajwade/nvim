-- Install with
-- mac: brew install python-lsp-server
-- or: pip install 'python-lsp-server[all]'

---@type vim.lsp.Config
return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
	settings = {
		pylsp = {
			plugins = {
				-- Disable all formatting/linting providers to defer to Ruff/Conform
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
				preload = { enabled = false },
				ruff = { enabled = false }, -- Ensure pylsp doesn't invoke Ruff
			},
		},
	},
	handlers = {
		["textDocument/formatting"] = function() end,
		["textDocument/rangeFormatting"] = function() end,
	},
	flags = {
		allow_incremental_sync = true,
		debounce_text_changes = 150,
	},
}
