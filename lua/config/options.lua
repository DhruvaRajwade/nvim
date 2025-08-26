vim.cmd("set expandtab")

-- Set the width of a hard tabstop to 2 spaces
vim.cmd("set tabstop=2")

-- Set the number of spaces that a <Tab> counts for while performing editing operations
vim.cmd("set softtabstop=2")

-- Set the number of spaces to use for each step of (auto)indent
vim.cmd("set shiftwidth=2")

-- Set the leader key to space
vim.g.mapleader = " "

vim.opt.splitright = true

-- Enable true color support in the terminal
vim.opt.termguicolors = true

-- Enable relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.splitright = true
--Better search
vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true -- search matters if capital letter

-- Set the path to the Python interpreter for Neovim plugins
vim.g.python3_host_prog = "~/.pyenv/versions/neovim-env/bin/python"

-- Configure LSP settings for Python using 'pylsp' language server
-- vim.lsp.config("pylsp", {
-- 	cmd = { "pylsp" },
-- 	filetypes = { "python" },
-- 	root_markers = { ".git" }, -- Detect root using presence of .git directory
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				pycodestyle = { enabled = false }, -- disable pycodestyle
-- 				pyflakes = { enabled = false }, -- disable pyflakes
-- 				pylint = { enabled = false }, -- disable pylint
-- 				mccabe = { enabled = false }, -- disable complexity checker
-- 				black = { enabled = false }, -- disable Black formatter
-- 				yapf = { enabled = false }, -- disable Yapf formatter
-- 				isort = { enabled = false }, -- disable import sorter
-- 				autopep8 = { enabled = false }, -- disable autopep8
-- 			},
-- 		},
-- 	},
-- })
-- Disable loading of certain built-in Vim plugins to improve startup time
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip", -- disables reading/writing of .gz files
	"zip", -- disables reading/writing of .zip files
	"zipPlugin",
	"tar", -- disables reading/writing of .tar files
	"tarPlugin",
	"getscript", -- plugin to download scripts
	"getscriptPlugin",
	"vimball", -- plugin for creating self-installing Vim archives
	"vimballPlugin",
	"2html_plugin", -- converts buffer to HTML
	"logipat", -- plugin for log file patterns
	"rrhelper", -- remote debugging support
	"spellfile_plugin", -- spellfile features
	"matchit", -- extended matching for % (if/else, HTML tags, etc.)
}

-- Mark each plugin as loaded to disable them
for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
