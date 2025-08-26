-- Install with
-- macOS: brew install texlab
-- Arch: pacman -S texlab
-- or: cargo install texlab

---@type vim.lsp.Config
return {
	cmd = { "texlab" },
	filetypes = { "tex", "bib" },
	root_markers = { ".git", ".latexmkrc", "main.tex" },
	settings = {
		texlab = {
			build = {
				executable = "latexmk",
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				onSave = true,
				forwardSearchAfter = false,
			},
			forwardSearch = {
				executable = "zathura",
				args = { "--synctex-forward", "%l:1:%f", "%p" },
			},
			auxDirectory = "build",
			diagnosticsDelay = 300,
			chktex = {
				onOpenAndSave = true,
				onEdit = false,
			},
		},
	},
}
