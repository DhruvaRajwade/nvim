-- ~/.config/nvim/lua/lsp/servers/ruff.lua
-- Requires: pip install ruff

return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".git" },
	-- init_options = {
	-- 	settings = {
	-- 		-- Example: customize rules
	-- 		-- args = { "--select", "F401" },
	-- 	},
	-- },
}
