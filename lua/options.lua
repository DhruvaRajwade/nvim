vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

--diagnostics

vim.diagnostic.config({
	virtual_text = false, -- off by default
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
