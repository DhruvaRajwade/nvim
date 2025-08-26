-- Install with
-- macOS: brew install vim-language-server
-- npm: npm install -g vim-language-server

---@type vim.lsp.Config
return {
	cmd = { "vim-language-server", "--stdio" },
	filetypes = { "vim" },
	root_markers = { ".git", ".vimrc", "init.vim" },
	settings = {
		vim = {
			suggest = {
				fromRuntimepath = true,
				fromVimruntime = true,
			},
			validate = true,
		},
	},
}
